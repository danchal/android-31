# Docker for Android SDK 28

Docker for Android SDK 28 with preinstalled build tools and emulator image

> Edit from [mindrunner/docker-android-sdk](https://github.com/mindrunner/docker-android-sdk)

**Installed Packages**
```bash
# sdkmanager --list_installed
Installed packages:
  Path                                    | Version       | Description                             | Location                               
  -------                                 | -------       | -------                                 | -------                                
  build-tools;34.0.0                      | 34.0.0        | Android SDK Build-Tools 34              | build-tools/34.0.0                     
  cmake;3.22.1                            | 3.22.1        | CMake 3.22.1                            | cmake/3.22.1                           
  cmdline-tools;latest                    | 13.0          | Android SDK Command-line Tools (latest) | cmdline-tools/latest                   
  emulator                                | 34.2.14       | Android Emulator                        | emulator                               
  ndk;26.3.11579264                       | 26.3.11579264 | NDK (Side by side) 26.3.11579264        | ndk/26.3.11579264                      
  platform-tools                          | 35.0.1        | Android SDK Platform-Tools              | platform-tools                         
  platforms;android-28                    | 6             | Android SDK Platform 28                 | platforms/android-28                   
  system-images;android-28;default;x86_64 | 4             | Intel x86_64 Atom System Image          | system-images/android-28/default/x86_64
```

**Usage**

- Interactive way
  ```bash
  $ docker build . -t android-sdk:28
  $ docker run -it --rm --device /dev/kvm android-sdk:28 bash
  # check installed packages
  $ sdkmanager --list
  # create and run emulator
  $ avdmanager create avd -n first_avd --abi google_apis/x86_64 -k "system-images;android-28;google_apis;x86_64"
  $ emulator -avd first_avd -no-window -no-audio &
  $ adb devices
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```

  To connect the emulator using `adb` on the docker host machine, start the container with `--network host` as well.
  You could also use [`scrcpy`](https://github.com/Genymobile/scrcpy) to do a screencast of the emulator.

- Non-interactive way
  ```bash
  # check installed packages
  $ docker run -it --rm android-sdk:28 sdkmanager --list
  # list existing emulators
  $ docker run -it --rm android-sdk:28 avdmanager list avd
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```