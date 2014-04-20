all: public/index.html public/about.html

public/index.html: sources/index.mote
	[ -d public ] || mkdir public
	mote $< > $@
	cp -R sources/assets public

public/about.html: sources/about.mote
	mote $< > $@

clean:
	rm -R public/*.html
