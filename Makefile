VERSION=1.3.0
DATE=$(shell DATE)
<<<<<<< HEAD
BOOTSTRAP = ./bootstrap-1.1.0.css
BOOTSTRAP_MIN = ./bootstrap-1.1.0.min.css
BOOTSTRAP_SCSS = ./lib/bootstrap.scss
COMPASS_COMPESSOR ?= `which compass`
WATCHR ?= `which watchr`

build:
	@@if test ! -z ${COMPASS_COMPESSOR}; then \
		sed 's/@DATE/'"${DATE}"'/' ${BOOTSTRAP_SCSS} >${BOOTSTRAP_SCSS}.tmp; \
		compass compile ${BOOTSTRAP_SCSS}.tmp ${BOOTSTRAP}; \
		compass compile -s compressed ${BOOTSTRAP_SCSS}.tmp ${BOOTSTRAP_MIN}; \
    rm -f ${BOOTSTRAP_SCSS}.tmp; \
=======
BOOTSTRAP = ./bootstrap.css
BOOTSTRAP_MIN = ./bootstrap.min.css
BOOTSTRAP_LESS = ./lib/bootstrap.less
LESS_COMPESSOR ?= `which lessc`
WATCHR ?= `which watchr`

build:
	@@if test ! -z ${LESS_COMPESSOR}; then \
		sed -e 's/@VERSION/'"v${VERSION}"'/' -e 's/@DATE/'"${DATE}"'/' <${BOOTSTRAP_LESS} >${BOOTSTRAP_LESS}.tmp; \
		lessc ${BOOTSTRAP_LESS}.tmp > ${BOOTSTRAP}; \
		lessc ${BOOTSTRAP_LESS}.tmp > ${BOOTSTRAP_MIN} --compress; \
		rm -f ${BOOTSTRAP_LESS}.tmp; \
>>>>>>> upstream/master
		echo "Bootstrap successfully built! - `date`"; \
	else \
		echo "You must have the compass gem installed in order to build Bootstrap."; \
		echo "You can install it by running: gem install compass"; \
	fi

watch:
	@@if test ! -z ${WATCHR}; then \
	  echo "Watching scss files..."; \
	  watchr -e "watch('lib/.*\.scss') { system 'make' }"; \
	else \
		echo "You must have the watchr installed in order to watch Bootstrap scss files."; \
		echo "You can install it by running: gem install watchr"; \
	fi

.PHONY: build watch