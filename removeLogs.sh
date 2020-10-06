#!/usr/bin/env bash

LOGS_FOLDER="logs/"
ARCHIVE_FOLDER="../removable/"
PREFIX="T"

MIN="$2"
MAX="$3"

cd $LOGS_FOLDER


if [[ $1 == "move" ]]; then
  #statements
  for (( i = $MIN; i < $MAX; i++ ));
  do
    printf -v j "%08d" $i
    if [[ -f $PREFIX$j.LOG ]]; then
      ls $PREFIX$j.LOG
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
elif [[ $1 == "list" ]]; then
  if [[ $2 == "active" ]]; then
    #statements
    echo -e "\n$LOGS_FOLDER mappa tartalma:\n"
    ls -lh .
    echo -e "\n$ARCHIVE_FOLDER mappa teljes mérete:\n"
    du -xsh .
    echo -e "\n"
  elif [[ $2 == "removable" ]]; then
    #statements
    echo -e "\n$ARCHIVE_FOLDER mappa tartalma:\n"
    ls -lh $ARCHIVE_FOLDER
    echo -e "\n$ARCHIVE_FOLDER mappa teljes mérete:"
    du -xsh $ARCHIVE_FOLDER
    echo -e "\n"
  fi
elif [[ $1 == "empty" ]]; then
  read -p "Biztosan törölni szeretné a $ARCHIVE_FOLDER mappa tartalmát? (igen)" answer
  if [[ $answer == "igen" ]]; then
    rm -rf $ARCHIVE_FOLDER/*
    if [[ $? == "0" ]]; then
      #statements
      echo "$ARCHIVE_FOLDER mappa sikeresen kiürítve."
    fi
  else
    echo -e "A $ARCHIVE_FOLDER tartalma csak igen válasz esetén kerül kiürítésre.\nNem történt művelet!"
  fi
elif [[ $1 == "status" ]]; then
  #statements
  echo "status"
fi


exit
