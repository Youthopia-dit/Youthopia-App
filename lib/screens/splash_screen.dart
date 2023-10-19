import 'package:flutter/material.dart';
import 'package:youthopia/data/backend.dart';
import 'package:youthopia/data/data_instance.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/screens/college_screen.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/snackbar.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/logo_widget.dart';
import 'navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  Future<bool> getEventsData() async {
    Api api = Api();
    final response = await api.getEventDetails();
    if (response.status == RequestStatus.FAILURE) {
      ShowSnackBar.snack(context,
          title: 'An Error Occurred!',
          message: response.message ?? '',
          type: 'failure');
      return false;
    } else {
      Data.eventList = response.body!;
      return true;
    }
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (await getEventsData()) {
      Auth auth = Auth();
      if (await auth.getToken() != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavbar()),
            (route) => false);
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CollegeScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          const HorizontalLogo().paddingForOnly(top: 30),
          Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('Assets/Group 6623.png'),
                  ]).paddingForOnly(top: 50),
              const Text(
                'Loading...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white,
                    fontSize: 24),
              ).paddingForOnly(top: 30),
            ],
          ),
          Image.asset('Assets/youthopia_white_flower.png')
              .paddingForOnly(bottom: 30)
        ]));
  }
}
