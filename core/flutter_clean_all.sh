fvm flutter clean

cd modules

cd remote/ && fvm flutter clean && cd ../
cd domain/ && fvm flutter clean && cd ../
cd foundation/ && fvm flutter clean && cd ../

cd presentation/ \
  && fvm flutter clean \
  && cd ../../
