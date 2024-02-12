# Docker for Android SDK 34

Docker for Android SDK 34 with preinstalled build tools and emulator image

> Edit from [mindrunner/docker-android-sdk](https://github.com/mindrunner/docker-android-sdk)

**Installed Packages**
```bash
# sdkmanager --list
Installed packages:
  Path                                    | Version       | Description                             | Location                               
  -------                                 | -------       | -------                                 | -------                                
  build-tools;34.0.0                      | 34.0.0        | Android SDK Build-Tools 34              | build-tools/34.0.0                     
  cmake;3.22.1                            | 3.22.1        | CMake 3.22.1                            | cmake/3.22.1                           
  cmdline-tools;latest                    | 12.0          | Android SDK Command-line Tools (latest) | cmdline-tools/latest                   
  emulator                                | 33.1.24       | Android Emulator                        | emulator                               
  ndk;26.1.10909125                       | 26.1.10909125 | NDK (Side by side) 26.1.10909125        | ndk/26.1.10909125                      
  platform-tools                          | 34.0.5        | Android SDK Platform-Tools              | platform-tools                         
  platforms;android-34                    | 2             | Android SDK Platform 34                 | platforms/android-34                   
  system-images;android-34;default;x86_64 | 4             | Intel x86_64 Atom System Image          | system-images/android-34/default/x86_64
```

**Usage**

- Interactive way
  ```bash
  $ docker build . -t android-34
  $ docker run -it --rm --device /dev/kvm android-34:latest bash
  # check installed packages
  $ sdkmanager --list
  # create and run emulator
  $ avdmanager create avd -n first_avd --abi google_apis/x86_64 -k "system-images;android-34;google_apis;x86_64"
  $ emulator -avd first_avd -no-window -no-audio &
  $ adb devices
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```

  To connect the emulator using `adb` on the docker host machine, start the container with `--network host` as well.
  You could also use [`scrcpy`](https://github.com/Genymobile/scrcpy) to do a screencast of the emulator.

- Non-interactive way
  ```bash
  # check installed packages
  $ docker run -it --rm android-34:latest sdkmanager --list
  # list existing emulators
  $ docker run -it --rm android-34:latest avdmanager list avd
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```