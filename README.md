
# 🛍️ AUVNET Flutter Internship Assessment

This is a simple, responsive e-commerce Flutter application built as part of the AUVNET internship task. It follows Clean Architecture principles and uses the BLoC pattern for state management. Firebase is used for backend services, and Hive is used for local caching.

## 📱 Screens Overview

<p align="center">
  <img src="assets/images/splash screen.png" width="150" alt="Splash"/>
  <img src="assets/images/Onboarding screen 1.png" width="150" alt="Onboarding 1"/>
  <img src="assets/images/Onboarding screen 2.png" width="150" alt="Onboarding 2"/>
  <img src="assets/images/Onboarding screen 3.png" width="150" alt="Onboarding 3"/>
  <img src="assets/images/Sign up.png" width="150" alt="Sign Up"/>
  <img src="assets/images/Home Screen.png" width="150" alt="Home Screen"/>
</p>

> UI was implemented as closely as possible to the official Figma design provided in the task.

---

## 🏗️ Project Architecture

This project follows **Clean Architecture** with a clear separation of concerns:

```
lib/
├── core/                 # Shared base classes, constants, utilities
├── features/
│   └── auth/             # Authentication feature (login, signup)
│   └── home/             # Home screen features (services, products, etc.)
│   └── onboarding/       # Onboarding flow
├── data/                 # Repositories, Models, Data Sources (local & remote)
├── domain/               # Entities, Repositories contracts, Use cases
├── presentation/         # UI, BLoC, Events, States, Widgets
├── main.dart             # App entry point
```

---

## ⚙️ State Management

Used [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) for all BLoC-related state control.

- All states are immutable and use `copyWith()` for state updates.
- Each feature (auth, onboarding, home) has its own bloc, state, and event files.
- Global `BlocObserver` is implemented for debugging purposes.

---

## 🔐 Firebase Integration

- **Authentication**: Firebase Email/Password.
- **Cloud Firestore**: Stores product/service data.
- **Firebase Storage**: Handles product image uploading.

Firebase is initialized securely with environment-based configuration using `flutter_dotenv`.

---

## 📦 Local Storage (Hive)

Hive is used to store:
- User preferences
- Onboarding viewed state
- Offline cache for services or shortcuts (if needed)

---
## 🗄️ Supabase Storage Integration

To manage media storage in the app—especially for images displayed in the Home Screen—**Supabase Storage** was integrated as an alternative to Firebase Storage.

- Used the `supabase_flutter` package for authentication and storage operations.
- Product and banner images in the Home Screen are fetched directly from Supabase buckets.
- The integration is designed to be modular and scalable, allowing for easy expansion to other features in the future.
- Supabase Storage provides a simple API with signed URL support, which ensures secure and efficient media delivery.
- Files are organized under specific folders in the bucket to maintain a clean structure (e.g., `products/`, `banners/`).

This approach provides full flexibility and control over storage, especially useful for apps requiring custom storage logic or moving away from Firebase.
---

## 🎨 UI/UX

- Fully responsive for mobile screens.
- UI built using `flutter_screenutil` and `LayoutBuilder`.
- The design closely mirrors the official [Figma design](https://www.figma.com/community/file/1516187112598079359/flutter-internship-task).
- Adaptive light/dark theme support is considered (optional enhancement).

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/AUVNET-Internship-Assessment.git
cd AUVNET-Internship-Assessment
```

### 2. Install packages

```bash
flutter pub get
```


### 3. Run the app

```bash
flutter run
```

---

## 📁 Features

| Feature               | Status         |
|------------------------|----------------|
| Splash Screen          | ✅ Completed    |
| Onboarding Flow        | ✅ Completed    |
| Authentication         | ✅ Completed    |
| Home Screen            | ✅ UI Done, Data Mocked |
| Firebase Integration   | ✅ Done         |
| Hive Caching           | ✅ Setup Complete |
| Supabase Storage (Home) | ✅ Integrated in Home Screen |
| Clean Architecture     | ✅ Fully Applied |
| BLoC Pattern           | ✅ Used throughout |




