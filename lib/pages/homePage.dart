import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/searchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
        title: Text('Weather App'),
        titleSpacing: 0.0,
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There is no weather",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Start searching now",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Search Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.centerRight,
                      colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]!,
                    weatherData!.getThemeColor()[100]!,
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    '${Provider.of<WeatherProvider>(context, listen: false).cityName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                  Text(
                    'Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('${weatherData!.getImage()}'),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: TextStyle(fontSize: 34),
                      ),
                      Column(
                        children: [
                          Text('Min Temp: ${weatherData!.minTemp.toInt()}'),
                          Text('Max Temp: ${weatherData!.maxTemp.toInt()}')
                        ],
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherData!.weatherCondition,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
