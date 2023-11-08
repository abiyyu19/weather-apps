import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_apps/model/weather_model.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({
    super.key,
    this.weatherList,
  });

  final WeatherList? weatherList;

  @override
  Widget build(BuildContext context) {
    var formatterDate = DateFormat('EEEE, MMM dd, yyyy');
    var formatterTime = DateFormat('h:mm a');

    var iconUrl =
        "http://openweathermap.org/img/w/${weatherList?.weather[0].icon}.png";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),

          // Date
          Text(
            formatterDate.format(weatherList!.dtTxt),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          // Time
          Text(
            formatterTime.format(weatherList!.dtTxt),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),

          // Temp and Icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weatherList?.main.temp}°C',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                  ),
                ),
                // const SizedBox(
                //   width: 15,
                // ),
                Image.network(
                  iconUrl,
                  scale: 0.6,
                )
              ],
            ),
          ),
          Text(
            '${weatherList?.weather[0].main} (${weatherList?.weather[0].description})',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Temp (min)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${weatherList?.main.tempMin}°C',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Temp (max)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${weatherList?.main.tempMax}°C',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
