import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd_bloc/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/entities/weather.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
