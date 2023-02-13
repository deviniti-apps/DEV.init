# _RAW_NAME_

You can visit project [site](https://example.com/)

## Languages, libraries and tools used

- Versions are described in pubspec.yml in modules/presentation

## Requirements

* JDK 1.8
* [Android SDK](https://developer.android.com/studio/index.html)
* Android ([since API 23](https://developer.android.com/preview/api-overview.html))
* iOS since 13.0
* Latest Android SDK Tools and build tools.
* Xcode
* Latest Dart SDK
* Flutter SDK
* FVM

## How to build app on local environment

You can run the application using following command line:

- `chmod +x *.sh`
- `./flutter_rebuild_all.sh` -- it will rebuild modules
- `flutter run --debug --flavor development`
  or
- `flutter run --debug --flavor staging`
  or
- `flutter run --debug --flavor production`

### Local Continuous Integration and Deployment is performed using Bitrise and Fastlane

### Using fastlane for iOS

In order to regenerate certificates and profiles move to ios directory and export variables. Values of those variables get from pass bolt.
Be sure that at Fastfiles you have updated firebase app number.

```bash
export CERTIFICATES_GIT_URL=VALUE
export APP_STORE_CONNECT_API_KEY_KEY_ID=VALUE
export APP_STORE_CONNECT_API_KEY_ISSUER_ID=VALUE
export APPLE_TEAM_ID=VALUE
export APP_STORE_CONNECT_API_KEY_KEY_FILEPATH=VALUE
export MATCH_PASSWORD=VALUE
```

You can create script for that and then use `source export_env.sh`, make sure you won't add it to version control.

Then run:

- `fastlane certificates type:development readonly:false force:true`
- `fastlane certificates type:adhoc readonly:false force:true`
- `fastlane certificates type:appstore readonly:false force:true`

In order to only get certificates and profiles run:

- `fastlane certificates type:development readonly:true force:false`
- `fastlane certificates type:adhoc readonly:true force:false`
- `fastlane certificates type:appstore readonly:true force:false`

For more information read https://docs.fastlane.tools/actions/match/#parameters

### Environment variables:

- [Android KeyStore (guide)](https://developer.android.com/studio/publish/app-signing#generate-key) : this is key for
  application signing
    - `KEYSTORE_KEY_ALIAS` - alias of the key
    - `KEYSTORE_KEY_PASSWORD` - password for the key
    - `KEYSTORE_STORE_PASSWORD` - password for keystore where keys are stored
    - `UPLOAD_KEYSTORE` - content in base64 of keystore
- [Fastlane Match (guide)](https://docs.fastlane.tools/actions/match/) : tool used for creating certificates and provisioning
  profiles for signing iOS application
    - `MATCH_PASSWORD` - password for decrypting content in certificates repository
    - `APPLE_STORE_CONNECT_KEY_ID` - id of the key for Apple App Store Connect API
    - `APPLE_STORE_CONNECT_ISSUER_ID` - identifies the issuer who created the authentication token
    - `APPLE_STORE_CONNECT_TEAM_ID` - id of the team on the Apple Developer Program
    - `APP_STORE_CONNECT_API_KEY_KEY_FILEPATH` - the path to the key p8 file
    - `APP_STORE_CONNECT_API_KEY_CONTENT` - content file of p8 key
    - `CERTIFICATES_GIT_URL` - git url to certificates repository
    - `SPACESHIP_CONNECT_API_IN_HOUSE` - is App Store or Enterprise (in house) team? App Store Connect API cannot
      determine this on its own (yet)
- [Google Service Accounts (guide)](https://cloud.google.com/iam/docs/service-accounts) : used for accessing firebase api
  project and app distribution. For each environment create separate firebase project and then generate service account.
    - `DEVELOPMENT_SERVICE_ACCOUNT`
    - `STAGING_SERVICE_ACCOUNT`
    - `PRODUCTION_SERVICE_ACCOUNT`
    - `GOOGLE_PLAY_SERVICE_ACCOUNT` - used for accessing Google Play API mostly to distribute application
- REST API
    - `DEVELOPMENT_REST_API_URL`
    - `STAGING_REST_API_URL`
    - `PRODUCTION_REST_API_URL`

### Environments

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
echo "API_URL=$1\nYOUR_NEW_ENV=$2" > modules/presentation/lib/environment/.env
```

then:

```
./flutter_build_env.sh "https://your_api_url.com" "your_new_env"
```

finally:

```
melos run generate_code
```

API environments with corresponding **flavors**

- development
- staging
- production

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

- With task number
- Capitalized
- In imperative present tense
- Not end with period

Example:

```
TASK-1: Add splash screen
```

### Body:

Separated with a blank line from the subject

- Explain what, why, etc.
- Max 72 chars
- Each paragraph capitalized

Example:

```
Splash screen is displayed on the application startup.

It shows application logo.
```

## Branch naming:

`feature/TASK-NO_couple_of_words_about_feature`

## Pull Request naming:

`TASK-NO: couple of words about PR`

# Architecture

The architecture of the project follows the principles of [Bloc](https://bloclibrary.dev/).

We have `remote` and `domain` module. Remote module has domain module. Domain module exposes interfaces
of `remote_data_sources` where `remote` needs to conform to them. It's like a contract of communication between domain
and remote.

All application code is in `presentation` module.

## Testing

Install [lcov](https://formulae.brew.sh/formula/lcov)

To run all test use:

- `./flutter_test_all.sh`

Test coverage report you can find under [coverage](tis_payments/coverage/]) directory.

In order to include all files from a given module in test code coverage reports run
`./flutter_real_test_coverage_all.sh` it will create `real_coverage_test.dart` file in test directory.

This is the workaround for including all files in test code coverage.

# Templates

In the project you can find `templates` directory where you can see the `screen` template.
You can add your own templates or modify existing one. Templates are used to seed up work.
Thanks to them, you can create default files structure with default implementation.

For example the `screen` template allows you to create following screen files structure:
- profile
  - bloc
    - profile_bloc.dart
    - profile_event.dart
    - profile_state.dart
  - profile_argument.dart
  - profile_route.dart
  - profile_screen.dart
