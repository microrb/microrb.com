all: public/index.html

public/index.html: sources/index.mote
	mote $< > $@
	cp -R sources/assets public

clean:
	rm -R public/*.html
