#!/bin/bash
# Making of this script almost ate my mind...
cd arch/arm/configs
read -p "NOTE: Hitting any key will bump kernel version automatically!" 
read -p "A rebuild will be needed for changes to take effect!"

# Extract current version from tapioca defconfig
CRNT=$(cat Enigma_TAP_defconfig | grep 'CONFIG_LOCALVERSION=')

pattern='[0-9]+\.[0-9]+'
[[ $CRNT =~ $pattern ]]

# Store current version in a variable
CURVER=${BASH_REMATCH[0]}

# Bump kernel version by 0.1 (lol :D)
NEWVER=$(echo $CURVER + 0.1 | bc) 

NEXT='CONFIG_LOCALVERSION="-Enigma-'$NEWVER'+"'

# Perform search and replace
grep -rli $CRNT * | xargs -i@ sed -i 's/'$CRNT/$NEXT'/g' @

# Debugging info
echo 'Old version was Enigma v'$CURVER
echo 'and now has been set to Enigma v'$NEWVER
echo ' '
echo 'Changed '$CRNT
echo 'to '$NEXT
echo ' '



