import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson/login/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson/pages/featured_courses.dart';
import 'package:lesson/pages/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) =>  Login(),
            '/home': (context) =>  HomeScreen(),
            '/featured_courses':(context) => FeaturedCourses(),
          },
        );
      },
    );
  }
}
