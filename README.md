# Notepad.EX

![Banner](git_components/banner.png)

[![Flutter](https://img.shields.io/badge/Flutter-3.0-blue.svg)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-Firestore-orange.svg)](https://firebase.google.com/)
[![GetX](https://img.shields.io/badge/State%20Management-GetX-blue.svg)](https://pub.dev/packages/get)
[![GoRouter](https://img.shields.io/badge/Routing-GoRouter-brightgreen)](https://pub.dev/packages/go_router)

Notepad.EX is a simple and efficient note-taking application built with Flutter and Firebase Cloud Firestore. It follows clean architecture principles and provides a seamless user experience for managing notes.

## Features

- **Authentication**: User authentication using email and password with Firebase.
- **Create Account**: Users can register using name, email, and password.
- **Add, Edit, Delete Notes**: Users can add, edit, and delete personal notes.
- **Dashboard**: A dashboard displaying user information and the list of their notes.
- **Floating Action Button**: Easily add notes from the dashboard.
- **Clean Architecture**: Organized codebase adhering to clean architecture principles.
- **Responsive Routing**: Powered by GoRouter for seamless navigation.
- **State Management**: Handled by GetX for simplicity and efficiency.

## Screens

- **Splash Screen**: Initial screen where user authentication is checked.
    - If authenticated, the user is directed to the dashboard.
    - If not, they are prompted to log in or sign up.
- **Dashboard**: Displays user information and notes list. Users can:
    - Add a new note with the floating action button.
    - Edit or delete existing notes.
- **Authentication**: Users can:
    - Sign up with name, email, and password.
    - Log in with email and password.

## Architecture

This project is built following clean architecture principles for a well-structured and maintainable codebase. Key dependencies include:

- **State Management**: GetX for efficient and simple state handling.
- **Routing**: GoRouter for declarative and flexible routing.
- **Database**: Firebase Cloud Firestore for cloud-based data storage.

## Dependencies

- [Flutter](https://flutter.dev/) - Front-end development framework.
- [Firebase Cloud Firestore](https://firebase.google.com/docs/firestore) - Real-time cloud database.
- [GetX](https://pub.dev/packages/get) - State management and navigation.
- [GoRouter](https://pub.dev/packages/go_router) - Declarative routing solution for Flutter.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Notepad.EX.git
   ```
2. Install Flutter and set up the environment. For installation instructions, check the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Set up Firebase for your project:
    - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Enable Firebase Firestore.
    - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) to the project.

5. Run the app:
   ```bash
   flutter run
   ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
