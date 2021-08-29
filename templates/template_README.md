# _RAW_NAME_

You can visit project [site](https://_RAW_NAME_.com/)

## Languages, libraries and tools used

- Versions are described in pubspec.yml in modules/presentation

## Requirements

* JDK 1.8
* [Android SDK](https://developer.android.com/studio/index.html)
* Android ([API 21 to 30](https://developer.android.com/preview/api-overview.html))
* iOS 13
* Latest Android SDK Tools and build tools.
* Xcode
* Latest Dart SDK
* Flutter SDK

## How to build app on local environment

Setup project:

- TODO

You can run the application using following command line:

- add `.env` to assets directory with `API_URL` environment variable
- `chmod +x build_runner_rebuild.sh && chmod +x flutter_get_all.sh && chmod +x flutter_test_all.sh` -- add execution rights
- `./build_runner_rebuild.sh` -- it will rebuild modules
- `flutter run --debug --flavor development`
or
- `flutter run --debug --flavor staging`
or
- `flutter run --debug --flavor production`

### Local Continuous Integration and Deployment is performed using ?? and Fastlane

### Environment variables:
- Google Services files content
    - Android
        - `DEVELOPMENT_ANDROID_GOOGLE_SERVICES_JSON`
        - `STAGING_ANDROID_GOOGLE_SERVICES_JSON`
        - `PRODUCTION_ANDROID_GOOGLE_SERVICES_JSON`
    - iOS
        - `DEVELOPMENT_IOS_GOOGLE_SERVICES_PLIST`
        - `STAGING_IOS_GOOGLE_SERVICES_PLIST`
        - `PRODUCTION_IOS_GOOGLE_SERVICES_PLIST`
- iOS XC Config files content
    - iOS
        - `DEVELOPMENT_IOS_XC_CONFIG`
        - `STAGING_IOS_XC_CONFIG`
        - `PRODUCTION_XC_CONFIG`
- Android Upload Key (keystore)
    - `KEYSTORE_KEY_ALIAS`
    - `KEYSTORE_KEY_PASSWORD`
    - `KEYSTORE_STORE_PASSWORD`
    - `UPLOAD_KEYSTORE`
- iOS Fastlane Match
    - `MATCH_PASSWORD`
    - `MATCH_GIT_BASIC_AUTHORIZATION`
    - `APPLE_STORE_CONNECT_KEY_ID`
    - `APPLE_STORE_CONNECT_ISSUER_ID`
    - `APPLE_STORE_CONNECT_TEAM_ID`
- Google Service Accounts files content
    - `DEVELOPMENT_SERVICE_ACCOUNT` - used for firebase project and app distribution
    - `STAGING_SERVICE_ACCOUNT` - used for firebase project and app distribution
    - `PRODUCTION_SERVICE_ACCOUNT` - used for firebase project and app distribution
    - `GOOGLE_PLAY_SERVICE_ACCOUNT` - used for google play app distribution
- Firebase Application ID
    - Android
        - `DEVELOPMENT_ANDROID_FIREBASE_APP_ID`
        - `STAGING_ANDROID_FIREBASE_APP_ID`
        - `PRODUCTION_ANDROID_FIREBASE_APP_ID`
    - iOS
        - `DEVELOPMENT_IOS_FIREBASE_APP_ID`
        - `STAGING_IOS_FIREBASE_APP_ID`
        - `PRODUCTION_IOS_FIREBASE_APP_ID`
- Facebook Application
    - `DEVELOPMENT_FACEBOOK_APP_ID`
    - `STAGING_FACEBOOK_APP_ID`
    - `PRODUCTION_FACEBOOK_APP_ID`
- REST API
    - `DEVELOPMENT_REST_API_URL`
    - `STAGING_REST_API_URL`
    - `PRODUCTION_REST_API_URL`

### Environments
API environments with corresponding **flavors**
- development
- staging
- production

# Releases & versioning

We follow rules of [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) and [Semver](https://semver.org/)

# Contribution

We use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

Example:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

We allow for types `fix`, `feat`, `chore`, `ci`, `docs`, `style`, `refactor`, `test`

# Branch naming:

`feature/TASK-NO_couple_of_words_about_feature`

# Pull Request naming:

`TASK-NO: couple of words about PR`

## Architecture

The architecture of the project follows the principles of [Bloc](https://bloclibrary.dev/).

We have `remote` and `domain` module. Remote module has domain module.
Domain module exposes interfaces of `remote_data_sources` where `remote` needs to conform to them.
It's like a contract of communication between domain and remote.

All application code is in `presentation` module.

## Testing

- `./flutter_test_all.sh`
