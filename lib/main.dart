import 'package:flutter/material.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page1.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page3.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page4.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page5.dart';
import 'package:moofli_fullstack/completeprofilepgs.dart/page6.dart';
import 'package:moofli_fullstack/login-signup%20pages/loginpg.dart';
import 'package:moofli_fullstack/screens/diary_entry.dart';
import 'package:moofli_fullstack/constants/global_variables.dart';
import 'package:moofli_fullstack/screens/home.dart';
// import 'package:moofli_fullstack/screens/landingpg.dart';
import 'package:moofli_fullstack/provider_class/userprovider.dart';
import 'package:moofli_fullstack/router.dart';
import 'package:moofli_fullstack/screens/landingpg.dart';
import 'package:moofli_fullstack/services/auth_service.dart';
// import 'package:moofli_fullstack/login-signup%20pages/loginpg.dart';
// import 'package:moofli_fullstack/login-signup%20pages/signuppg1.dart';
// import 'package:moofli_fullstack/profile.dart';
// import 'package:moofli_fullstack/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final AuthService authService = AuthService();
  // authService.getUserData(context);
  // const MyApp({super.key});
  // @override
  // void initstate() {
  //   super.initstate();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moofli',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
       home: landingPage(),
      // onGenerateRoute: (settings) => generateRoute(settings),
      // home: Consumer<UserProvider>(
      //   builder: (context, userProvider, _) {
      //     if (userProvider.user.token.isNotEmpty) {
      //       if (userProvider.user.type == 'user') {
      //         return Diaryentry(); // Ensure DiaryEntry uses Scaffold
      //       } else {
      //         return const home_page(); // Ensure HomePage uses Scaffold
      //       }
      //     } else {
      //       return const landingPage(); // Ensure LandingPage uses Scaffold
      //     }
      //   },
      // ),
    );
  }
}
