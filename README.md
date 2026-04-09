# 📱 Flutter Community Board

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
- 🧪 Testable codebase

---


## 🏗️ Project Structure


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


## 🧠 Architecture

This project follows Clean Architecture:

### 📱 Presentation Layer
- UI (Screens / Widgets)
- BLoC (State Management)

### ⚙️ Domain Layer
- Entities
- Use Cases
- Repository Interfaces

### 💾 Data Layer
- Models
- Repository Implementations
- Remote Data Sources (Supabase)
- Local Data Sources (Caching / Storage)

---

## 🔄 State Management

The app uses BLoC (Business Logic Component) for predictable and scalable state management.

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
