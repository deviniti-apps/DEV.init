cd modules/remote/ && flutter pub get && cd ../../
cd modules/domain/ && flutter pub get && cd ../../
cd modules/foundation/ && flutter pub get && cd ../../
cd modules/presentation/ && flutter pub get && cd ../../

flutter pub get

echo 'Rebuilding in remote'
cd modules/remote/ && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ../../

echo 'Rebuilding in domain'
cd modules/domain/ && flutter packages pub run build_runner build --delete-conflicting-outputs && cd ../../

echo 'Rebuilding in presentation'
cd modules/presentation/ && flutter packages pub run build_runner build --delete-conflicting-outputs


flutter gen-l10n --arb-dir=assets/l10n \
    --template-arb-file=translations_en.arb \
    --output-localization-file=translations.dart \
    --output-class=Translations \
    --output-dir=lib/l10n \
    --no-synthetic-package \
    && cd ../../
