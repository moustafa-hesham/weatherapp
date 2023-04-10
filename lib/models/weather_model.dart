import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherCondition;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJason(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherCondition: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'Date = $date Temp= $temp MaxTemp=$maxTemp MinTemp=$minTemp Weather Condition = $weatherCondition';
  }

  String getImage() {
    if (weatherCondition == 'Sunny' ||
        weatherCondition == 'Clear' ||
        weatherCondition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy Cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherCondition == 'Sunny' ||
        weatherCondition == 'Clear' ||
        weatherCondition == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy Cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers	') {
      return Colors.blue;
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
