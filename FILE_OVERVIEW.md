# 📁 Complete File Overview

This document lists all files in the Car Rental App project with descriptions.

## 📊 Project Statistics

- **Total Files**: 28
- **Dart Files**: 14
- **JSON Files**: 3
- **Documentation Files**: 7
- **Configuration Files**: 4

---

## 🗂️ File Structure

```
MAP_Project/
├── lib/                                 # Source code directory
│   ├── main.dart                        # App entry point (140 lines)
│   ├── models/                          # Data models
│   │   ├── user.dart                    # User model (50 lines)
│   │   ├── car.dart                     # Car model (75 lines)
│   │   └── rental.dart                  # Rental model (60 lines)
│   ├── services/                        # Business logic
│   │   ├── auth_service.dart            # Authentication (70 lines)
│   │   ├── car_service.dart             # Car operations (120 lines)
│   │   └── rental_service.dart          # Rental operations (85 lines)
│   ├── screens/                         # UI screens
│   │   ├── login_screen.dart            # Login page (260 lines)
│   │   ├── home_screen.dart             # Home/listing page (320 lines)
│   │   ├── car_details_screen.dart      # Details page (380 lines)
│   │   └── booking_screen.dart          # Booking page (450 lines)
│   ├── widgets/                         # Reusable components
│   │   ├── car_card.dart                # Car card widget (180 lines)
│   │   ├── custom_button.dart           # Button widget (60 lines)
│   │   └── custom_text_field.dart       # Text field widget (90 lines)
│   └── utils/                           # Utilities
│       ├── constants.dart               # App constants (70 lines)
│       └── theme.dart                   # Theme config (90 lines)
├── assets/                              # Static assets
│   ├── data/                            # JSON data files
│   │   ├── users.json                   # User data (3 users)
│   │   ├── cars.json                    # Car data (12 cars)
│   │   └── rentals.json                 # Rental data (2 samples)
│   └── images/                          # Image assets
│       └── .gitkeep                     # Git folder placeholder
├── pubspec.yaml                         # Dependencies & config
├── analysis_options.yaml                # Code quality rules
├── .gitignore                          # Git ignore rules
├── README.md                            # Main documentation
├── PROJECT_STRUCTURE.md                 # Architecture guide
├── INSTALLATION_GUIDE.md                # Setup instructions
├── FEATURES.md                          # Feature documentation
├── QUICK_START.md                       # Quick start guide
├── SUBMISSION_CHECKLIST.md              # Submission checklist
└── FILE_OVERVIEW.md                     # This file
```

---

## 📄 Detailed File Descriptions

### 🎯 Root Configuration Files

#### `pubspec.yaml`
**Purpose:** Flutter project configuration
**Contains:**
- Project name and description
- SDK version constraints
- Dependencies (intl, shared_preferences)
- Asset declarations
- App metadata

#### `analysis_options.yaml`
**Purpose:** Dart/Flutter code analysis rules
**Contains:**
- Linter rules
- Code style preferences
- Best practice enforcement

#### `.gitignore`
**Purpose:** Git version control exclusions
**Contains:**
- Build artifacts
- IDE files
- Generated files
- Platform-specific folders

---

### 📱 Source Code Files

### Main Application

#### `lib/main.dart`
**Purpose:** Application entry point
**Key Features:**
- App initialization
- Theme configuration
- Splash screen with animations
- Auto-login check
- Navigation setup

**Key Components:**
- `MyApp` - Root application widget
- `SplashScreen` - Animated splash with brand identity

---

### 📦 Models (`lib/models/`)

#### `user.dart`
**Purpose:** User data model
**Properties:**
- id, name, email
- password, phone, address
**Methods:**
- `fromJson()` - JSON deserialization
- `toJson()` - JSON serialization
- `copyWith()` - Immutable updates

#### `car.dart`
**Purpose:** Car data model
**Properties:**
- Basic: id, name, brand, model, year
- Specs: seats, transmission, fuelType, engine
- Pricing: pricePerDay, rating
- Media: image, color
- Details: features[], description, available
**Methods:**
- `fromJson()` - JSON deserialization
- `toJson()` - JSON serialization

#### `rental.dart`
**Purpose:** Rental/booking data model
**Properties:**
- IDs: id, userId, carId
- User info: userName, userEmail
- Rental: startDate, endDate, days
- Pricing: pricePerDay, totalPrice
- Status: status, bookingDate
**Methods:**
- `fromJson()` - JSON deserialization
- `toJson()` - JSON serialization

---

### 🔧 Services (`lib/services/`)

