Ultra-minimal blogging engine, written in bash shell.

Each blog has a single index page and a series of articles.
Each article is a single page.

Every article is created by prepending/appending the *template*.html files to articles/*/raw.html.

Each blog has a META file, each article has a META file.

generate root index.html, rss.xml and article index.html files.

    $ make

publish 

    $ rsync index.html rss.xml articles myserver.com:/srv/


