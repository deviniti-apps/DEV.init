fvm flutter pub get

cd modules

cd remote/ && fvm flutter pub get
cd ../
cd domain/ && fvm flutter pub get
cd ../
cd foundation/ && fvm flutter pub get
cd ../
cd project_linter/ && fvm flutter pub get
cd ../

cd presentation/ \
  && fvm flutter pub get \
  && fvm flutter gen-l10n --arb-dir=assets/l10n \
    --template-arb-file=translations_en.arb \
    --output-localization-file=translations.dart \
    --output-class=Translations \
    --output-dir=lib/l10n \
    --no-synthetic-package \
cd ../../


