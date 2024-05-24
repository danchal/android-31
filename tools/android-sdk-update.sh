#!/bin/bash

echo "Bootstrapping SDK-Tools"
wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -O commandlinetools-linux.zip
unzip commandlinetools-linux.zip
mkdir cmdline-tools
mv tools cmdline-tools/
rm commandlinetools-linux.zip

echo "Update packages lists"
/opt/tools/android-accept-licenses.sh "sdkmanager --package_file=/opt/tools/package-list.txt --verbose"

echo "Updating SDK"
/opt/tools/android-accept-licenses.sh "sdkmanager --update"

echo "Accepting Licenses"
/opt/tools/android-accept-licenses.sh "sdkmanager --licenses --verbose"

echo "Installing packages"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "cmdline-tools;latest"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "build-tools;34.0.0"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "platform-tools"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "platforms;android-28"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "system-images;android-28;default;x86_64"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager 'cmake;3.22.1'
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager 'ndk;26.3.11579264'
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "emulator"