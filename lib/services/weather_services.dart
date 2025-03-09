import 'package:dio/dio.dart';

import '../models/weatherModel.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey = "3ea8844812cd95db14225d897eb11bf9";


  // fun
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get('${baseUrl}',
          queryParameters: {
        "q": cityName,
        "units": "metric",
        "appid": apiKey,
      });

      WeatherModel weatherModel = WeatherModel.fromMap(response.data);

      return weatherModel;

    } catch (error) {
      throw Exception(error);
    }
  }
}
