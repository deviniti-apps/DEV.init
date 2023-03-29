<p align="center">
    <img src="./readme/deviniti-logo.webp" width="100" height="100"/> <br /><br />
    <span>This is the tool for project creation.<br />
</p>

<p align="center">
    <a href="https://deviniti.com/"><img src="https://img.shields.io/badge/powered%20by-Deviniti-fe4b1f.svg?style=flat-square" /></a>
    <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-purple.svg?style=flat-square"></a>
</p>


# About

Are you tired of creating new Flutter projects directly from scratch? Do you think that it costs you a lot of time and effort to setup the things right? Would you like to have a tool that will do that for you in just a minute?

We faced the same problems and we found a solution. You are in a good place!

We want to introduce you a tool called DEV.init! It provides a quick way to generate new Flutter projects with everything you need! By using it, you will save a lot of time, especially at the beginning of your project.

# Overview

- [ Getting started ](#getting-started)
- [ Next steps ](#next-steps)
- [ What's inside? ](#whats-inside)
    - [ Packages ](#whats-inside-packages)
    - [ Architecture ](#whats-inside-architecture)
    - [ Templates & Mason ](#whats-inside-templates-mason)
    - [ CI/CD ](#local-continuous-integration-and-deployment)
    - [ Testing ](#whats-inside-testing)
    


<a name="getting-started"></a>
## Getting started

- Open terminal and clone this project:
```bash
> git clone https://github.com/deviniti-apps/DEV.init.git
```
<p>
    <img src="./readme/gitclone.gif" width="400" height="400" /><br />
</p>

- Go to created folder:
```bash
> cd DEV.init 
```

<p>
    <img src="./readme/cd.gif" width="400" height="400" /><br />
</p>

- To run project creator type:
```bash
> ./create.sh
```

- The script will ask you about the app name. Provide any single or snake_cased word: 
```bash
> dev_init
```

<p>
    <img src="./readme/create-and-appname.gif" width="400" height="400" /><br />
</p>


- The script will ask you about the package name. Provide e.g. com.deviniti.app:
```bash
> com.deviniti.devinit
```

<p>
<img src="./readme/packagename.gif" width="400" height="400" /><br />
</p>

- Now the project is baking... it's going to take about a minute :)

<p>
    <img src="./readme/success.gif" width="400" height="400" /><br />
</p>

<a name="next-steps"></a>
# Next steps
Go to created project, open README file and:
- Install required tools
- Follow required steps to run the project

You may also want to change:
- [Flutter version](https://docs.flutter.dev/development/tools/pubspec)  or [FVM Flutter version](https://fvm.app/docs/guides/basic_commands)
- [Android version](https://docs.flutter.dev/deployment/android)
- [iOS version](https://docs.flutter.dev/deployment/ios)

<a name="whats-inside"></a>
# What's inside?

<a name="whats-inside-packages"></a>
## Packages

These are the packages we are using in the created project:
- [Bloc](https://pub.dev/packages/bloc)
- [Dio](https://pub.dev/packages/dio)
- [Retrofit](https://pub.dev/packages/retrofit)
- [freezed](https://pub.dev/packages/freezed)
- [get_it](https://pub.dev/packages/get_it) 
- [go_router](https://pub.dev/packages/go_router)
- [Melos](https://pub.dev/packages/melos)
- [Mason](https://pub.dev/packages/mason)

...and more! 
Check all the packages here: 
- [presentation](./core/modules/presentation/pubspec.yaml)
- [domain](./core/modules/domain/pubspec.yaml)
- [remote](./core/modules/remote/pubspec.yaml)

<a name="whats-inside-architecture"></a>
## Architecture

The architecture of the created project follows the principles of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html). 

We have `remote` and `domain` module. Remote module has domain module. Domain module exposes interfaces
of `remote_data_sources` where `remote` needs to conform to them. It's like a contract of communication between domain
and remote.

All application code is in `presentation` module.

<a name="whats-inside-templates-mason"></a>
## Templates & Mason

In the created project you can find `mason` directory where you can see the `flutter_screen` and `flutter_remote_usecase` templates.
You can add your own templates or modify existing one. Templates are used to speed up the work.
Thanks to them, you can create default files structure with default implementation.

For example: 

For generating new screens with associated routes and Bloc. Run:
- `mason make flutter_screen`
in the top project directory and follow the interactive prompts

<p>
    <img src="./readme/mason-flutter-screen.gif"  /><br />
</p>

To create the entire usecase path with models, mappers, APIs, datasources etc. through every module in the project in just a few seconds. Run:
- `mason make flutter_remote_usecase`

<p>
    <img src="./readme/mason-flutter-usecase.gif"  /><br />
</p>


<a name="#local-continuous-integration-and-deployment"></a>
## Local Continuous Integration and Deployment is performed using Bitrise and Fastlane

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


<a name="whats-inside-testing"></a>
## Testing

There is a melos script called `test_coverage`. It uses a tool called `lcov`. You need to install it on your mac. You can do that by running:

```
brew install lcov
```
once you are set with lcov, you can run the Melos script.

```
melos run test_coverage
```

it will generate the test coverage for your package/packages and put the results in the `coverage` folder.

<a name="whats-inside-vsc-extensions"></a>
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

