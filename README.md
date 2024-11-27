# Books App 📚

A Flutter-based application designed to showcase books, authors, and their ratings. This project is built using the **BLoC (Business Logic Component)** architecture, ensuring a clean and scalable codebase. It also includes a robust theme-switching mechanism, API integrations, and custom utilities for efficient development.


## ✨ Key Features

1. **BLoC Architecture**: The project leverages the power of the BLoC pattern to manage state and business logic effectively.
2. **Theme Switching**: 
   - Light and dark themes are integrated into the project.
   - While no UI button is provided to toggle the theme, the functionality exists in the codebase via `ThemeBloc`. Developers can easily add a button or switch in the UI to trigger theme changes.
3. **Dependency Injection**: Managed using a DI container for clean and scalable dependency management.
4. **MultiBlocProvider Setup**: 
   - Manages multiple BLoC instances like `AuthBloc`, `AuthorBloc`, `BookBloc`, and `RatingBloc`.
   - Ensures efficient state management across the app.
5. **Shared Preferences Initialization**: Enables persistent data storage for session management and user preferences.
6. **Dynamic Routing**: Powered by `GoRouter` for clean and declarative navigation.
7. **Customizable Colors**: Centralized in `AppColors` for consistent styling and easier maintenance.
8. **Gradient Colors**: Predefined gradients for visually appealing designs.
9. **Error Handling and Extensibility**: Includes extensions and utilities for seamless error handling and functionality expansion.

-------------------------------<<<<<<<<<<<<<<< Directory Structure >>>>>>>>>>>>>------------------------------------

lib/
├── core/
│   ├── errors/          # Error handling (Failure classes)
│   ├── utils/           # Shared utilities, helpers, constants, etc.
│   └── widgets/         # Shared reusable widgets
├── data/
│   ├── datasources/     # API and local data sources
│   ├── models/          # Data models (e.g., JSON parsing)
│   └── repositories/    # Repository implementation
├── domain/
│   ├── entities/        # Core app objects (e.g., Book, Author)
│   ├── repositories/    # Abstract repository interfaces
│   └── usecases/        # Business logic
├── presentation/
│   ├── bloc/            # Bloc files (states, events, blocs)
│   ├── pages/           # Screens/pages
│   └── widgets/         # Page-specific widgets
└── main.dart            # Entry point of the app


 