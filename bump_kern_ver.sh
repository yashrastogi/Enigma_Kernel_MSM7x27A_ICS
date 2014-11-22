cd arch/arm/configs
VERC=8.4
VERF=8.5
CRNT=CONFIG_LOCALVERSION="-Enigma-$VERC+"
NEXT=CONFIG_LOCALVERSION="-Enigma-$VERF+"
grep -rli '$NEXT' * | xargs -i@ sed -i 's/$NEXT/$NEXT/g' @

echo $CRNT
echo $NEXT
