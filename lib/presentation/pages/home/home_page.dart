import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_apps/presentation/widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weather App'),
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
