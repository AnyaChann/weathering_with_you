import 'package:flutter/material.dart';
import 'models/weather_model.dart';
import 'services/weather_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  late Future<List<Weather>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = _weatherService.fetchHourlyWeather(10.8231, 106.6297); // Tọa độ Hồ Chí Minh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('24 Hours Weather Forecast'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Weather>>(
        future: _weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final weatherList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: weatherList.length,
              itemBuilder: (context, index) {
                final weather = weatherList[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  color: const Color.fromARGB(255, 27, 232, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      '${weather.time}:00',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${weather.temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 235, 218, 157),
                      ),
                    ),
                    // trailing: const Icon(
                    //   Icons.arrow_forward_ios,
                    //   size: 16,
                    //   color: Colors.grey,
                    // ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}