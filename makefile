#-- CONSTANTS
SRC := src
DEST := dist
TMP := tmp
LOCALES := locales

#-- SOURCES
HTML_SOURCE = $(wildcard $(SRC)/*.html)
HTML_INCLUDE_SOURCE = $(filter-out $(HTML_SOURCE), $(shell find $(SRC)/ -type f -name '*.html'))
SCSS_VAR_SOURCE = $(shell find src/static/css -type f -name '_*.scss')
SCSS_SOURCE = $(filter-out $(SCSS_VAR_SOURCE), $(shell find src/static/css -type f -name '*.scss'))
JS_SOURCE = $(wildcard $(SRC)/static/js/*.js)
ASSETS_SOURCE = $(shell find $(SRC)/static/fonts -type f) \
								$(shell find $(SRC)/static/pdf -type f) \
								$(shell find $(SRC)/static/img -type f) \
								$(shell find $(SRC)/static/svg -type f) \
								$(shell find $(SRC)/static/video -type f)

#-- TEMP FILES
HTML_TEMP = 	$(subst $(SRC)/, $(TMP)/, $(HTML_SOURCE))

#-- TARGET
HTML_TARGET = $(subst $(SRC)/, $(DEST)/, $(HTML_SOURCE))
CSS_TARGET =  $(subst $(SRC)/, $(DEST)/, $(SCSS_SOURCE:.scss=.css))
JS_TARGET =   $(subst $(SRC)/, $(DEST)/, $(JS_SOURCE))
ASSETS_TARGET = $(subst $(SRC)/, $(DEST)/, $(ASSETS_SOURCE))

$(DEST)/%.css: $(SRC)/%.scss $(SCSS_VAR_SOURCE)
	@echo "Compiling file $@"
	@mkdir -p "$(@D)"
ifneq ($(MODE),PROD)
	@node node_modules/node-sass/bin/node-sass --output-style compressed --source-map-embed true --source-map-contents true $< > $@
else
	@node node_modules/node-sass/bin/node-sass --output-style compressed $< > $@
endif

$(DEST)/%.js: $(SRC)/%.js $(JS_SOURCE)
	@echo "Browserifying file $@"
	@mkdir -p "$(@D)"
	@node node_modules/browserify/bin/cmd.js $< > $@

%::
	@echo "Copying file $(subst $(DEST)/, $(SRC)/, $@)"
	@mkdir -p "$(@D)"
	@-cp $(subst $(DEST)/, $(SRC)/, $@) $@

css:  $(CSS_TARGET)
js:   $(JS_TARGET)
assets: $(ASSETS_TARGET)
html: index.html
all: html css js assets
.PHONY: all html css js assets
