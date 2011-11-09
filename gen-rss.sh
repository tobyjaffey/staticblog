#!/bin/bash

. META


PREFILTERED=pre.xml
FINAL=rss.xml

cat rss-template-pre.xml > $PREFILTERED

for I in `ls -r articles/*/META`
do
    POSTTITLE=
    . $I

    echo '<item>' >> $PREFILTERED
    echo '<title>' >> $PREFILTERED
    echo $POSTTITLE >> $PREFILTERED
    echo '</title>' >> $PREFILTERED
    echo '<link>' >> $PREFILTERED
    echo $URL/`dirname $I`/index.html >> $PREFILTERED
    echo '</link>' >> $PREFILTERED
    echo '</item>' >> $PREFILTERED
done

cat rss-template-post.xml >> $PREFILTERED

mv $PREFILTERED $FINAL


