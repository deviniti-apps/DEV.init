cd modules

cd domain/
fvm flutter test --reporter expanded --coverage
genhtml coverage/lcov.info -o ../../coverage/domain-html
cd ../

cd remote/
fvm flutter test --reporter expanded --coverage
lcov --remove coverage/lcov.info "lib/api/**.dart" "lib/models/**.dart" "lib/other/error/error_converter_extension.dart" -o coverage/lcov_cleaned.info
genhtml coverage/lcov_cleaned.info -o ../../coverage/remote-html
cd ../

cd presentation/
fvm flutter test --reporter expanded --coverage
lcov --remove coverage/lcov.info "lib/l10n/l10n_extensions.dart" "lib/l10n/translations.dart" "lib/l10n/translations_en.dart" "lib/components/pagination/pagination_list.dart" "lib/components/pagination/pagination_manager.dart" "lib/common/**.dart" -o coverage/lcov_cleaned.info
genhtml coverage/lcov_cleaned.info -o ../../coverage/presentation-html
cd ../../
