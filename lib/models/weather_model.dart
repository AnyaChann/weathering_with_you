class Weather {
  final String time;
  final double temperature;
  final String icon;

  Weather({required this.time, required this.temperature, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      time: DateTime.parse(json['dt_txt']).hour.toString(), // Lấy giờ từ chuỗi thời gian
      temperature: json['main']['temp'], // Nhiệt độ (đã ở đơn vị Celsius do `units=metric`)
      icon: json['weather'][0]['icon'], // Icon thời tiết
    );
  }
}