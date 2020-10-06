#!/usr/bin/env bash

LOGS_FOLDER="logs/"
ARCHIVE_FOLDER="../removable/"
PREFIX="T"

MIN="$1"
MAX="$2"

cd $LOGS_FOLDER

for (( i = $MIN; i < $MAX; i++ ));
do
  printf -v j "%08d" $i
  if [[ -f $PREFIX$j.LOG ]]; then
    ls -l $PREFIX$j.LOG
  fi
done

read -p "Törölhetőek a felsorolt fájlok? (igen)" answer
if [[ $answer == "igen" ]]; then

  for (( i = $MIN; i < $MAX; i++ ));
  do
    printf -v j "%08d" $i
    if [[ -f $PREFIX$j.LOG ]]; then
      mv $PREFIX$j.LOG $ARCHIVE_FOLDER
      if [[ $? == "0" ]]; then
        echo "$PREFIX$j.LOG át lett helyezve a $ARCHIVE_FOLDER mappába."
      fi
    fi
  done
else
  echo -e "A fájlok mozgatása csak igen válasz esetén kerül végrehajtásra!\nNem történt művelet."
fi

exit
