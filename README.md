# Hella Infra App

A Flutter bond trading application implemented with Clean Architecture and Cubit pattern for state management.

## Features

- List and search for bonds
- View detailed information about bonds
- View company financials with EBITDA and Revenue charts
- Haptic feedback for enhanced user experience
- Error handling and loading states
- Unit tests

## Architecture

The app follows Clean Architecture principles with the following layers:

- **Domain Layer**: Contains business logic, entities, use cases, and repository interfaces
- **Data Layer**: Implements repositories and manages data sources
- **Presentation Layer**: Contains UI components, Cubit classes for state management

## Technologies & Libraries

- **State Management**: flutter_bloc (Cubit)
- **Dependency Injection**: get_it, injectable
- **Code Generation**: freezed, build_runner
- **Network**: dio
- **Charts**: fl_chart
- **Haptic Feedback**: flutter_haptic
- **Testing**: bloc_test, mockito

## Project Structure

```
lib/
├── core/                 # Core functionality and utilities
├── data/                 # Data layer (models, sources, repositories)
├── domain/               # Domain layer (entities, use cases)
├── presentation/         # UI layer (cubit, pages, widgets)
└── main.dart             # Entry point
```

## Setup & Running

1. **Clone the repository**

2. **Install dependencies**

   ```
   flutter pub get
   ```

3. **Generate required files**

   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```
   flutter run
   ```

## Building for Production

### Android

```
flutter build apk --release
```

The APK will be available at `build/app/outputs/flutter-apk/app-release.apk`

### iOS

```
flutter build ios --release
```

Then archive the build using Xcode.

## Running Tests

```
flutter test
```

## Developer Notes

- The app is designed to work in portrait mode only.
- Haptic feedback is implemented to enhance the user experience. The intensity varies based on the interaction type.
- Bond data is fetched from the following APIs:
  - Bond List: https://eol122duf9sy4de.m.pipedream.net
  - Bond Detail: https://eo61q3zd4heiwke.m.pipedream.net

## Improvements & Future Work

- Add caching for offline support
- Implement pagination for bond list
- Add more detailed financial information
- Implement user authentication
- Add portfolio management features
# InfraBond