#### `auth_service.dart`
**Purpose:** Authentication & session management
**Key Methods:**
- `login()` - Validate credentials from JSON
- `logout()` - Clear session
- `getCurrentUser()` - Get logged-in user
- `isLoggedIn()` - Check login status
**Storage:** SharedPreferences for session

#### `car_service.dart`
**Purpose:** Car data operations
**Key Methods:**
- `getAllCars()` - Load all cars from JSON
- `getCarById()` - Get specific car
- `searchCars()` - Search functionality
- `filterCars()` - Filter by category/price/brand
- `toggleFavorite()` - Manage favorites
- `getFavorites()` - Get favorite car IDs
**Features:**
- In-memory caching
- Persistent favorites

#### `rental_service.dart`
**Purpose:** Rental/booking operations
**Key Methods:**
- `createRental()` - Create new booking
- `getAllRentals()` - Get all rentals
- `getUserRentals()` - Get user's bookings
- `isCarAvailable()` - Check availability
- `calculateDays()` - Date calculations
- `calculateTotalPrice()` - Price calculations

---

### 🖼️ Screens (`lib/screens/`)

#### `login_screen.dart`
**Purpose:** User authentication screen
**Features:**
- Email/password input
- Form validation
- Password visibility toggle
- Error handling
- Test credentials display
- Auto-navigation on success
**UI Elements:**
- Custom text fields
- Custom button
- Error messages
- Test account chips

#### `home_screen.dart`
**Purpose:** Car listing and browsing
**Features:**
- Car grid display
- Search functionality
- Category filters
- User profile display
- Favorites management
- Dark mode toggle
- Logout functionality
**UI Elements:**
- Search bar
- Filter chips
- Car cards grid
- User avatar
- Empty state

#### `car_details_screen.dart`
**Purpose:** Detailed car information
**Features:**
- Hero image animation
- Specifications grid
- Features chips
- Description
- Favorite toggle
- Rent Now action
**UI Elements:**
- Expandable app bar
- Specification cards
- Feature chips
- Gradient overlays
- Fixed bottom bar

#### `booking_screen.dart`
**Purpose:** Car rental booking
**Features:**
- Auto-filled user info
- Date pickers (start/end)
- Price calculation
- Form validation
- Booking confirmation
- Success dialog
**UI Elements:**
- Car summary card
- Date selectors
- Price summary
- Confirmation dialog

---

### 🧩 Widgets (`lib/widgets/`)

#### `car_card.dart`
**Purpose:** Reusable car display card
**Features:**
- Car image with fallback
- Car details (name, year, category)
- Rating display
- Price display
- Quick specs (seats, transmission, fuel)
- Favorite button
- Availability badge
**Customization:**
- Tap callback
- Favorite state
- Favorite toggle callback

#### `custom_button.dart`
**Purpose:** Reusable styled button
**Features:**
- Loading state
- Icon support
- Custom colors
- Full-width option
- Disabled state
**Props:**
- text, onPressed, isLoading
- icon, backgroundColor, textColor
- width

#### `custom_text_field.dart`
**Purpose:** Reusable input field
**Features:**
- Label and hint text
- Prefix icon
- Suffix widget
- Password obscure toggle
- Form validation
- Read-only mode
**Props:**
- controller, label, hint
- prefixIcon, obscureText
- validator, readOnly, onTap

---

### 🎨 Utils (`lib/utils/`)

#### `constants.dart`
**Purpose:** App-wide constants
**Contains:**
- App name
- Animation durations
- Padding values (default, small, large)
- Border radius values
- Elevation values
- Color palette
- Text styles

#### `theme.dart`
**Purpose:** App theming configuration
**Contains:**
- Light theme
- Dark theme
- Material Design 3 setup
- Color schemes
- Component themes (AppBar, Card, Button, Input)

---

### 💾 Data Files (`assets/data/`)

#### `users.json`
**Purpose:** User authentication data
**Contains:**
- 3 test user accounts
- Email, password, profile data
**Size:** ~500 bytes
**Sample User:**
```json
{
  "id": "1",
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "phone": "+1 234 567 8900",
  "address": "123 Main Street, NY"
}
```

#### `cars.json`
**Purpose:** Car catalog data
**Contains:**
- 12 different cars
- Multiple categories (SUV, Sedan, Sports)
- Various brands (Tesla, BMW, Mercedes, etc.)
- Complete specifications
- Image URLs (Unsplash)
- Features lists
**Size:** ~8 KB
**Categories:**
- Sedan: 4 cars
- SUV: 6 cars
- Sports: 2 cars

#### `rentals.json`
**Purpose:** Booking history data
**Contains:**
- 2 sample bookings
- Booking details
- Status tracking
**Size:** ~400 bytes
**Updates:** Dynamically with new bookings (in-memory)

