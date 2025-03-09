class WeatherModel {
  // attributes
  final String description;
  final String icon;
  final double temp;
  final String cityName;
// Constructor
  WeatherModel({
    required this.description,
    required this.icon,
    required this.temp,
    required this.cityName,
  });
// Map -> Factory Constructor
// to convert JSON to WeatherModel
  factory WeatherModel.fromMap(map) {
    // Extract data from JSON

//   "weather": [
//     {
//       "description": ...,
//       "icon": ...,
//     }
//   ]

    List weatherList = map['weather'];
    String description = weatherList[0]["description"];
    String icon = weatherList[0]["icon"];

    // "main": {
    // "temp": 287.32,
    // "feels_like": 286.31,
    // "temp_min": 286.01,
    // "temp_max": 288.21,
    // "pressure": 1001,
    // "humidity": 58,
    // "sea_level": 1001,
    // "grnd_level": 997
    // },
    double temp = map["main"]["temp"];
  // "name": ...,
      String cityName = map["name"];

    return WeatherModel(
      description: description,
      icon: icon,
      temp: temp,
      cityName: cityName,
    );
  }
}
