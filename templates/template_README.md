# _RAW_NAME_

You can visit project [site](https://example.com/)

## Languages, libraries and tools used

- Versions are described in pubspec.yml files inside root folder and modules/* folders

## Requirements

- [FVM](https://fvm.app/)
- Flutter
- Dart SDK included in Flutter
- [Melos](https://pub.dev/packages/melos)
- [Mason](https://pub.dev/packages/mason)
- Android ([since API 23](https://source.android.com/docs/setup/start/build-numbers#platform-code-names-versions-api-levels-and-ndk-releases))
- [Android SDK](https://developer.android.com/studio/index.html)
- Latest Android SDK Tools and build tools.
- [iOS 13](https://developer.apple.com/documentation/ios-ipados-release-notes)
- [Xcode](https://developer.apple.com/xcode/)
- JDK 1.8

## How to build app on local environment

### First step

We use [FVM](https://fvm.app/) in this project, make sure you have it installed.

Run command `fvm use {flutterVersion}` (for example `fvm use 3.13.9`) in root project directory.

### Second step

We use [Melos](https://pub.dev/packages/melos) in this project to make commands user friendly.

Run:
- `chmod +x *.sh` in terminal
- `melos run` in terminal
- select `rebuild all` and run it for all packages

Now you need to wait for a while. This command will rebuild all of the packages and regenerate generated files.

### Third step

We need to configure our local environment variables - you can see the detailed example below in the section `Setup local environments`.

In the root project directory, there is a file called `flutter_build_env.sh`.

You can run it as follow:

```
./flutter_build_env.sh apiUrl
```

example:
```
./flutter_build_env.sh https://your_api_url.com
```

it will create `.env` in `modules/presentation/lib/environment/` file for you.

### Last step

Finally, you can run the application using the following command line:
- `melos run` in terminal select `rebuild all` and run it for all packages to make sure that all rebuilt successfully
- `flutter run --debug --flavor development`
  or
- `flutter run --debug --flavor staging`
  or
- `flutter run --debug --flavor production`

or use your favorite IDE to achieve the same

## Setup local environments

This project uses [Envied](https://pub.dev/packages/envied) for managing environment properties. If you want to add new env variables, you should:
- go to `modules/presentation/lib/environment/env.dart` file
- add new static final there
- update script inside `./flutter_build_env.sh` with created environemnt variable

### Example of adding new env variable


`modules/presentation/lib/environment/env.dart`
```
abstract class Env {
  @EnviedField(varName: 'API_URL')
  static final apiUrl = _Env.apiUrl; // it's already there

  // Add new env
  @EnviedField(varName: 'YOUR_NEW_ENV')
  static final myNewEnv = _Env.myNewEnv;
}
```

`./flutter_build_env.sh`
```
cat <<EOT > modules/presentation/lib/environment/.env
API_URL=$1
YOUR_NEW_ENV=$2
EOT
```

then:

```
./flutter_build_env.sh "https://your_api_url.com" "your_new_env"
```

finally:

```
melos run generate_code
```

# Local Continuous Integration and Deployment is performed using Bitrise and Fastlane

### Environments

API environments with corresponding **flavors**

- development
- staging
- production

### Local fastlane configutation for iOS

In order to regenerate certificates and profiles, you should move to the ios directory and export environment variables. Usually, values of those variables are set on the Pass Bolt. However, if you are making it for the first time on the new project, make sure you store them on Pass Bolt.
Please make sure that before running everything on Bitrise, you setup your Fastfiles correctly. The project templator creates Fastfiles that need some configuration like setting of firebase app number.

```bash
export APP_STORE_CONNECT_API_KEY_KEY_ID=VALUE
export APP_STORE_CONNECT_API_KEY_ISSUER_ID=VALUE
export APPLE_TEAM_ID=VALUE
export MATCH_PASSWORD=VALUE
export CERTIFICATES_GIT_URL=VALUE
export APP_STORE_CONNECT_API_KEY_KEY_FILEPATH=VALUE #For example "./auth_key.p8"
```

Optional commands:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=VALUE #For example development-service-account.json
export DEVELOPMENT_IOS_FIREBASE_APP_ID=VALUE
export STAGING_IOS_FIREBASE_APP_ID=VALUE
export PRODUCTION_IOS_FIREBASE_APP_ID=VALUE
```

example:

Inside ios folder you can create a new script - name it as you want. Then put the variables to that file, and simply call `source export_env.sh`. Make sure that you won't add it to the version control.



Then run:

- `fastlane certificates type:development readonly:false force:true`
- `fastlane certificates type:adhoc readonly:false force:true`
- `fastlane certificates type:appstore readonly:false force:true`

In order to only get certificates and profiles run:

- `fastlane certificates type:development readonly:true force:false`
- `fastlane certificates type:adhoc readonly:true force:false`
- `fastlane certificates type:appstore readonly:true force:false`

For more information read https://docs.fastlane.tools/actions/match/#parameters

### Environment variables (Used basicaly in Bitrise)

- [Android KeyStore (guide)](https://developer.android.com/studio/publish/app-signing#generate-key) : this is key for
  application signing
  - `KEYSTORE_KEY_ALIAS` - alias of the key
  - `KEYSTORE_KEY_PASSWORD` - password for the key
  - `KEYSTORE_STORE_PASSWORD` - password for keystore where keys are stored
  - `UPLOAD_KEYSTORE_FILE` - keystore filename
  - `UPLOAD_KEY_CONTENT` - content in base64 of keystore

- [Google Service Accounts (guide)](https://cloud.google.com/iam/docs/service-accounts) : used for accessing firebase api
  project and app distribution. For each environment create separate firebase project and then generate service account.
  - `DEVELOPMENT_SERVICE_ACCOUNT`
  - `STAGING_SERVICE_ACCOUNT`
  - `PRODUCTION_SERVICE_ACCOUNT`
  - `GOOGLE_PLAY_SERVICE_ACCOUNT` - used for accessing Google Play API mostly to distribute application

- [Fastlane Match (guide)](https://docs.fastlane.tools/actions/match/) : tool used for creating certificates and provisioning
  profiles for signing iOS application
  - `APPLE_TEAM_ID` - team ID you want to use for the Apple Developer Portal
  - `MATCH_PASSWORD` - password for decrypting content in certificates repository
  - `CERTIFICATES_GIT_URL` - git url to certificates repository
  - `APP_STORE_CONNECT_API_KEY_FILE` - content file of p8 key
  - `APP_STORE_CONNECT_API_KEY_KEY_FILEPATH` - the path to the key p8 file
  - `APP_STORE_CONNECT_API_KEY_ISSUER_ID` - identifies the issuer who created the authentication token
  - `APP_STORE_CONNECT_API_KEY_KEY_ID` - id of the key for Apple App Store Connect API

- REST API
    - `DEVELOPMENT_REST_API_URL`
    - `STAGING_REST_API_URL`
    - `PRODUCTION_REST_API_URL`

# Releases & versioning

We follow rules of [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
and [Semver](https://semver.org/)

# Contribution

## Commit Message Naming

Consist of two parts:

- Subject: Short informative summary of the commit
- Body: More detailed explanatory text if needed

### Subject:

Short and descriptive (max 50 chars)

- With task number (if exists)
- Capitalized
- In imperative present tense
- Not end with period

Example:

If TASK-NO exists
```
TASK-1: Add splash screen
```

or if TASK-NO doesn't exist
```
Add splash screen
```

### Body:

Separated with a blank line from the subject

- Optional
- Explain what, why, etc.
- Max 72 chars
- Each paragraph capitalized

Example:

```
Splash screen is displayed on the application startup.

It shows application logo.
```

## Branch naming:

`feature/TASK-NO-couple-of-words-about-feature` - if TASK-NO exists
`feature/couple-of-words-about-feature` - if TASK-NO doesn't exist

## Pull Request naming:

`TASK-NO: couple of words about PR` - if TASK-NO exists
`Couple of words about PR` - if TASK-NO doesn't exist

# Architecture

The architecture of the project follows the principles of [Bloc](https://bloclibrary.dev/).

We have `remote` and `domain` module. Remote module has domain module. Domain module exposes interfaces
of `remote_data_sources` where `remote` needs to conform to them. It's like a contract of communication between domain
and remote.

All application code is in `presentation` module.

# Testing

There is a melos script called `test_coverage`. It uses a tool called `lcov`. You need to install it on your mac. You can do that by running:

```
brew install lcov
```
once you are set with lcov, you can run the Melos script.

```
melos run test_coverage
```

it will generate the test coverage for your package/packages and put the results in the `coverage` folder.

### Visual Studio Code extensions

The results of the Melos script are possible to connect with Visual Studio Code. You need to do the following:

1. Install the `Flutter Coverage` extension
2. Install the `Coverage Gutters` extension
3. In VS Code change the `settings.json` (CMD + P -> settings.json) file and add:

``` bash
"flutter-coverage.coverageFileNames": [
    "lcov_cleaned.info",
],
"flutter-coverage.coverageFilePaths": [
    "modules/[your-module]/coverage"
    # For example
    # "modules/domain/coverage",
    # "modules/remote/coverage",
    # "modules/presentation/coverage",
],
```


4. Press the `Watch` button - which is at the bottom of the VS Code bar. 

5. See the coverage report separated by files and lines from the `Testing` tab in VS Code.

# Templates & Mason

In the project you can find `mason` directory where you can see the `flutter_screen` and `flutter_remote_usecase` templates.
You can add your own templates or modify existing one. Templates are used to seed up work.
Thanks to them, you can create default files structure with default implementation.

For example use Mason for generating new screens with associated routes and Bloc. Run:
- `mason make flutter_screen`
in the top project directory and follow the interactive prompts
