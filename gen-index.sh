#!/bin/bash

. META


PREFILTERED=pre.html
FINAL=index.html

cat index-template-pre.html > $PREFILTERED

echo '<ul>' >> $PREFILTERED

for I in `ls -r articles/*/META`
do
    POSTTITLE=
    POSTDATE=
    . $I

    if [ -z "$POSTDATE" ]
    then
        echo '<li><a href="'`dirname $I`/index.html'">'$POSTTITLE'</a>' >> $PREFILTERED
    else
        echo '<li><a href="'`dirname $I`/index.html'">'$POSTTITLE'</a> ['$POSTDATE']' >> $PREFILTERED
    fi
done

echo '</ul>' >> $PREFILTERED

cat index-template-post.html >> $PREFILTERED

cat $PREFILTERED | \
    sed -e "s/\$(TITLE)/$TITLE/"         | \
    sed -e "s/\$(TAGLINE)/$TAGLINE/"     | \
    sed -e "s/\$(HOMEPAGE)/$HOMEPAGE/"   | \
    sed -e "s/\$(PROJECTS)/$PROJECTS/"   | \
    sed -e "s/\$(RSS)/$RSS/"             | \
    sed -e "s/\$(ABOUT)/$ABOUT/"         | \
    sed -e "s/\$(FOOTER)/$FOOTER/"         \
    > $FINAL

rm -f $PREFILTERED


