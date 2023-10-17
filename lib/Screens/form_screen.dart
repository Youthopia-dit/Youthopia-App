import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/black_container.dart';
import 'package:youthopia/widgets/individual_registration_form.dart';
import 'package:youthopia/widgets/team_registration_form.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';
import '../utils/colors.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  int counter = 1;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
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
                  const TeamRegForm().paddingWithSymmetry(horizontal: 16),
                  const IndRegForm().paddingWithSymmetry(horizontal: 16),
                ],
              ).alignment(align: Alignment.topLeft),
            ),
          ],
        ),
      ).paddingWithSymmetry(horizontal: 20, vertical: 30),
    );
  }
}