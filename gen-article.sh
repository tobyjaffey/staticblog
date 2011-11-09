#!/bin/bash 

SCRIPTDIR=`pwd`

if [ -z "$1" ]
then
    echo supply article dir
    exit 0
fi

cd $1

PREFILTERED=pre.html
FINAL=index.html

. $SCRIPTDIR/META

if [ ! -e META ]
then
    echo "No META $1"
    exit 1
fi

. META

rm -f $PREFILTERED

if [ ! -e raw.html ]
then
    echo "No raw.html $1"
    exit 1
fi

cat $SCRIPTDIR/post-template-pre.html > $PREFILTERED
cat raw.html >> $PREFILTERED
cat $SCRIPTDIR/post-template-post.html >> $PREFILTERED

cat $PREFILTERED | \
    sed -e "s/\$(POSTTITLE)/$POSTTITLE/" | \
    sed -e "s/\$(POSTDATE)/$POSTDATE/"   | \
    sed -e "s/\$(TITLE)/$TITLE/"         | \
    sed -e "s/\$(TAGLINE)/$TAGLINE/"     | \
    sed -e "s/\$(HOMEPAGE)/$HOMEPAGE/"   | \
    sed -e "s/\$(ABOUT)/$ABOUT/"         | \
    sed -e "s/\$(PROJECTS)/$PROJECTS/"   | \
    sed -e "s/\$(RSS)/$RSS/"             | \
    sed -e "s/\$(FOOTER)/$FOOTER/"         \
    > $FINAL

rm -f $PREFILTERED

