import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 15,
          ),

          // Date
          Text(
            'Tuesday, Nov 07, 2023',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          // Time
          Text(
            '10:00 AM',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),

          // Temp and Icon
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '32.1',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(CupertinoIcons.cloud, size: 48),
              ],
            ),
          ),
          Text(
            'Clouds (few clouds)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Temp (min)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '30.5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Temp (max)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '32.1',
                    style: TextStyle(
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
