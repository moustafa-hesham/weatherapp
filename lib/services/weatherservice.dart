import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseURL = "http://api.weatherapi.com/v1";
  String apiKey = "38ca9c3f15e242328d6214111230104";
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=5');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJason(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
