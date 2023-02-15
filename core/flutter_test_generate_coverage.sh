flutter test --reporter expanded --coverage
OUTPUT=`lcov --remove coverage/lcov.info \
"lib/api/**.dart" \
"lib/l10n/l10n_extensions.dart" \
"lib/l10n/translations.dart" \
"lib/l10n/translations_en.dart" \
"lib/router/**.dart" \
"lib/models/user/*.g.dart" \
"lib/models/*.g.dart" \
"lib/model/*.g.dart" \
"lib/components/snack_bar/**.dart" \
"lib/models/error/**.dart" \
"lib/components/auth/auth_navigation_hub.dart" \
"lib/components/pagination/pagination_list.dart" \
"lib/components/pagination/pagination_manager.dart" \
"lib/screens/*/*_screen.dart" \
"lib/screens/*/*_route.dart" \
"lib/widgets/**.dart" \
"lib/environment/**.dart" \
"lib/application/**.dart" \
"lib/injector_container.dart" \
"lib/domain_injector.dart" \
"lib/remote_injector.dart" \
"lib/presentation.dart" \
"lib/common/**.dart" -o coverage/lcov_cleaned.info`
genhtml coverage/lcov_cleaned.info -o ../../coverage/$1-html