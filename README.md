
# 🌦️ Dự báo Thời tiết - Flutter App

Ứng dụng Flutter hiển thị **dự báo thời tiết trong 24 giờ tiếp theo** sử dụng **OpenWeatherMap API**.

## 📱 1. Giới thiệu

Ứng dụng hiển thị:

- **Giờ**: Mốc thời gian dự báo (mỗi 3 giờ).
- **Nhiệt độ**: °C.
- **Icon**: Biểu tượng thời tiết (☀️ 🌧️ ☁️).

Thiết kế **đơn giản**, **hiện đại** và **dễ sử dụng**.

---

## 🛠️ 2. Công nghệ sử dụng

| Thành phần      | Công nghệ          |
|----------------|--------------------|
| Ngôn ngữ        | Dart               |
| Framework       | Flutter            |
| API             | OpenWeatherMap API |
| API Type        | 3-hour Forecast (free tier) |

---

## 💻 3. Cài đặt

### 3.1. Yêu cầu hệ thống

- Flutter SDK: `>= 2.10`
- Dart SDK: `>= 2.16`
- IDE: Visual Studio Code hoặc Android Studio
- API Key từ [OpenWeatherMap](https://openweathermap.org/)

### 3.2. Các bước cài đặt

```bash
# 1. Clone dự án
git clone https://github.com/AnyaChann/weathering_with_you.git

# 2. Cài đặt các dependency
flutter pub get

# 3. Thêm API Key vào file `weather_service.dart`
const String apiKey = "YOUR_API_KEY";

# 4. Chạy ứng dụng
flutter run
```

---

## 📁 4. Cấu trúc dự án (rút gọn)

```
lib/
├── main.dart
├── models/
│   └── weather_model.dart
├── services/
│   └── weather_service.dart
```

---

## 🔧 5. Chức năng chính

### ✅ Gọi API

- Gọi endpoint `forecast` từ OpenWeatherMap.
- Lấy dữ liệu cho 8 khoảng đầu tiên (24 giờ tiếp theo).

### ✅ Hiển thị thông tin thời tiết

- **Giờ**: Định dạng 24 giờ.
- **Nhiệt độ**: °C.
- **Icon**: Biểu tượng thời tiết từ API.

### ✅ Xử lý trạng thái

- `Loading`: Vòng tròn tải khi đang gọi API.
- `Error`: Khi xảy ra lỗi mạng hoặc API.
- `No Data`: Khi API không trả về dữ liệu.

---

## 🧭 6. Hướng dẫn sử dụng

1. Mở ứng dụng.
2. Ứng dụng tự động lấy dữ liệu theo vị trí mặc định:  
   **Hà Nội** *(lat: 21.0285, lon: 105.8542)*.
3. Xem danh sách dự báo thời tiết trong 24 giờ tiếp theo:
   - Thời gian
   - Nhiệt độ
   - Biểu tượng thời tiết

---

## 🌐 7. API sử dụng

### 7.1. Endpoint

- **URL**: `https://api.openweathermap.org/data/2.5/forecast`
- **Method**: `GET`

### 7.2. Tham số

| Tham số | Giá trị mẫu     | Mô tả                        |
|--------|-----------------|-----------------------------|
| `lat`  | `10.8231`       | Vĩ độ                        |
| `lon`  | `106.6297`      | Kinh độ                      |
| `units`| `metric`        | Đơn vị: °C                   |
| `appid`| `YOUR_API_KEY`  | API Key từ OpenWeatherMap    |

---

## 🚀 8. Cải tiến trong tương lai

- 🔍 Tìm kiếm theo tên thành phố.
- 📅 Dự báo theo ngày.
- 🗺️ Tích hợp bản đồ thời tiết.
- 🌍 Hỗ trợ đa ngôn ngữ.

---

## ⚠️ 9. Ghi chú

- Không chia sẻ **API Key** công khai.
- Gói miễn phí giới hạn: **60 requests/phút**.

---

## 📬 10. Liên hệ

- 📧 Email: `bachcter504@gmail.com`
- 🧑‍💻 GitHub: [GitHub Repository](https://github.com/AnyaChann/weathering_with_you.git)

---
