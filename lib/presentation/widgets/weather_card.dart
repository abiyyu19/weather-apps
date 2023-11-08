import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Image icon;
  final String date;
  final String weather;
  final double temp;
  final Function() onPressed;

  const WeatherCard({
    super.key,
    required this.icon,
    required this.date,
    required this.weather,
    required this.temp,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: ListTile(
        leading: icon,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Temp: $temp°C",
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
        // isThreeLine: true,
      ),
    );
  }
}
