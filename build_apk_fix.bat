@echo off
echo CBSE Question Papers - APK Builder (Java 24 Compatible)
echo ========================================================
echo.

echo Attempting to build APK with Java compatibility workarounds...
echo.

REM Clear Gradle cache to avoid version conflicts
echo Cleaning Gradle cache...
if exist "%USERPROFILE%\.gradle\caches\" (
    rmdir /s /q "%USERPROFILE%\.gradle\caches\"
    echo Gradle cache cleared.
) else (
    echo No Gradle cache found to clear.
)

echo.
echo Building APK with --no-daemon flag...
echo This may take a few minutes...
echo.

gradlew.bat clean assembleDebug --no-daemon --warning-mode all

echo.
if exist "app\build\outputs\apk\debug\app-debug.apk" (
    echo SUCCESS! APK has been generated successfully!
    echo.
    echo APK Location: app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo You can now install this APK on your Android device.
    echo To install: Enable "Unknown Sources" in Android settings,
    echo then copy the APK to your device and tap to install.
) else (
    echo BUILD FAILED. Please check the error messages above.
    echo.
    echo Alternative Solutions:
    echo 1. Install an older Java version (Java 17 or 21)
    echo 2. Use Android Studio for building
    echo 3. Use an online APK building service
)

echo.
pause