# Flutter Project Creator

## This is the tool for project creation. It creates a project with standard modules and configuration.

### How to use it

Clone this to project and open terminal session in it. Now run ./create.sh it will ask for application name and package name.

# What's inside?

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
- [presentation](https://github.com/deviniti-apps/DEV.init/blob/master/core/modules/presentation/pubspec.yaml)
- [domain](https://github.com/deviniti-apps/DEV.init/blob/master/core/modules/domain/pubspec.yaml)
- [remote](https://github.com/deviniti-apps/DEV.init/blob/master/core/modules/remote/pubspec.yaml)

## Architecture

The architecture of the created project follows the principles of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html). 

We have `remote` and `domain` module. Remote module has domain module. Domain module exposes interfaces
of `remote_data_sources` where `remote` needs to conform to them. It's like a contract of communication between domain
and remote.

All application code is in `presentation` module.

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

## Templates & Mason

In the created project you can find `mason` directory where you can see the `flutter_screen` and `flutter_remote_usecase` templates.
You can add your own templates or modify existing one. Templates are used to speed up the work.
Thanks to them, you can create default files structure with default implementation.

For example use Mason for generating new screens with associated routes and Bloc. Run:
- `mason make flutter_screen`
in the top project directory and follow the interactive prompts
