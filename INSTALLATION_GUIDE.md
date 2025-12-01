# 🚀 Installation & Setup Guide

This guide will help you set up and run the Car Rental App on your local machine.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Flutter SDK** (version 3.0.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Follow the installation guide for your operating system

2. **Dart SDK** (comes with Flutter)
   - Automatically included with Flutter SDK

3. **Code Editor** (choose one):
   - **Visual Studio Code** (recommended)
     - Install Flutter extension
     - Install Dart extension
   - **Android Studio**
     - Install Flutter plugin
     - Install Dart plugin

4. **Mobile Emulator or Physical Device**
   - **Android**: Android Studio Emulator or physical device with USB debugging
   - **iOS**: Xcode Simulator (macOS only) or physical device
   - **Chrome**: For web testing (optional)

## 🔧 Step-by-Step Installation

### Step 1: Verify Flutter Installation

Open a terminal/command prompt and run:

```bash
flutter doctor
```

This command checks your environment and displays a report. Ensure all checkmarks are green for your target platform.

### Step 2: Navigate to Project Directory

```bash
cd C:\Users\Owner\Desktop\MAP_Project
```

Or use your file explorer to open the project in your IDE.

### Step 3: Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

This will download all dependencies listed in `pubspec.yaml`.

### Step 4: Verify Project Structure

Ensure all files are present:

```
MAP_Project/
├── lib/
├── assets/
│   ├── data/
│   │   ├── users.json
│   │   ├── cars.json
│   │   └── rentals.json
│   └── images/
└── pubspec.yaml
```

### Step 5: Check for Errors

Run the analyzer to check for any issues:

```bash
flutter analyze
```

Fix any errors or warnings that appear.

## 📱 Running the Application

### Option 1: Using Command Line

1. **List available devices:**
   ```bash
   flutter devices
   ```

2. **Run on specific device:**
   ```bash
   flutter run
   ```

   Or specify a device:
   ```bash
   flutter run -d <device-id>
   ```

3. **Run in debug mode (default):**
   ```bash
   flutter run
   ```

4. **Run in release mode:**
   ```bash
   flutter run --release
   ```

### Option 2: Using Visual Studio Code

1. Open the project in VS Code
2. Select your target device from the status bar (bottom right)
3. Press `F5` or click "Run" → "Start Debugging"
4. Or use `Ctrl+F5` for "Run Without Debugging"

### Option 3: Using Android Studio

1. Open the project in Android Studio
2. Select your target device from the toolbar
3. Click the "Run" button (green play icon)
4. Or press `Shift+F10`

## 🎯 First Time Setup

### Create Android Emulator (if needed)

```bash
# Open Android Virtual Device Manager
flutter emulators

# Launch an emulator
flutter emulators --launch <emulator-id>
```

### Create iOS Simulator (macOS only)

```bash
# List available simulators
xcrun simctl list

# Launch simulator
open -a Simulator
```

## 🐛 Troubleshooting

### Common Issues and Solutions

#### Issue 1: "pubspec.yaml not found"

**Solution:** Ensure you're in the correct directory:
```bash
cd MAP_Project
pwd  # or 'cd' on Windows to check current directory
```

#### Issue 2: "Assets not found"

**Solution:** Make sure assets are declared in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/data/
    - assets/images/
```

Then run:
```bash
flutter pub get
```

#### Issue 3: "Gradle build failed" (Android)

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### Issue 4: "CocoaPods errors" (iOS/macOS)

**Solution:**
```bash
cd ios
pod install
cd ..
flutter clean
flutter pub get
flutter run
```

#### Issue 5: "Network images not loading"

**Solution:**
- Check internet connection
- For Android: Ensure `android/app/src/main/AndroidManifest.xml` has internet permission:
  ```xml
  <uses-permission android:name="android.permission.INTERNET"/>
  ```

#### Issue 6: "Hot reload not working"

**Solution:**
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Or stop and restart the app

## 🧪 Testing the Application

### Login Credentials

Use these test accounts:

| Email | Password | User |
|-------|----------|------|
| john@example.com | password123 | John Doe |
| jane@example.com | password456 | Jane Smith |
| admin@example.com | admin123 | Admin User |

### Test Workflow

1. **Login:**
   - Enter email and password
   - Click "Login" button
   - Should navigate to Home screen

2. **Browse Cars:**
   - View car grid
   - Use search bar
   - Apply category filters
   - Toggle favorites

3. **View Car Details:**
   - Tap any car card
   - Review specifications
   - Check features
   - Toggle favorite

4. **Book a Car:**
   - Click "Rent Now"
   - Select start date
   - Select end date
   - Review price calculation
   - Confirm booking
   - See success message

## 📊 Performance Tips

### For Better Performance

1. **Run in Release Mode for testing:**
   ```bash
   flutter run --release
   ```

2. **Profile the app:**
   ```bash
   flutter run --profile
   ```

3. **Check for performance issues:**
   ```bash
   flutter run --trace-skia
   ```

## 🔄 Development Commands

### Useful Flutter Commands

```bash
# Clean build cache
flutter clean

# Update dependencies
flutter pub upgrade

# Format code
flutter format lib/

# Analyze code
flutter analyze

# Build APK (Android)
flutter build apk

# Build App Bundle (Android)
flutter build appbundle

# Build iOS app
flutter build ios

# Build web app
flutter build web
```

## 📦 Building for Production

### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (Google Play)

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS (macOS only)

```bash
flutter build ios --release
```

Then open in Xcode for archiving.

## 🌐 Running on Web (Optional)

```bash
# Enable web support (first time only)
flutter config --enable-web

# Run on web
flutter run -d chrome

# Build web app
flutter build web
```

## 📱 Running on Different Platforms

### Android

```bash
flutter run -d android
```

### iOS (macOS only)

```bash
flutter run -d ios
```

### Web

```bash
flutter run -d chrome
```

## 🔍 Debugging

### Enable Debugging

1. **View logs:**
   ```bash
   flutter logs
   ```

2. **Open DevTools:**
   ```bash
   flutter pub global activate devtools
   flutter pub global run devtools
   ```

3. **Inspect widget tree:**
   - Press `w` in terminal while app is running

4. **Debug painting:**
   - Press `p` in terminal

## 📸 Taking Screenshots

While the app is running, press `s` in the terminal to save a screenshot.

## 💡 Tips for Students

1. **Hot Reload**: Press `r` after making UI changes (fast)
2. **Hot Restart**: Press `R` after changing logic (slower)
3. **Clear Cache**: Run `flutter clean` if you encounter weird issues
4. **Check Logs**: Always check console output for errors
5. **Use VS Code**: The Flutter extension provides great debugging tools

## 🎓 Learning Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter YouTube Channel](https://www.youtube.com/flutterdev)
- [Flutter Community](https://flutter.dev/community)

## ✅ Verification Checklist

Before submitting your project, verify:

- [ ] App runs without errors
- [ ] All screens are accessible
- [ ] Login works with test credentials
- [ ] Car listing displays correctly
- [ ] Search and filters work
- [ ] Car details page shows all information
- [ ] Booking flow completes successfully
- [ ] No console errors or warnings
- [ ] Code is properly formatted
- [ ] README is complete

## 🆘 Getting Help

If you encounter issues:

1. Check this guide's troubleshooting section
2. Review Flutter documentation
3. Search Stack Overflow
4. Check Flutter GitHub issues
5. Ask your instructor or TA

## 📧 Support

For project-specific questions, refer to:
- `README.md` - Project overview
- `PROJECT_STRUCTURE.md` - Architecture details
- This file - Installation help

---

**Good luck with your project! 🚀**

*Last updated: 2024*
