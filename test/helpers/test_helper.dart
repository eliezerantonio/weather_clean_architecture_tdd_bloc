import 'package:mockito/annotations.dart';
import 'package:weather_clean_architecture_tdd_bloc/data/data_sources/weather_remote_datasource_impl.dart';
import 'package:weather_clean_architecture_tdd_bloc/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_clean_architecture_tdd_bloc/domain/usecases/get_current_weather.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    GetCurrentWeatherUseCase
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
