# SMS Fetch and Filter Application

This Flutter application is designed to fetch SMS messages from a user's phone, filter them based on specified criteria, and display them in a clean and user-friendly interface. The app is built using **Clean Architecture** principles, ensuring scalability, maintainability, and clear separation of concerns.

---

## **Project Structure**

The application is divided into the following layers:

### **1. App Layer**
The foundation of the app, containing global dependencies, helpers, configurations, and the entry point.

- **`dependencies/`**: Handles dependency injection (e.g., `service_locator.dart`).
- **`helpers/`**: Contains utilities for permissions, type parsing, and user interactions.
- **`view/`**:
  - `config/`: Configuration files like screen size utilities.
  - `resources/`: App resources including strings, images, and themes.
  - `routing/`: App routing definitions.
  - `app.dart`: The main app initialization file.

---

### **2. Features Layer**
Each app feature is encapsulated in its folder, ensuring modularity. The **SMS** feature includes:

#### **SMS Feature Structure**

- **`data/`**: Handles external data interactions.
  - `models/`: DTO models for raw data.
  - `mappers/`: Maps DTO models to entities.
  - `repository_implementation/`: Implements repositories to fetch SMS data.

- **`dependencies/`**: Provides dependency injection specific to the SMS feature.

- **`domain/`**: Contains the business logic.
  - `entities/`: Business entities representing core data.
  - `repos/`: Abstract repository interfaces.
  - `usecases/`: Business actions like fetching and filtering SMS messages.

- **`presentation/`**: UI and state management.
  - `state/`: Manages app state using `ChangeNotifier`.
  - `views/`: Screens to display SMS messages.
  - `widgets/`: Reusable widgets for the UI.

---

## **Getting Started**

### **1. Prerequisites**
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Visual Studio Code
- A physical or virtual device with SMS permissions enabled

### **2. Installation**
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd sms_fetch_filter_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure the environment (e.g., permissions for SMS access in `AndroidManifest.xml`).

4. Run the app:
   ```bash
   flutter run
   ```

---

## **Features**

- Fetch SMS messages from the user's device.
- Filter SMS messages based on keywords or criteria.
- Display messages in a clean and intuitive interface.
- Modular architecture for easy feature addition.

---

## **Architecture Overview**

This app is built using **Clean Architecture** to ensure clear separation of concerns and scalability:

1. **Data Layer**: Responsible for external data sources (e.g., SMS APIs).
2. **Domain Layer**: Encapsulates business logic with entities, repositories, and use cases.
3. **Presentation Layer**: Manages the UI and state, interacting with the domain layer.

---

## **Dependency Injection**
The app uses the `get_it` package for dependency injection, ensuring decoupled and testable components.

---

## **State Management**
State is managed using the `ChangeNotifier` class, providing reactive UI updates.

---

## **How to Extend**

1. **Add a New Feature**:
   - Create a new folder under `features/`.
   - Follow the same structure: `data/`, `domain/`, `presentation/`.

2. **Add a New Use Case**:
   - Define the business logic in the `usecases/` folder.
   - Connect it to the repository via the domain layer.

3. **Add a New Screen**:
   - Create a new widget in the `views/` folder.
   - Use providers to interact with the state.


## **Contact**
For questions or support, please contact:

- **Name**: Abdelrahman Elfadaly
- **Email**: elfadalyabdelrahman@gmail.com
- **GitHub**: https://github.com/El-fadaly

---

