#!/usr/bin/env bash

if [[ `dirname $0` != /* ]]; then
  # script run with relative path (./scripts/install.sh)
    if [[ $0 = './bundles.sh' ]]; then
        cabbagedir=`dirname \`pwd\``
    else
        cabbagedir=`dirname \`pwd\`/\`dirname $0\` | sed -e 's/\/\.$//'`  # ../
    fi

else
  # script run with absolute path (/home/me/cabbage/scripts/install.sh)
    cabbagedir=`dirname \`dirname $0\``
fi

bundles=`ls $cabbagedir/bundles | tr " " "\n"`

echo "## Cabbage available bundles" > $cabbagedir/BUNDLES.md
echo "" >> $cabbagedir/BUNDLES.md

for bundle in $bundles
do
    echo -e "      \033[1;32mwrite\033[0m  $bundle"
    echo "* $bundle" >> $cabbagedir/BUNDLES.md
done

echo -e "Bundles are written down to $cabbagedir/BUNDLES.md"
