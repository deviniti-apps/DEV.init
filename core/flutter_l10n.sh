fvm flutter pub get

cd modules

cd presentation/ \
  && fvm flutter pub get \
  && fvm flutter gen-l10n --arb-dir=assets/l10n \
    --template-arb-file=translations_en.arb \
    --output-localization-file=translations.dart \
    --output-class=Translations \
    --output-dir=lib/l10n \
    --no-synthetic-package \
  && cd ../../
