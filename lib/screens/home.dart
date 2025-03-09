import 'package:flutter/material.dart';

import '../models/weatherModel.dart';
import '../services/weather_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? errorMsg;
  final TextEditingController _cityController = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weatherData;

  void _fetchWeather() async {
    try {
      WeatherModel weather =
      await _weatherService.getCurrentWeather(cityName: _cityController.text);

      setState(() {
        errorMsg=null;
        _weatherData = weather;
      });
    } catch (e) {
      setState(() {
        errorMsg = e.toString(); //
      });
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Search City Name"),
      ), // AppBar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  hintText: "Enter city name",
                ),
              ), // TextFormField
              const SizedBox(height: 20),
              ElevatedButton(

                onPressed: () {
                  if (_cityController.text.isNotEmpty) {
                    _fetchWeather();
                  } else {
                    setState(() {
                      errorMsg = "Please enter a city name";
                    });
                  }
                },
                child: const Text("Search"),
              ),
              // عرض رسالة الخطأ إن وجدت
              if (errorMsg != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMsg!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (_weatherData != null)
                Column(
                  children: [
                    Text(
                      "City: ${_weatherData!.cityName}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Temperature: ${_weatherData!.temp}°C"),
                    Text("Description: ${_weatherData!.description}"),
                    Image.network(
                        "https://openweathermap.org/img/w/${_weatherData!.icon}.png"),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
