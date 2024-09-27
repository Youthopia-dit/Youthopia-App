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
  const FormScreen({super.key, required this.event});
  final EventDetails event;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int disable = 0;
  @override
  void initState() {

    int max = widget.event.participantMax;
    int min = widget.event.participantMin;
    int initial = max <= 1 ? 1 : 0;
    disable = initial == 1 ? 0 : 1;
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
              onTap: (value) {
                if ( (tabController.indexIsChanging ?? false) &&
                    tabController.index == disable) {
                  tabController.index = tabController.previousIndex ?? 1;
                }
              },
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