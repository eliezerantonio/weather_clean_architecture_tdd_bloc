import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:weather_clean_architecture_tdd_bloc/core/error/failure.dart';

import 'package:weather_clean_architecture_tdd_bloc/domain/entities/weather.dart';

import '../../core/error/exception.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_sources/weather_remote_datasource_impl.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
