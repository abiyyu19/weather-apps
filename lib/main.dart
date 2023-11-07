import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/pages/home/home_page.dart';
import 'package:weather_apps/presentation/pages/login/login_page.dart';
import 'package:weather_apps/presentation/pages/register/register_page.dart';
import 'package:weather_apps/presentation/pages/weather_details/weather_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return const LoginPage();
          },
          routes: [
            GoRoute(
                path: 'register',
                name: 'register',
                builder: (context, state) {
                  return const RegisterPage();
                }),
          ]),
      GoRoute(
          path: '/',
          name: 'home_page',
          builder: (context, state) {
            return const HomePage();
          },
          routes: [
            GoRoute(
              path: 'weather_details',
              name: 'weather_details',
              builder: (context, state) {
                return const WeatherDetailsPage();
              },
            )
          ])
    ],
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
