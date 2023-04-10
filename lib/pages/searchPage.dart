import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weatherservice.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Navigator.pop(context);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: Text('Search here'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      Navigator.pop(context);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;
                    },
                    child: Icon(Icons.search)),
                hintText: 'Enter a City',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
