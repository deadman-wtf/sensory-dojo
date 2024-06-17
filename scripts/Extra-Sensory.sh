#!/usr/bin/env bash

OUTDIR="dataset"

FILES="http://extrasensory.ucsd.edu/data/primary_data_files/ExtraSensory.per_uuid_features_labels.zip\
  http://extrasensory.ucsd.edu/data/primary_data_files/README.txt\
  http://extrasensory.ucsd.edu/data/cv5Folds.zip\
  http://extrasensory.ucsd.edu/data/additional_data_files/ExtraSensory.per_uuid_original_labels.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.raw_acc.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.proc_gyro.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.raw_magnet.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.watch_acc.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.watch_compass.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.audio.zip\
  http://extrasensory.ucsd.edu/data/raw_measurements/ExtraSensory.raw_measurements.proc_gravity.zip"

mkdir -p $OUTDIR && pushd $OUTDIR
for url in ${FILES}; do
  echo "fetching $url"
  curl $url -O -s &
done
wait
for f in $(ls *.zip); do
  unzip $f
done
popd
