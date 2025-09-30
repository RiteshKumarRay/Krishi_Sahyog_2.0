# 🌾 Krishi Sahyog - Smart Crop Advisory App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white" alt="Firebase">
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android">
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License">
</p>

<p align="center">
  <strong>A multilingual AI-powered mobile application providing intelligent crop advisory services to farmers with real-time weather monitoring, soil health analysis, and voice support.</strong>
</p>

## 🌟 Features

### 🔐 Authentication
- **Google Sign-In Integration** - Seamless authentication using Google OAuth
- **Mock User Support** - Test accounts for different user roles (Farmer, Advisor, Admin)
- **Biometric Login** - Fingerprint/Face ID support for enhanced security
- **Phone Number** - Phone Number with OTP based authentication for low-literacy users

### 🌤️ Weather Dashboard
- **Real-time Weather Data** - Integration with OpenWeatherMap API
- **Location-based Forecasting** - GPS-based weather information
- **Agricultural Alerts** - Weather warnings specific to farming activities
- **Multi-language Support** - Hindi and English language options
- **Visual Weather Icons** - Day/night adaptive weather representations

### 🌱 Agricultural Services
- **Soil Health Monitoring** - Scan and analyze soil health report cards
- **Crop Advisory** - Personalized crop recommendations based on location and season
- **Pest Identification** - Camera-based pest and disease detection
- **Market Prices** - Real-time commodity pricing information

### 🎯 Smart Features
- **Voice Assistant** - AI-powered voice interaction in multiple languages
- **Offline Support** - Core features work without internet connectivity
- **Responsive Design** - Optimized for various screen sizes
- **Accessibility** - Designed for low-literacy users with voice and visual aids

## 🏗️ Technical Architecture

### Frontend
- **Framework**: Flutter 3.x
- **State Management**: Provider Pattern
- **UI Components**: Material Design 3
- **Responsive Design**: Sizer package for adaptive layouts

### Backend & APIs
- **Authentication**: Firebase Auth with Google Sign-In
- **Weather API**: OpenWeatherMap API
- **Location Services**: Geolocator package
- **Voice Recognition**: Flutter TTS/STT integration

### Key Dependencies

dependencies:
flutter:
sdk: flutter
firebase_auth: ^4.19.4
google_sign_in: ^6.2.1
sizer: ^2.0.15
http: ^1.2.0
geolocator: ^11.0.0
permission_handler: ^11.3.1
intl: ^0.19.0

text

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.x or higher)
- Android Studio / VS Code
- Firebase account
- OpenWeatherMap API key

### Installation

1. **Clone the repository**

git clone https://github.com/yourusername/Krishi-Sahyog.git
cd Krishi-Sahyog

text

2. **Install dependencies**

flutter pub get

text

3. **Firebase Setup**
- Create a new Firebase project
- Add Android app to Firebase project
- Download `google-services.json` and place in `android/app/`
- Enable Authentication > Google Sign-in

4. **API Configuration**
- Get OpenWeatherMap API key from [openweathermap.org](https://openweathermap.org/api)
- Add API key to `lib/services/weather_service.dart`

5. **Run the application**

flutter run

text

## 📱 Screenshots

<p align="center">
<img src="screenshots/login_screen.jpg" width="200" alt="Login Screen">
<img src="screenshots/dashboard.jpg" width="200" alt="Dashboard">
<img src="screenshots/weather.jpg" width="200" alt="Weather Dashboard">
<img src="screenshots/features.jpg" width="200" alt="Features">
</p>

The app supports multiple languages:
- **Hindi** - Primary language for Indian farmers
- **English** - Secondary language option
- **Punjabi** - other regional languages as well
- **Voice Support** - Audio in both languages

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Contribution Guidelines
- Follow Flutter/Dart style guide
- Add tests for new features
- Update documentation
- Ensure responsive design
- Test on multiple devices

## 🙏 Acknowledgments

- **OpenWeatherMap** - Weather API services
- **Firebase** - Backend and authentication services
- **Flutter Team** - Amazing cross-platform framework
- **Agricultural Department** - Domain expertise and guidance

## 📞 Support (not ready now)

For support, questions, or suggestions:
- Email: support@krishisahyog.com
- GitHub Issues: [Create an issue](https://github.com/yourusername/krishi-sahyog/issues)
- Documentation: [Wiki](https://github.com/yourusername/krishi-sahyog/wiki)


### Upcoming Features (v3.0)
- 🔄 AI-powered crop disease detection
- 🔄 IoT sensor integration
- 🔄 Community forum
- 🔄 Marketplace integration
- 🔄 Advanced analytics dashboard

----

<p align="center">
  Made with ❤️ for farmers by the Krishi Sahyog team
</p>

<p align="center">
  <a href="#top">⬆️ Back to Top</a>
</p>
