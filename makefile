all: public/index.html

public/index.html: index.mote index.json
	mote $< > $@

clean:
	rm public/*.html
