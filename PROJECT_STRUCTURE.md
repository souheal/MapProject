# Car Rental App - Project Structure

This document provides a detailed overview of the project architecture and file organization.

## 📁 Directory Structure

```
car_rental_app/
│
├── lib/
│   ├── main.dart                      # Application entry point with splash screen
│   │
│   ├── models/                        # Data models
│   │   ├── user.dart                  # User model with JSON serialization
│   │   ├── car.dart                   # Car model with all vehicle details
│   │   └── rental.dart                # Rental/Booking model
│   │
│   ├── services/                      # Business logic layer
│   │   ├── auth_service.dart          # Authentication & session management
│   │   ├── car_service.dart           # Car data operations & favorites
│   │   └── rental_service.dart        # Booking creation & validation
│   │
│   ├── screens/                       # UI screens
│   │   ├── login_screen.dart          # Login page with validation
│   │   ├── home_screen.dart           # Car listing with search & filters
│   │   ├── car_details_screen.dart    # Detailed car view
│   │   └── booking_screen.dart        # Rental booking form
│   │
│   ├── widgets/                       # Reusable UI components
│   │   ├── car_card.dart              # Car display card component
│   │   ├── custom_button.dart         # Reusable button widget
│   │   └── custom_text_field.dart     # Reusable input field widget
│   │
│   └── utils/                         # Utilities & constants
│       ├── constants.dart             # App-wide constants & colors
│       └── theme.dart                 # Light & dark theme definitions
│
├── assets/
│   ├── data/                          # JSON data files (backend simulation)
│   │   ├── users.json                 # User credentials & profiles
│   │   ├── cars.json                  # Available cars catalog
│   │   └── rentals.json               # Booking records
│   │
│   └── images/                        # Static images (placeholder)
│       └── .gitkeep
│
├── pubspec.yaml                       # Project dependencies & assets
├── README.md                          # Main documentation
├── PROJECT_STRUCTURE.md              # This file
├── .gitignore                        # Git ignore rules
└── analysis_options.yaml             # Dart linter configuration

```

## 🏗️ Architecture Overview

### Layer Structure

The application follows a **clean architecture** pattern with clear separation of concerns:

1. **Presentation Layer** (`screens/` & `widgets/`)
   - UI components and screens
   - User interaction handling
   - State management with StatefulWidget

2. **Business Logic Layer** (`services/`)
   - Data operations
   - Business rules
   - API simulation (JSON reading)

3. **Data Layer** (`models/` & `assets/data/`)
   - Data models
   - JSON serialization
   - Local data storage

### Design Patterns Used

- **Service Pattern**: All business logic is encapsulated in service classes
- **Model-View Pattern**: Clear separation between data models and UI
- **Factory Pattern**: JSON deserialization using factory constructors
- **Singleton-like Services**: Services maintain state across the app

## 📱 Screen Flow

```
Splash Screen
     ↓
Login Screen → (on success) → Home Screen
                                   ↓
                              Car Details Screen
                                   ↓
                              Booking Screen → Success Dialog → Home Screen
```

## 🔧 Key Components

### Models (`lib/models/`)

**user.dart**
- User authentication data
- Profile information
- JSON serialization methods

**car.dart**
- Complete car specifications
- Features list
- Availability status
- Image URLs

**rental.dart**
- Booking information
- Price calculations
- Rental dates
- Status tracking

### Services (`lib/services/`)

**auth_service.dart**
- Login validation against users.json
- Session persistence using SharedPreferences
- Current user management
- Logout functionality

**car_service.dart**
- Load all cars from cars.json
- Search functionality
- Category and brand filtering
- Favorites management
- Caching for performance

**rental_service.dart**
- Create new bookings
- Date availability checking
- Price calculation
- Rental history management

### Screens (`lib/screens/`)

**login_screen.dart**
- Email/password authentication
- Form validation
- Error handling
- Auto-navigation on success

**home_screen.dart**
- Car grid/list display
- Search bar
- Category filters
- User profile display
- Favorites toggle
- Dark mode toggle

**car_details_screen.dart**
- Hero image animation
- Specifications grid
- Features chips
- Description
- Favorite button
- Rent now CTA

**booking_screen.dart**
- User info (auto-filled)
- Date pickers
- Price calculation
- Form validation
- Booking confirmation

### Widgets (`lib/widgets/`)

**car_card.dart**
- Reusable car display component
- Image with fallback
- Key specifications
- Favorite button
- Price display

**custom_button.dart**
- Configurable button
- Loading state
- Icon support
- Custom colors

**custom_text_field.dart**
- Labeled input field
- Validation support
- Icons
- Password toggle

## 🎨 Theming

The app supports both light and dark themes defined in `utils/theme.dart`:

- Material Design 3
- Custom color scheme
- Consistent spacing
- Rounded corners
- Elevation standards

## 💾 Data Management

### Local Storage

- **SharedPreferences**: User session, favorites
- **JSON Assets**: Users, cars, rentals data

### Data Flow

1. **Initial Load**: JSON files loaded from assets
2. **Caching**: Services cache data in memory
3. **Persistence**: User preferences saved locally
4. **Simulated API**: JSON acts as backend responses

## 🚀 Performance Optimizations

1. **Caching**: Cars loaded once and cached
2. **Lazy Loading**: Services load data on-demand
3. **Hero Animations**: Smooth transitions
4. **Efficient Rebuilds**: Minimal setState calls
5. **Image Caching**: Network images cached automatically

## 🔐 Security Notes

- Passwords stored in plain text (for demonstration only)
- No real backend communication
- Session management for UI flow
- No sensitive data protection

**⚠️ For production**: Implement proper encryption, secure storage, and backend authentication.

## 🧪 Testing Strategy

### Manual Testing

1. **Login Flow**
   - Try valid credentials
   - Try invalid credentials
   - Test form validation

2. **Car Browsing**
   - Search functionality
   - Filter by category
   - Favorites toggle

3. **Booking Flow**
   - Date selection
   - Price calculation
   - Form submission
   - Success confirmation

### Recommended Improvements for Testing

- Add unit tests for services
- Add widget tests for components
- Add integration tests for flows
- Mock JSON data for testing

## 📝 Code Style

- Flutter best practices
- Material Design guidelines
- Consistent naming conventions
- Comprehensive comments where needed
- Modular and reusable code

## 🔄 Future Enhancements

Potential features to add:

1. **Backend Integration**
   - Real API calls
   - Database connection
   - User registration

2. **Advanced Features**
   - Payment integration
   - Booking history
   - User reviews
   - Push notifications
   - Map integration
   - Multi-language support

3. **State Management**
   - Provider/Riverpod
   - BLoC pattern
   - Redux

4. **Testing**
   - Unit tests
   - Widget tests
   - Integration tests

## 📚 Dependencies

Key packages used:

- `flutter`: UI framework
- `intl`: Date formatting
- `shared_preferences`: Local storage
- `flutter_lints`: Code quality

## 🤝 Contributing

This is a university project. To extend it:

1. Fork the repository
2. Create a feature branch
3. Follow existing code style
4. Test thoroughly
5. Submit pull request

---

**Built with ❤️ using Flutter for educational purposes**
