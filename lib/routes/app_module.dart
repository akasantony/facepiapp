import 'package:app/features/add_face/presentation/pages/capture_media.dart';
import 'package:app/features/add_face/presentation/pages/verify_image.dart';
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/welcome/presentation/pages/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app/routes/app_widget.dart';
import 'package:app/features/welcome/presentation/pages/welcome.dart';

class AppModule extends MainModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => WelcomePage()),
    Router("/verify", child: (_, args) => VerifyPhoneNumberPage()),
    Router("/home", child: (_, args) => HomePage()),
    Router("/captureface", child: (_, args) => CaptureMediaPage()),
    Router("/verifymedia", child: (_, args) => VerifyImagePage()),
//    Router("/dashboard", child: (_, args) => DashBoardPage()),
//    Router("/course/:id", child: (_, args) => CoursePage(courseID: args.params['id'])),
  ];

// add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}