---

### 📚 Documentation Files

#### `README.md` (Main Documentation)
**Sections:**
- Project description
- Features overview
- Installation guide
- Running instructions
- Test credentials
- Project structure
- Technologies used
- Future enhancements

#### `PROJECT_STRUCTURE.md` (Architecture Guide)
**Sections:**
- Directory structure
- Architecture overview
- Layer structure
- Design patterns
- Screen flow
- Component details
- Data management
- Performance optimizations

#### `INSTALLATION_GUIDE.md` (Setup Guide)
**Sections:**
- Prerequisites
- Step-by-step installation
- Running the app
- Troubleshooting
- Testing instructions
- Building for production
- Development commands

#### `FEATURES.md` (Feature Documentation)
**Sections:**
- Core features checklist
- Bonus features list
- UI components
- Data features
- Validations
- UX features
- Statistics
- Educational value

#### `QUICK_START.md` (Quick Reference)
**Sections:**
- TL;DR setup
- Test accounts
- App flow
- Features to try
- Quick fixes
- Pro tips
- Demo script

#### `SUBMISSION_CHECKLIST.md` (Submission Guide)
**Sections:**
- Pre-submission checklist
- File verification
- Feature completion
- Testing checklist
- Code quality checks
- Documentation verification
- Submission package

#### `FILE_OVERVIEW.md` (This File)
**Purpose:** Complete file reference
**Sections:**
- File structure
- Detailed descriptions
- Purpose of each file
- Dependencies map

---

## 📊 Code Statistics

### Lines of Code (Approximate)

| Category | Files | Lines |
|----------|-------|-------|
| Screens | 4 | ~1,400 |
| Widgets | 3 | ~330 |
| Services | 3 | ~275 |
| Models | 3 | ~185 |
| Utils | 2 | ~160 |
| Main | 1 | ~140 |
| **Total Dart** | **16** | **~2,500** |

### JSON Data

| File | Records | Size |
|------|---------|------|
| users.json | 3 | ~500 bytes |
| cars.json | 12 | ~8 KB |
| rentals.json | 2+ | ~400 bytes |
| **Total** | **17+** | **~9 KB** |

---

## 🔗 File Dependencies

### Import Map

```
main.dart
├── screens/login_screen.dart
│   ├── services/auth_service.dart
│   ├── widgets/custom_button.dart
│   ├── widgets/custom_text_field.dart
│   └── utils/constants.dart
├── screens/home_screen.dart
│   ├── models/car.dart
│   ├── services/car_service.dart
│   ├── widgets/car_card.dart
│   └── screens/car_details_screen.dart
├── utils/theme.dart
└── utils/constants.dart

car_details_screen.dart
├── models/car.dart
├── services/car_service.dart
├── widgets/custom_button.dart
└── screens/booking_screen.dart

booking_screen.dart
├── models/car.dart
├── models/user.dart
├── services/auth_service.dart
├── services/rental_service.dart
└── widgets/custom_text_field.dart
```

---

## 🎯 File Purposes Summary

### Essential Files (Cannot Delete)
- All `.dart` files in `lib/`
- All `.json` files in `assets/data/`
- `pubspec.yaml`
- `README.md`

### Important Files (Highly Recommended)
- `analysis_options.yaml`
- `.gitignore`
- Documentation files

### Optional Files (Helpful)
- Additional documentation
- This overview file

---

## 🔄 File Modification Guide

### Safe to Modify
- ✅ All documentation files
- ✅ JSON data files (add more users/cars)
- ✅ `constants.dart` (colors, sizes)
- ✅ `theme.dart` (styling)

### Modify with Caution
- ⚠️ Service files (may break functionality)
- ⚠️ Screen files (complex UI logic)
- ⚠️ Model files (data structure)

### Do Not Modify
- ❌ `pubspec.yaml` (unless adding dependencies)
- ❌ File structure (folder organization)

---

## 📖 Reading Order for New Developers

1. **Start Here:**
   - `README.md` - Understand the project
   - `QUICK_START.md` - Get it running

2. **Then Read:**
   - `PROJECT_STRUCTURE.md` - Learn architecture
   - `FEATURES.md` - Know what it does

3. **Dive Into Code:**
   - `lib/main.dart` - Entry point
   - `lib/models/` - Data structures
   - `lib/services/` - Business logic
   - `lib/screens/` - UI implementation

4. **For Submission:**
   - `SUBMISSION_CHECKLIST.md` - Final checks
   - `INSTALLATION_GUIDE.md` - Setup help

---

**This file provides a complete reference for all files in the project. Use it to quickly locate and understand any component!** 🎯
