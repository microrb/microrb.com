all: public/index.html

public/index.html: index.mote data.json
	mote $< > $@

clean:
	rm public/*.html
