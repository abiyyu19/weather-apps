import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/firebase_options.dart';
import 'package:weather_apps/model/weather_model.dart';
import 'package:weather_apps/presentation/pages/home/home_page.dart';
import 'package:weather_apps/presentation/pages/login/login_page.dart';
import 'package:weather_apps/presentation/pages/login/verify_page.dart';
import 'package:weather_apps/presentation/pages/register/register_page.dart';
import 'package:weather_apps/presentation/pages/splash_screen.dart';
import 'package:weather_apps/presentation/pages/weather_details/weather_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
            GoRoute(
              path: 'verify',
              name: 'verify',
              builder: (context, state) {
                return const VerifyPage();
              },
            )
          ]),
      GoRoute(
          path: '/',
          name: 'home_page',
          builder: (context, state) {
            return HomePage();
          },
          routes: [
            GoRoute(
              path: 'weather_details',
              name: 'weather_details',
              builder: (context, state) {
                Object? object = state.extra;

                if (object != null && object is WeatherList) {
                  return WeatherDetailsPage(weatherList: object);
                } else {
                  return const WeatherDetailsPage();
                }
              },
            )
          ]),
      GoRoute(
        path: '/splash_screen',
        name: 'splash_screen',
        builder: (context, state) {
          return const SplashScreenPage();
        },
      )
    ],
    initialLocation: '/splash_screen',
    debugLogDiagnostics: true,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
