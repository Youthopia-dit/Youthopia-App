import 'package:flutter/material.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/black_container.dart';
import 'package:youthopia/widgets/individual_registration_form.dart';
import 'package:youthopia/widgets/team_registration_form.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';
import '../utils/colors.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.event}) : super(key: key);
  final EventDetails event;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {

    int max = widget.event.participantMax;
    int min = widget.event.participantMin;
    int initial = max <= 1 ? 1 : 0;
    tabController = TabController(
      initialIndex: initial,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: BlackContainer(
        child: Column(
          children: [
            const YouthopiaAppbar().paddingForOnly(top: 30, bottom: 10),
            TabBar(
              controller: tabController,
              labelColor: CustomColors.glowBlue,
              unselectedLabelColor: CustomColors.white.withOpacity(0.3),
              indicatorColor: CustomColors.glowBlue,
              physics: const NeverScrollableScrollPhysics(),
              dividerColor: CustomColors.white.withOpacity(0.3),
              tabs: const [
                Tab(
                  text: 'Teams',
                ),
                Tab(
                  text: 'Individual',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  TeamRegForm(details: widget.event,).paddingWithSymmetry(horizontal: 16),
                  IndRegForm(event: widget.event,).paddingWithSymmetry(horizontal: 16),
                ],
              ).alignment(align: Alignment.topLeft),
            ),
          ],
        ),
      ).paddingWithSymmetry(horizontal: 20, vertical: 30),
    );
  }
}