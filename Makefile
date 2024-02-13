.PHONY: build run clean list

build: build-desktop build-server

run: run-desktop run-server

clean: clean-desktop clean-server

list:
	./gradlew tasks --all

## iOS
#setup-ios:
#    # iOS向けのセットアップコマンド
#	xcodebuild -project ./iosApp/iosApp.xcodeproj -scheme iosApp -configuration Debug OBJROOT=build/ios SYMROOT=build/ios -destination id=00008120-001C5D003492201E -allowProvisioningDeviceRegistration -allowProvisioningUpdates
#
#build-ios:
#	./gradlew linkDebugFrameworkIosArm64
#
#run-ios:
#    # iOSアプリの実行コマンド
#
#clean-ios:
#	./gradlew clean

## Android
#setup-android:
#    # Android向けのセットアップコマンド
#
#build-android:
#	./gradlew assembleDebug
#
#run-android:
#	./gradlew installDebug
#
#clean-android:
#	./gradlew clean

# Desktop
setup-desktop:
    # Desktop向けのセットアップコマンド

build-desktop:
	./gradlew desktopJar

run-desktop:
	./gradlew composeApp:runRelease

clean-desktop:
	./gradlew clean
#
# # Server
# setup-server:
#     # Server向けのセットアップコマンド

build-server:
	./gradlew server:installDist
run-server:
	./server/build/install/server/bin/server

debug-server:
    # Serverアプリの実行コマンド
	./gradlew :server:run
clean-server:
	./gradlew :server:clean










# web build

build-browser:
	./gradlew composeApp:wasmJsBrowserDevelopmentWebpack

debug-browser:
	./gradlew composeApp:wasmJsBrowserDevelopmentRun

production-browser:
	./gradlew composeApp:wasmJsBrowserProductionRun
