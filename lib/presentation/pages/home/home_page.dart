import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/widgets/weather_card.dart';
import 'package:weather_apps/services/firebase_service.dart';
import 'package:weather_apps/services/weather_service.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: FutureBuilder(
        future: fetchWeather(),
        builder: (context, snapshot) {
          // log(snapshot.data!.city.name);
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            var cuaca = snapshot.data!;

            var formatter = DateFormat('EEE, MMM dd, yyyy h:mm a');

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[600],
                ),
                itemCount: cuaca.list.length,
                itemBuilder: (BuildContext context, int index) {
                  var iconUrl =
                      "http://openweathermap.org/img/w/${cuaca.list[index].weather[0].icon}.png";
                  log(iconUrl);
                  return WeatherCard(
                    icon: Image.network(iconUrl),
                    date: formatter.format(cuaca.list[index].dtTxt),
                    weather: cuaca.list[index].weather[0].main,
                    temp: cuaca.list[index].main.temp,
                    onPressed: () {
                      context.goNamed(
                        'weather_details',
                        extra: cuaca.list[index],
                      );
                    },
                  );
                },
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: const Center(
                child: Text(
                  'Data Cuaca gagal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
