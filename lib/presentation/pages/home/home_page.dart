import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/widgets/weather_card.dart';
import 'package:weather_apps/services/firebase_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    log('ada isinya ga? ${user?.email}');
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              signOut().then(
                (value) => context.goNamed('login'),
              );
              // showDialog(
              //   context: context,
              //   builder: (context) => CustomAlertDialog(
              //     content: 'Apakah Anda yakin ingin Keluar?',
              //     onPressed: () {
              //       signOut().then(
              //         (value) => Navigator.pushReplacementNamed(context, '/'),
              //       );
              //     },
              //   ),
              // );
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[600],
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return WeatherCard(
              icon: const Icon(CupertinoIcons.cloud),
              date: 'Tue, Nov 07, 2023 10:00 AM',
              weather: 'Clouds',
              temp: '32.1',
              onPressed: () {
                context.goNamed('weather_details');
              },
            );
          },
        ),
      ),
    );
  }
}
