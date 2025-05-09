import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String apiKey = 'YOUR_API_KEY'; // Thay bằng API key của bạn
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<List<Weather>> fetchHourlyWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        '$apiUrl?lat=$lat&lon=$lon&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List forecastData = data['list'];
      return forecastData
          .take(8) // Lấy 8 khoảng thời gian (3 giờ mỗi khoảng, tương đương 24 giờ)
          .map((json) => Weather.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}