# BiyudFormer
Drug Beyond Use Date Mobile App

## What You Need (because .gitignore)
check https://gist.github.com/nimdasx/72f59282a8dd58db4c3b6da6e14ee247  
- /assets/config.yaml
- /android/key.properties
- /android/upload-keystore.jks

## catatan
```
brew install openjdk@17
sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
cd android/
./gradlew wrapper --gradle-version=8.7
flutter clean
flutter run
```