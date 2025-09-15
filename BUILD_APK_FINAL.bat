@echo off
echo =========================================
echo CBSE Question Papers - Final APK Builder
echo =========================================
echo.

echo Method 1: Building with Java compatibility flags...
echo.
set JAVA_TOOL_OPTIONS=-Djdk.lang.Process.allowAmbiguousCommands=true
gradlew.bat clean assembleDebug --no-daemon --warning-mode all --java-home "%JAVA_HOME%" 2>error.log

if exist "app\build\outputs\apk\debug\app-debug.apk" (
    goto SUCCESS
)

echo.
echo Method 2: Building with legacy Gradle settings...
echo.
gradlew.bat clean assembleDebug --no-daemon --no-build-cache --refresh-dependencies 2>>error.log

if exist "app\build\outputs\apk\debug\app-debug.apk" (
    goto SUCCESS
)

echo.
echo Method 3: Building release version...
echo.
gradlew.bat clean assembleRelease --no-daemon --warning-mode all 2>>error.log

if exist "app\build\outputs\apk\release\app-release-unsigned.apk" (
    echo SUCCESS! Release APK generated!
    echo.
    echo APK Location: app\build\outputs\apk\release\app-release-unsigned.apk
    echo File Size: 
    dir "app\build\outputs\apk\release\app-release-unsigned.apk" | find "app-release"
    echo.
    echo NOTE: This is an unsigned APK. For installation:
    echo 1. Enable "Unknown Sources" in Android Settings
    echo 2. Copy APK to your Android device
    echo 3. Tap the APK file to install
    echo.
    goto END
)

echo.
echo BUILD FAILED - All methods unsuccessful
echo.
echo Error Details:
type error.log
echo.
echo ALTERNATIVE SOLUTIONS:
echo.
echo 1. GitHub Actions Build (Recommended):
echo    - Upload your project to GitHub
echo    - The .github/workflows/build.yml will auto-build APK
echo    - Download from GitHub Actions artifacts
echo.
echo 2. Install Java 17:
echo    - Download from: https://adoptium.net/temurin/releases/
echo    - Install Java 17 LTS
echo    - Set JAVA_HOME to Java 17 path
echo    - Restart this script
echo.
echo 3. Use Android Studio:
echo    - Download from: https://developer.android.com/studio
echo    - Open this project
echo    - Build -^> Build Bundle(s) / APK(s) -^> Build APK(s)
echo.
goto END

:SUCCESS
echo ==========================================
echo 🎉 SUCCESS! APK GENERATED SUCCESSFULLY! 🎉
echo ==========================================
echo.
echo APK Location: app\build\outputs\apk\debug\app-debug.apk
echo.
echo File Information:
dir "app\build\outputs\apk\debug\app-debug.apk" | find "app-debug"
echo.
echo 📱 INSTALLATION INSTRUCTIONS:
echo 1. Copy app-debug.apk to your Android device
echo 2. Enable "Unknown Sources" in Settings -^> Security
echo 3. Tap the APK file to install
echo 4. Enjoy your CBSE Question Papers app!
echo.
echo 🎯 APP FEATURES:
echo ✅ Six subjects: Math, Science, Social Science, English, Hindi, Sanskrit
echo ✅ Chapter-wise organization
echo ✅ Dark/Light theme support
echo ✅ Material Design 3 UI
echo ✅ Offline storage with Room database
echo.

:END
echo.
pause