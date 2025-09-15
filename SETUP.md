# Quick Setup Guide

## Prerequisites
- Android Studio Hedgehog or newer
- Android SDK 24+ (Android 7.0)
- Java 8 or Kotlin 1.9.10+

## Setup Steps

### 1. Open Project
1. Launch Android Studio
2. Click "Open an Existing Project"
3. Navigate to `c:\Users\LENOVO\Desktop\autocode`
4. Click "Open"

### 2. Sync Project
1. Android Studio will automatically detect the project
2. Click "Sync Now" when prompted
3. Wait for Gradle sync to complete

### 3. Resolve Dependencies
Android Studio will download required dependencies:
- Material Design Components
- Room Database
- Navigation Components
- AndroidX libraries

### 4. Run the App
1. Connect an Android device (API 24+) or start an emulator
2. Click the "Run" button (green arrow) or press Shift+F10
3. Select your target device
4. The app will install and launch

## What You'll See

### Home Screen
- Six subject cards (Mathematics, Science, Social Science, English, Hindi, Sanskrit)
- Progress indicators for each subject
- Bottom navigation with 4 tabs

### Subject Navigation
1. Tap any subject card → Opens subject details
2. View chapter list with progress indicators
3. Tap any chapter → Opens chapter details
4. Access questions and practice options

### Sample Data
The app automatically loads comprehensive sample data including:
- 70+ chapters across all subjects
- Sample questions with solutions
- Past paper references
- Progress tracking setup

## Troubleshooting

### Common Issues
1. **Gradle Sync Failed**: Ensure internet connection and try "File → Sync Project with Gradle Files"
2. **SDK Missing**: Install required SDK versions through SDK Manager
3. **Build Errors**: Clean project with "Build → Clean Project"

### Dependencies
All dependencies are specified in `app/build.gradle`:
- Room database for local storage
- Material Design for UI components
- Navigation components for app navigation
- Kotlin coroutines for async operations

## Next Steps

### Explore the Code
- `data/model/` - Database entities
- `ui/fragments/` - Main app screens
- `ui/adapters/` - RecyclerView adapters
- `data/repository/` - Data access layer

### Development
The app is ready for feature expansion:
- Question viewing and filtering
- Practice mode implementation
- Progress analytics
- Offline download system

## Support
Check the main README.md for detailed documentation and architecture overview.

---
Happy coding! 🚀