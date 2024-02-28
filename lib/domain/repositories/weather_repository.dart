import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd_bloc/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
