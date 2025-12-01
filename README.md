# 🚗 Car Rental App - Mobile UI Project

A modern, feature-rich car rental mobile application built with Flutter. This is a front-end only application that uses local JSON files to simulate backend data.

## 📱 Features

- **User Authentication**: Login system with local JSON validation
- **Car Browse**: View available cars with search and filter capabilities
- **Car Details**: Detailed view of each car with specifications
- **Booking System**: Rent cars with date selection and price calculation
- **Modern UI**: Clean, responsive design with smooth animations
- **Dark Mode Support**: Toggle between light and dark themes
- **Favorites**: Save favorite cars for quick access

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Installation

1. **Clone or navigate to the project directory**
   ```bash
   cd MAP_Project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
car_rental_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   │   ├── user.dart
│   │   ├── car.dart
│   │   └── rental.dart
│   ├── services/                 # Business logic & data services
│   │   ├── auth_service.dart
│   │   ├── car_service.dart
│   │   └── rental_service.dart
│   ├── screens/                  # UI screens
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── car_details_screen.dart
│   │   └── booking_screen.dart
│   ├── widgets/                  # Reusable components
│   │   ├── car_card.dart
│   │   ├── custom_button.dart
│   │   └── custom_text_field.dart
│   └── utils/                    # Utilities & constants
│       ├── constants.dart
│       └── theme.dart
├── assets/
│   ├── data/                     # JSON data files
│   │   ├── users.json
│   │   ├── cars.json
│   │   └── rentals.json
│   └── images/                   # Car images (placeholders)
└── pubspec.yaml                  # Dependencies
```

## 🔐 Test Credentials

Use these credentials to login:

- **Email**: `john@example.com` | **Password**: `password123`
- **Email**: `jane@example.com` | **Password**: `password456`
- **Email**: `admin@example.com` | **Password**: `admin123`

## 📊 JSON Data Structure

### users.json
Contains user credentials and profile information.

### cars.json
Contains available cars with:
- Basic info (name, brand, model, year)
- Specifications (engine, seats, fuel type, transmission)
- Pricing and availability
- Images and features

### rentals.json
Stores booking information:
- User details
- Car details
- Rental dates
- Total price
- Booking status

## 🎨 Features Implemented

### Required Features ✅
- ✅ Login Page with JSON validation
- ✅ Home Page with car listing
- ✅ Car Details Page with specifications
- ✅ Booking/Rental Page with form

### Bonus Features ⭐
- ✅ Search functionality
- ✅ Filter by category, price, brand
- ✅ Dark mode support
- ✅ Smooth animations and transitions
- ✅ Favorites list
- ✅ Responsive layout
- ✅ Modern Material Design 3
- ✅ Date picker for rental dates
- ✅ Price calculation
- ✅ Form validation
- ✅ Persistent login (SharedPreferences)

## 🛠️ Technologies Used

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **State Management**: StatefulWidget & setState
- **Data Storage**: Local JSON files
- **UI**: Material Design 3
- **Persistence**: SharedPreferences

## 📱 Screens Overview

### 1. Login Screen
- Email and password input fields
- Form validation
- Error handling for invalid credentials
- Auto-navigation on success

### 2. Home Screen
- Grid/List view of available cars
- Search bar for filtering
- Category filters (SUV, Sedan, Sports, etc.)
- Price range filter
- Dark mode toggle
- Navigation to car details

### 3. Car Details Screen
- High-quality car images
- Comprehensive specifications
- Price per day
- Feature highlights
- Favorite button
- Rent now action

### 4. Booking Screen
- User information (auto-filled)
- Start and end date pickers
- Duration calculation
- Total price calculation
- Booking confirmation
- Form validation

## 🎯 How It Works

1. **Authentication**: The app reads `users.json` and validates credentials
2. **Car Listing**: Cars are loaded from `cars.json` and displayed with filters
3. **Car Details**: Selected car data is passed to the details screen
4. **Booking**: Form data is validated and saved to `rentals.json`
5. **Persistence**: User session is maintained using SharedPreferences

## 🚧 Future Enhancements

- Payment integration simulation
- Booking history
- User profile management
- Car comparison feature
- Reviews and ratings
- Map integration for pickup locations
- Push notifications simulation

## 📝 Notes

- This is a **UI-only project** with no real backend
- All data is stored locally in JSON files
- The app simulates API responses using local data
- Perfect for demonstrating Flutter UI/UX skills
- Ready for backend integration

## 👨‍💻 Development

To modify the data:
1. Edit JSON files in `assets/data/`
2. Run `flutter pub get` if you change assets
3. Hot reload/restart the app

## 📄 License

This is a university project for educational purposes.

## 🤝 Contributing

This is a student project. Feel free to fork and enhance!

---

**Built with ❤️ using Flutter**
"# MapProject" 
