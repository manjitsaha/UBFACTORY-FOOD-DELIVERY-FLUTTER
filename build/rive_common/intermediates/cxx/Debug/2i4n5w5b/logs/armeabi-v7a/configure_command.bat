@echo off
"C:\\Users\\Dell\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\Dell\\AppData\\Local\\Pub\\Cache\\hosted\\pub.flutter-io.cn\\rive_common-0.2.6\\android" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=19" ^
  "-DANDROID_PLATFORM=android-19" ^
  "-DANDROID_ABI=armeabi-v7a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a" ^
  "-DANDROID_NDK=C:\\Users\\Dell\\AppData\\Local\\Android\\sdk\\ndk\\25.1.8937393" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\Dell\\AppData\\Local\\Android\\sdk\\ndk\\25.1.8937393" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\Dell\\AppData\\Local\\Android\\sdk\\ndk\\25.1.8937393\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\Dell\\AppData\\Local\\Android\\sdk\\cmake\\3.18.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=C:\\Users\\Dell\\Downloads\\UBFACTORY-FOOD-DELIVERY-FLUTTER\\build\\rive_common\\intermediates\\cxx\\Debug\\2i4n5w5b\\obj\\armeabi-v7a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=C:\\Users\\Dell\\Downloads\\UBFACTORY-FOOD-DELIVERY-FLUTTER\\build\\rive_common\\intermediates\\cxx\\Debug\\2i4n5w5b\\obj\\armeabi-v7a" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BC:\\Users\\Dell\\AppData\\Local\\Pub\\Cache\\hosted\\pub.flutter-io.cn\\rive_common-0.2.6\\android\\.cxx\\Debug\\2i4n5w5b\\armeabi-v7a" ^
  -GNinja
