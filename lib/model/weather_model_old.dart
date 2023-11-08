class WeatherOld {
  final String cityName;
  final double temperature;
  final String mainCondition;

  WeatherOld({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory WeatherOld.fromJson(Map<String, dynamic> json) {
    return WeatherOld(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
