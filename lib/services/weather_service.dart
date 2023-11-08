import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_apps/model/weather_model.dart';
import 'package:http/http.dart' as http;

final _weatherService = WeatherService('70fabadb07692ff895c7d312ce34c5e2');

Future<Weather?> fetchWeather() async {
  String cityName = await _weatherService.getCurrentCity();

  log(cityName);

  try {
    // Lokasi yang didapatkan dari lokasi HP pengguna kadang tidak bisa digunakan
    // API openweathermap.org.
    // Lokasi yang saya gunakan adalah lokasi static Jakarta
    final weather = await _weatherService.getWeather('Jakarta');

    // log('$weather');

    if (weather != null) {
      log(cityName);
      // log('cuaca: $weather');
      return weather;
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

class WeatherService {
  static const baseUrlCurrent =
      'https://api.openweathermap.org/data/2.5/weather';
  static const baseUrlForecast =
      'https://api.openweathermap.org/data/2.5/forecast';
  final String apiKey;

  WeatherService(
    this.apiKey,
  );

  Future<Weather?> getWeather(String cityName) async {
    log(apiKey);
    log(baseUrlCurrent);
    log(baseUrlForecast);
    final response = await http.get(
        Uri.parse('$baseUrlForecast?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        // log(response.body);

        // log('ni ${response.body}');
        var weather = Weather.fromJson(jsonDecode(response.body));
        // log('ni $weather');
        return weather;
      }
    } else {
      throw Exception('Failed to get weather data');
    }
    return null;
  }

  Future<String> getCurrentCity() async {
    // Check Permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get user current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get user placemarks
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Get first placemark city
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
