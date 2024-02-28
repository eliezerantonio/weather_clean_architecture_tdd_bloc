import 'dart:convert';

import 'package:weather_clean_architecture_tdd_bloc/core/constants/constants.dart';
import 'package:weather_clean_architecture_tdd_bloc/core/error/exception.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl(this.client);
  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

       if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
