# bud
Drug Beyond Use Date Mobile App

## build
```
flutter build apk --release  
```

## ganti logo
edit pubspec.yaml  
```
dev_dependencies:
  flutter_launcher_icons: "^0.13.1"

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/app_logo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  web:
    generate: true
    image_path: "assets/app_logo.png"
    background_color: "#hexcode"
    theme_color: "#hexcode"
  windows:
    generate: true
    image_path: "assets/app_logo.png"
    icon_size: 48 # min:48, max:256, default: 48
  macos:
    generate: true
    image_path: "assets/app_logo.png"
```
```
flutter pub get  
flutter pub run flutter_launcher_icons  
```

## rename
```
flutter pub global activate rename  
flutter pub global run rename setAppName --value "BiyudFormer"  
flutter pub global run rename setBundleId --value "id.web.sofy.biyudformer"  
```

## sign 
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

```
flutter clean
flutter build appbundle --release
```