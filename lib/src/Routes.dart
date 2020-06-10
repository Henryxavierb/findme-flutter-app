import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/src/screens/Splash.dart';
import 'package:frontend/src/screens/Home/View.dart';
import 'package:frontend/src/screens/Login/View.dart';
import 'package:frontend/src/screens/Register/View.dart';
import 'package:frontend/src/screens/Event/Detail/View.dart';
import 'package:frontend/src/screens/Notification/View.dart';
import 'package:frontend/src/screens/Profile/Photo/View.dart';
import 'package:frontend/src/screens/Profile/About/View.dart';
import 'package:frontend/src/screens/Password/Reset/View.dart';
import 'package:frontend/src/screens/Profile/Options/View.dart';
import 'package:frontend/src/screens/Password/Forgot/View.dart';
import 'package:frontend/src/screens/Profile/Details/View.dart';
import 'package:frontend/src/screens/Event/Create/Info/View.dart';
import 'package:frontend/src/screens/Event/Create/Social/View.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: "Find Me",
      initialRoute: '/home',
      theme: ThemeData(
        accentColor: Color(0xFF09B83E),
        primaryColor: Color(0xFF09B83E),
      ),
      routes: {
        "/login": (context) => LoginView(),
        "/splash": (context) => SpashView(),
        "/register": (context) => RegisterView(),
        "/password/reset": (context) => ResetPasswordView(),
        "/password/forgot": (context) => ForgotPasswordView(),

        // Required token authentication
        "/home": (context) => HomeView(),
        "/user/profile": (context) => ProfileView(),
        "/event/detail": (context) => DetailEventView(),
        "/event/create": (context) => CreateEventView(),
        "/event/create/social": (context) => SocialView(),
        "/profile/select": (context) => TypeProfileView(),
        "/profile/about": (context) => AboutProfileView(),
        "/profile/photo": (context) => SpreaderPhotoView(),
        "/user/notification": (context) => NotificationView(),
      },
    );
  }
}
