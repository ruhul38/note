# note_app

A simple and performant note-taking application built with Flutter. This project serves as a great example of a modern Flutter application architecture.

## Features

- **Create, Read, Update, & Delete (CRUD) Notes:** Full functionality to manage your notes.
- **Local Persistence:** Notes are saved on-device using the high-performance Isar database.
- **Declarative Routing:** Navigation is handled cleanly using GoRouter.
- **Reactive State Management:** State is managed efficiently with Riverpod, utilizing code generation for robust and boilerplate-free providers.
- **Theme Settings:** Users can switch between light, dark, and system default themes.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Make sure you have the Flutter SDK installed on your machine. You can find instructions at the [official Flutter documentation](https://docs.flutter.dev/get-started/install).

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/your_username/note_app.git
    ```
2.  **Navigate to the project directory**
    ```sh
    cd note_app
    ```
3.  **Get Flutter packages**
    ```sh
    flutter pub get
    ```
4.  **Run the build_runner**
    This project uses code generation for providers and database models. Run the following command to generate the necessary files:
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the app**
    ```sh
    flutter run
    ```

## Tech Stack & Libraries

- **[Flutter](https://flutter.dev/)**: The UI toolkit for building natively compiled applications.
- **[Riverpod](https://riverpod.dev/)**: For state management.
- **[GoRouter](https://pub.dev/packages/go_router)**: For declarative routing.
- **[sembast](https://pub.dev/packages/sembast)**: A fast, cross-platform, and easy-to-use database for Flutter.
- **[shared_preferences](https://pub.dev/packages/shared_preferences)**: For storing simple settings like the selected theme.
