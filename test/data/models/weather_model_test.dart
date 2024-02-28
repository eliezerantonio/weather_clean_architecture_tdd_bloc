import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_clean_architecture_tdd_bloc/data/models/weather_model.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/entities/weather.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01n',
    temperature: 292.87,
    pressure: 1012,
    humidity: 70,
  );
  test('should be a subclass of weather entity', () async {
//assert

    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('shoud return valid model form json', () async {
//arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helpers/dummy_data/dummy_weather_response.json"));

//act
    final result = WeatherModel.fromJson(jsonMap);

    //expect

    expect(result, equals(testWeatherModel));
  });

  test('shoud return a json map containing proper data', () async {
//act
    final result = testWeatherModel.toJson();

    // assert
    final expectedJsonMap = {
      'weather': [
        {
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        }
      ],
      'main': {
        'temp': 292.87,
        'pressure': 1012,
        'humidity': 70,
      },
      'name': 'New York',
    };

    //expect

    expect(result, equals(expectedJsonMap));
  });
}
