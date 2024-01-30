# BUD
Drug Beyond Use Date Mobile App

## What You Need (because .gitignore)
- /assets/config.yaml
- /android/key.properties
- /android/upload-keystore.jks

## Ganti Logo
edit pubspec.yaml  
```
dev_dependencies:
  flutter_launcher_icons: "^0.13.1"
```
dan edit flutter_launcher_icons.yaml  

eksekusi ganti logo
```
flutter pub get  
flutter pub run flutter_launcher_icons  
```

## Rename
```
flutter pub global activate rename  
flutter pub global run rename setAppName --value "BiyudFormer"  
flutter pub global run rename setBundleId --value "id.web.sofy.biyudformer"  
```

## Sign 
create keystore
```
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA \
        -keysize 2048 -validity 10000 -alias upload
```

android/key.properties  
```
storePassword=<password-from-previous-step>
keyPassword=<password-from-previous-step>
keyAlias=upload
storeFile=<keystore-file-location>
```

android/app/build.gradle  
before android block  
```
def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }
```

android/app/build.gradle  
find buildTypes block, replace with this  
```
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }
```

## Build
```
flutter clean
flutter build apk --release 
flutter build appbundle --release
```
