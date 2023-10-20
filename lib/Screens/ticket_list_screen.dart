import 'package:flutter/material.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/utils/snackbar.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/ticket_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

import '../data/models/ticket_model.dart';
import '../data/shared_preferences.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  bool isLoading = false;
  List<TicketDetails> list = [];
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    loadData();
    super.initState();
  }

  void loadData() async {
    Auth auth = Auth();
    final response = await auth.getRegisteredEvents();
    if (response.status == RequestStatus.SUCCESS) {
      list = response.body!;
    } else {
      ShowSnackBar.snack(context,
          title: 'Error', message: 'Failed to fetch details', type: 'failure');
      list = [];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: ListView(
      children: [
        const YouthopiaAppbar(),
        (isLoading)
            ? const CircularProgressIndicator().wrapCenter()
            : ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return TicketContainer(
                    ticket: list[index]
                  ).paddingWithSymmetry(horizontal: 20, vertical: 10);
                }),
        SizedBox(height: 50,)
      ],
    ));
  }
}
