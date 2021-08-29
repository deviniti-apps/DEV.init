flutter pub get

cd modules

cd remote/ && flutter pub get && cd ../
cd domain/ && flutter pub get && cd ../
cd foundation/ && flutter pub get && cd ../

cd presentation/ \
  && flutter pub get \
  && flutter gen-l10n --arb-dir=assets/l10n \
    --template-arb-file=translations_en.arb \
    --output-localization-file=translations.dart \
    --output-class=Translations \
    --output-dir=lib/l10n \
    --no-synthetic-package \
  && cd ../../
