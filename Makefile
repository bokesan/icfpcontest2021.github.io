build: \
	_site/index.html \
	_site/logo.svg \
	_site/rules.html \
	_site/prizes.html \
	_site/style.css

_site:
	mkdir _site

_site/logo.svg:
	cp logo.svg $@

_site/style.css: style.css | _site
	cp style.css $@

_site/%.html: %.html template.sh | _site
	./template.sh $< >$@

clean:
	rm -rf _site

.DELETE_ON_ERROR:

.PHONY: clean