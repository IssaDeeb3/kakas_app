# Project Name

This project is a Flutter application that uses the Model-View-ViewModel (MVVM) architecture. It's designed to be scalable, maintainable, and testable.

## Introduction

The MVVM architecture separates the application into three main components:

- Model: Represents the data and business logic of the application.
- View: The user interface of the application.
- ViewModel: Acts as a bridge between the Model and the View.

## Prerequisites

- Flutter SDK
- Dart
- Android Studio or VS Code

## Installation

1. Clone the repository: `git clone https://github.com/issadeeb3/kakas_app.git`
2. Navigate into the project directory: `cd projectname`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Project Structure

The project is structured as follows:

- `lib/src/screens`: Contains all the screens of the application. Each screen has its own directory with its corresponding ViewModel.
- `lib/src/core/data`: Contains the data layer of the application, including network API services and data models.
- `lib/src/screens/shared`: Contains shared widgets and animations used across different screens.

## Usage

To use this project, navigate to the desired screen directory and work with the corresponding ViewModel. The ViewModel communicates with the Model and updates the View.

## Contributing

Contributions are welcome. Please read the [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.# kakas_app
