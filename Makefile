SRCS = $(shell find -type f -name '*.tex')
SRC_DIRS = $(dir $(SRCS))
PDF_OBJS = $(patsubst %.tex,%.pdf,$(SRCS))
PNG_OBJS = $(patsubst %.tex,%.png,$(SRCS))

all: $(PNG_OBJS)

$(PDF_OBJS): $(SRCS) $(SRC_DIRS)	
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-output-directory $(SRC_DIRS)	\
			-shell-escape $<

$(PNG_OBJS): $(PDF_OBJS)
		inkscape --without-gui -d 400 -e $@ $<

clean:
		rm -rf $(PDF_OBJS)
		rm -rf $(PNG_OBJS)

