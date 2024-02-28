import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/entities/weather.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/usecases/get_current_weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: "Lubango",
    main: "Clouds",
    description: "few clouds",
    iconCode: "02d",
    temperature: 302.28,
    pressure: 1009,
    humidity: 50,
  );

  const testCityName = 'Lubango';
  test('should get current weather deatil fro the repository', () async {
    //Arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));
    //Act
    final result = await getCurrentWeatherUseCase.execute(testCityName);
    //Assert

    expect(result, const Right(testWeatherDetail));
  });
}
