name: Build Android APK

on:
  push:
    branches: [ main, master ]
  pull_request:
    branches: [ main, master ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    # 1️⃣ Checkout code
    - name: Checkout code
      uses: actions/checkout@v4
      
    # 2️⃣ Set up JDK 17
    - name: Set up JDK 17
      uses: actions/setup-java@v4
      with:
        java-version: '17'
        distribution: 'temurin'

    # 3️⃣ Set up Android SDK
    - name: Set up Android SDK
      uses: android-actions/setup-android@v2
      with:
        api-level: 33
        build-tools: 33.0.2

    # 4️⃣ Cache Gradle
    - name: Cache Gradle packages
      uses: actions/cache@v4
      with:
        path: |
          ~/.gradle/caches
          ~/.gradle/wrapper
        key: ${{ runner.os }}-gradle-${{ hashFiles('**/*.gradle*', '**/gradle-wrapper.properties') }}
        restore-keys: |
          ${{ runner.os }}-gradle-

    # 5️⃣ Fix gradlew permissions and Linux JVM issue
    - name: Prepare gradlew
      run: |
        chmod +x ./gradlew
        sed -i 's/darwin=false/darwin=true/' ./gradlew

    # 6️⃣ Build Debug APK
    - name: Build Debug APK
      run: ./gradlew assembleDebug --stacktrace

    # 7️⃣ Upload Debug APK
    - name: Upload Debug APK
      uses: actions/upload-artifact@v4
      with:
        name: CBSE-QuestionPapers-Debug-APK
        path: app/build/outputs/apk/debug/app-debug.apk

    # 8️⃣ Build Release APK
    - name: Build Release APK
      run: ./gradlew assembleRelease --stacktrace

    # 9️⃣ Upload Release APK
    - name: Upload Release APK
      uses: actions/upload-artifact@v4
      with:
        name: CBSE-QuestionPapers-Release-APK
        path: app/build/outputs/apk/release/app-release.apk
