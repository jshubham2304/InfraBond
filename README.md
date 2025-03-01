## Hella Infra Bond App

A **Flutter bond trading application** built with **Clean Architecture** and **Cubit (flutter_bloc)** for efficient state management.

## 🚀 Features

✅ **Browse & Search Bonds** – View and filter bonds in real-time.  
✅ **Detailed Bond Information** – Explore company financials, EBITDA, and revenue charts.  
✅ **Haptic Feedback** – Provides a responsive user experience.  
✅ **Error Handling & Loading States** – Ensures smooth app interaction.  
✅ **Bookmark Bonds** – Save bonds for easy access.  
✅ **Share Bond Details** – Export bond data via text, PDF, WhatsApp, and more.

## 🏛️ Architecture

The app follows **Clean Architecture**, splitting the code into well-defined layers:

- **Domain Layer** – Business logic, entities, use cases, repository interfaces.
- **Data Layer** – Implements repositories and manages data sources.
- **Presentation Layer** – UI components, Cubit classes for state management.

## 🛠️ Technologies & Libraries

| **Category**             | **Packages Used**         |
| ------------------------ | ------------------------- |
| **State Management**     | `flutter_bloc` (Cubit)    |
| **Dependency Injection** | `get_it`, `injectable`    |
| **Code Generation**      | `freezed`, `build_runner` |
| **Networking**           | `dio`                     |
| **Charts**               | `fl_chart`                |
| **Haptic Feedback**      | `flutter_haptic`          |
| **Testing**              | `bloc_test`, `mockito`    |

## 📂 Project Structure

```
lib/
├── core/                 # Core utilities (helpers, constants, etc.)
├── data/                 # Data layer (models, repositories, APIs)
├── domain/               # Business logic (entities, use cases)
├── presentation/         # UI layer (cubit, pages, widgets)
└── main.dart             # App entry point
```

## 🚀 Setup & Running

### 1️⃣ Clone the repository

```sh
git clone https://github.com/your-repo/hella_infra_app.git
cd hella_infra_app
```

### 2️⃣ Install dependencies

```sh
flutter pub get
```

### 3️⃣ Generate required files

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4️⃣ Run the app

```sh
flutter run
```

## 📦 Building for Production

### Android

```sh
flutter build apk --release
```

The APK will be available at:  
📁 `build/app/outputs/flutter-apk/app-release.apk`

### iOS

```sh
flutter build ios --release
```

Then, archive and distribute using Xcode.

## 🧪 Running Tests

```sh
flutter test
```

## 📌 Developer Notes

- The app supports **portrait mode only** for an optimized experience.
- Haptic feedback enhances user interactions at different intensity levels.
- The bond data is fetched from the following APIs:
  - **Bond List**: [`https://eol122duf9sy4de.m.pipedream.net`](https://eol122duf9sy4de.m.pipedream.net)
  - **Bond Detail**: [`https://eo61q3zd4heiwke.m.pipedream.net`](https://eo61q3zd4heiwke.m.pipedream.net)

## 🚀 Future Enhancements

✔️ **Offline Caching** – Store bond data locally for better accessibility.  
✔️ **Pagination** – Improve performance when handling large lists.  
✔️ **Authentication** – Secure login and user sessions.  
✔️ **Portfolio Management** – Allow users to track bond investments.

## 📲 Download & Demo

### 📥 **Download APK**

👉 [**Download App**](app-release.apk)

### 🎥 **Watch Demo**

▶️ [**View Demo**](demo.mov)

---
