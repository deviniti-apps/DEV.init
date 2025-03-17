flutter pub get

echo 'Rebuilding in remote'
cd modules/remote/ && dart run build_runner build --delete-conflicting-outputs && cd ../../

echo 'Rebuilding in domain'
cd modules/domain/ && dart run build_runner build --delete-conflicting-outputs && cd ../../

echo 'Rebuilding in fire'
cd modules/fire/ && dart run build_runner build --delete-conflicting-outputs && cd ../../

echo "Building env config"
./flutter_build_env.sh $1

echo 'Rebuilding in presentation'
cd modules/presentation/ && dart run build_runner build --delete-conflicting-outputs

flutter gen-l10n --arb-dir=assets/l10n \
    --template-arb-file=translations_en.arb \
    --output-localization-file=translations.dart \
    --output-class=Translations \
    --output-dir=lib/l10n \
    --no-synthetic-package \
    && cd ../../
