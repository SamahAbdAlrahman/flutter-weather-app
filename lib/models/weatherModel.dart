class WeatherModel {
  final String description;
  final String icon;
  final double temp;
  final String cityName;

  WeatherModel({
    required this.description,
    required this.icon,
    required this.temp,
    required this.cityName,
  });

  factory WeatherModel.fromMap(map) {
    List weatherList = map['weather'];
    String description = weatherList[0]["description"];
    String icon = weatherList[0]["icon"];
    double temp = map["main"]["temp"];
    String cityName = map["name"];

    return WeatherModel(
      description: description,
      icon: icon,
      temp: temp,
      cityName: cityName,
    );
  }
}
