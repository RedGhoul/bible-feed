# CLAUDE.md - AI Assistant Guide for Bible Feed

This document provides comprehensive guidance for AI assistants working on the Bible Feed codebase.

## Project Overview

Bible Feed is a mobile application for Android and iOS that helps users track their Bible reading progress using the [Professor Grant Horner reading system](https://sohmer.net/media/professor_grant_horners_bible_reading_system.pdf).

**Technology Stack:**
- **Framework:** Flutter 3.35.2
- **Language:** Dart SDK >=3.7.0 <4.0.0
- **Current Version:** 1.8.0+20
- **Platforms:** Android and iOS

## Codebase Structure

### Directory Organization

```
bible-feed/
├── lib/                        # Main application source code
│   ├── manager/                # Business logic layer (managers)
│   ├── service/                # Platform & external service abstractions
│   ├── model/                  # Data models and domain objects
│   ├── view/                   # Flutter UI widgets
│   ├── injectable.dart         # Dependency injection configuration
│   └── main.dart               # Application entry point
│
├── test/                       # Test suite
│   ├── unit/                   # Unit tests (managers, models)
│   │   ├── manager/
│   │   └── model/
│   ├── golden/                 # Golden/screenshot tests
│   │   └── stub/               # Test doubles for golden tests
│   └── injectable.dart         # Test DI configuration
│
├── integration_test/           # Integration tests
│   ├── service/
│   ├── test_case/
│   └── full_test.dart
│
├── android/                    # Android-specific code
├── ios/                        # iOS-specific code
├── fastlane/                   # Deployment automation
│   ├── metadata/               # App store metadata
│   └── lanes.rb                # Fastlane lanes
│
├── asset/                      # App assets
├── pubspec.yaml                # Dart/Flutter dependencies
├── build.yaml                  # Code generation configuration
└── analysis_options.yaml       # Linting rules
```

### Architecture Layers

The codebase follows a clean architecture pattern with clear separation of concerns:

1. **View Layer** (`lib/view/`)
   - Flutter widgets using Material Design
   - Uses `WatchingWidget` from `watch_it` for reactive state management
   - Widgets register change notifiers to react to state updates
   - Example: `App`, `Feeds`, `Settings`

2. **Manager Layer** (`lib/manager/`)
   - Business logic and state management
   - Extends `ChangeNotifier` to notify views of state changes
   - Injected as `@lazySingleton` using Injectable
   - Examples: `FeedsManager`, `SettingManager`, `AutoAdvanceManager`

3. **Service Layer** (`lib/service/`)
   - Abstractions for platform-specific functionality
   - External API integrations (SharedPreferences, URL launching, haptics, etc.)
   - Also injected as `@lazySingleton`
   - Examples: `StoreService`, `PlatformService`, `HapticService`

4. **Model Layer** (`lib/model/`)
   - Pure data classes and domain models
   - Uses `dart_mappable` for JSON serialization (auto-generated `.mapper.dart` files)
   - Immutable value objects
   - Examples: `Feed`, `Book`, `ReadingList`, `BibleReader`

## Key Technologies & Patterns

### Dependency Injection (Injectable)

The app uses [Injectable](https://pub.dev/packages/injectable) for dependency injection:

```dart
@lazySingleton
class FeedsManager with ChangeNotifier {
  final FeedStoreManager _feedStoreManager;

  FeedsManager(this._feedStoreManager, ReadingLists readingLists) {
    // Constructor injection
  }
}
```

**Important:**
- Configuration: `lib/injectable.dart`
- Auto-generated: `lib/injectable.config.dart` (DO NOT EDIT)
- Run code generation after changes: `flutter pub run build_runner build`
- Environments: `@prod`, `@golden` (for test stubs)

### State Management (watch_it)

Uses [watch_it](https://pub.dev/packages/watch_it) for state management:

```dart
class App extends WatchingWidget {
  @override
  build(_) {
    // Register handlers for state changes
    registerChangeNotifierHandler(
      handler: (context, AutoAdvanceManager _, _) => Navigator.maybePop(context)
    );

    return Scaffold(/* ... */);
  }
}
```

### Code Generation

Multiple build_runner targets generate code:

1. **dart_mappable_builder** - JSON serialization for models
   - Generates: `*.mapper.dart` files
   - Input: `lib/model/*.dart`

2. **injectable_generator** - Dependency injection setup
   - Generates: `injectable.config.dart`
   - Input: `lib/injectable.dart`, managers, models, services

3. **mockito** - Test mocks
   - Generates: `*.mocks.dart` files
   - Input: Test files in `test/unit/`

**Run code generation:**
```bash
flutter pub run build_runner build        # One-time build
flutter pub run build_runner watch        # Watch mode
flutter pub run build_runner build --delete-conflicting-outputs  # Clean build
```

## Development Workflows

### Getting Started

```bash
# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build

# Run the app
flutter run
```

### Testing

```bash
# Run all tests
flutter test

# Run unit tests only
flutter test test/unit

# Run integration tests
flutter test integration_test

# Run golden tests
flutter test test/golden
```

### Code Quality

The project uses strict linting rules:

- **Linter:** `flutter_lints` + `dart_code_linter`
- **Configuration:** `analysis_options.yaml`
- **Line width:** 120 characters
- **Excluded from analysis:** `*.config.dart`, `*.mapper.dart`, `*.mocks.dart`

**Key linting rules:**
- `prefer_const_constructors`: Use const constructors where possible
- `prefer_relative_imports`: Use relative imports for internal files
- `prefer_final_fields`: Mark fields as final when not reassigned
- `avoid_print`: Use `df_log` package instead of print statements

### Build & Release

**Version Management:**
- Version is defined in `pubspec.yaml`: `version: 1.8.0+20`
  - Format: `MAJOR.MINOR.PATCH+BUILD_NUMBER`
  - Update CHANGELOG.md when bumping version

**Deployment:**
- Uses Fastlane for automated deployment
- Configuration: `fastlane/Fastfile`, `fastlane/lanes.rb`
- Metadata stored in: `fastlane/metadata/`

## Coding Conventions

### File Naming
- Dart files: `snake_case.dart`
- Private widgets/classes: Prefix with underscore (e.g., `_constants.dart`)

### Import Organization
```dart
// 1. Dart/Flutter packages
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// 2. Third-party packages
import 'package:watch_it/watch_it.dart';

// 3. Internal imports (use relative paths)
import '../model/feed.dart';
import 'feed_store_manager.dart';
```

### Widget Structure
- Prefer `const` constructors for stateless widgets
- Use `WatchingWidget` for reactive widgets
- Keep widgets focused and composable
- Extract reusable components

### Manager/Service Structure
```dart
@lazySingleton  // Injectable annotation
class MyManager with ChangeNotifier {  // Extend ChangeNotifier for state
  final MyService _service;  // Dependency injection

  MyManager(this._service);  // Constructor injection

  // Business logic methods
  void doSomething() {
    // ...
    notifyListeners();  // Notify UI of changes
  }
}
```

### Logging
Use `df_log` package instead of print:
```dart
import 'package:df_log/df_log.dart';

Log.start('operation starting');
Log.info('informational message');
Log.warn('warning message');
Log.error('error message');
```

## Common Tasks for AI Assistants

### Adding a New Feature

1. **Identify the layer:**
   - New UI? → Create widget in `lib/view/`
   - Business logic? → Create manager in `lib/manager/`
   - External integration? → Create service in `lib/service/`
   - Data model? → Create model in `lib/model/`

2. **Use dependency injection:**
   - Annotate with `@lazySingleton` or `@injectable`
   - Inject dependencies via constructor
   - Run `flutter pub run build_runner build` to generate DI code

3. **Write tests:**
   - Unit tests for managers/models in `test/unit/`
   - Use mockito for mocking dependencies
   - Run `flutter pub run build_runner build` to generate mocks

4. **Update documentation:**
   - Add CHANGELOG.md entry for user-facing changes
   - Update README.md if needed

### Modifying Existing Code

1. **Read before modifying:**
   - Understand the current implementation
   - Check for dependent code (managers, tests)
   - Respect existing patterns

2. **Preserve backwards compatibility:**
   - State persistence uses `StoreService` (SharedPreferences)
   - Changing stored keys/formats may break existing user data
   - Add migration logic if needed

3. **Update tests:**
   - Modify or add unit tests for changed behavior
   - Ensure all tests pass: `flutter test`

4. **Run code generation:**
   - If you modified Injectable classes: regenerate DI
   - If you modified models with `@MappableClass`: regenerate mappers
   - If you modified test mocks: regenerate mocks

### Debugging

**Common issues:**

1. **Dependency injection errors:**
   - Run `flutter pub run build_runner build`
   - Check `lib/injectable.dart` configuration
   - Verify `@lazySingleton` or `@injectable` annotations

2. **State not updating:**
   - Ensure manager extends `ChangeNotifier`
   - Call `notifyListeners()` after state changes
   - Widget uses `WatchingWidget` or registers change handler

3. **JSON serialization errors:**
   - Run `flutter pub run build_runner build`
   - Check `@MappableClass` annotation on model
   - Verify all fields are serializable

## CI/CD Pipeline

The project uses GitHub Actions for continuous integration:

**Workflow:** `.github/workflows/ci.yml`

**Trigger:** Push or PR to `dev` or `master` branches

**Steps:**
1. Checkout code
2. Install and start iPhone 16 simulator (macOS runner)
3. Set up Flutter (stable channel)
4. Install dependencies: `flutter pub get`
5. Run unit tests: `flutter test test/unit`
6. Run integration tests: `flutter test integration_test`

**When making changes:**
- Ensure all tests pass locally before pushing
- CI runs on macOS with iOS simulator
- Fix any failing tests before merging

## Important Files

### Configuration Files
- `pubspec.yaml` - Dependencies and app metadata
- `build.yaml` - Code generation configuration
- `analysis_options.yaml` - Linting rules
- `lib/injectable.dart` - DI configuration

### Generated Files (DO NOT EDIT)
- `lib/injectable.config.dart` - DI setup
- `lib/model/*.mapper.dart` - JSON serialization
- `test/**/*.mocks.dart` - Test mocks

### Documentation
- `README.md` - User-facing documentation
- `CHANGELOG.md` - Version history
- `PRIVACY_POLICY.md` - Privacy policy
- `CLAUDE.md` - This file

## Testing Guidelines

### Unit Tests
- Location: `test/unit/manager/`, `test/unit/model/`
- Use mockito for mocking dependencies
- Test business logic in isolation
- Follow existing test patterns (see `feeds_manager_test.dart`)

### Integration Tests
- Location: `integration_test/`
- Test complete user flows
- Run on actual device/simulator
- Use test helpers in `integration_test/helper.dart`

### Golden Tests
- Location: `test/golden/`
- Screenshot-based visual regression testing
- Uses Alchemist package
- Stub services in `test/golden/stub/`

## Security & Privacy

- No analytics or tracking
- User data stored locally via SharedPreferences
- Deep links for Bible app integration
- Sharing feature uses QR codes or text export
- Review `PRIVACY_POLICY.md` before adding data collection

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Injectable Package](https://pub.dev/packages/injectable)
- [watch_it Package](https://pub.dev/packages/watch_it)
- [Professor Grant Horner Reading System](https://sohmer.net/media/professor_grant_horners_bible_reading_system.pdf)

## Questions or Issues?

- Review existing code patterns in similar features
- Check test files for usage examples
- Consult Flutter/Dart documentation
- Ask clarifying questions before making significant changes

---

**Last Updated:** 2025-11-14
**App Version:** 1.8.0+20
**Flutter Version:** 3.35.2
**Dart SDK:** >=3.7.0 <4.0.0
