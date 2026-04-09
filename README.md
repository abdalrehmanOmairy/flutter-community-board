# 📱 Scalable Flutter App: Community Board (Monorepo)

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Dart](https://img.shields.io/badge/Dart-2.x-blue)
![Architecture](https://img.shields.io/badge/Architecture-Clean-success)
![State Management](https://img.shields.io/badge/State-BLoC-orange)
![Backend](https://img.shields.io/badge/Backend-Supabase-green)

A scalable Flutter application built using Clean Architecture, BLoC, and Supabase.

---

## 🚀 Features

- 🔐 Authentication system
- 📝 Post creation & management
- 💬 Community interactions
- ⚡ Reactive state management using BLoC
- ☁️ Supabase backend integration
- 🧱 Clean and scalable architecture

---


## 🏗️ Project Structure

This project follows the principles of **Clean Architecture** to separate concerns.



```
lib/
├── core/
│   ├── config/          # configs (theme, routes, constants)
│   ├── error/           # exceptions & failures
│   ├── network/         # api / supabase clients
│   ├── usecase/         # base usecases
│   ├── utils/           # helpers, extensions
│   ├── widgets/         # reusable widgets
│
├── features/
│
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasource/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   ├── usecases/
│   │   │
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   ├── pages/
│   │   │   ├── widgets/
│
│   ├── post/
│   ├── profile/
│   ├── search/
│
│   ├── splash/
│       ├── presentation/
│           ├── pages/
│
├── main.dart
```


---

### Packages (Shared)
The code in the `packages/` folder is pure Dart and handles the data layer, and can be reused with any state management library.

- **[core](packages/core)**: Contains common utilities, error handling (Failures/Exceptions), and common UI components used across the app.
- **[domain](packages/domain)**: **The core of the app (Pure Dart).** Contains entities, use cases, and repository interfaces, with no external dependencies.
- **[data_supabase](packages/data_supabase)**: Implements the `domain` layer interfaces, and contains data sources and models that use Supabase as a backend.
---


## 🛠️ Tech Stack

- Flutter
- Dart
- Supabase
- BLoC
- Clean Architecture
- REST APIs

---
## 🚀 Getting Started

Follow these steps to run the project locally:

1️⃣ Clone the repository

https://github.com/abdalrehmanOmairy/flutter-community-board.git

2️⃣ Navigate to the project folder

cd flutter-community-board

3️⃣ Install dependencies

flutter pub get

4️⃣ Run the application
