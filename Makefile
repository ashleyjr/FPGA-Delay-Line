SRCS = $(shell find -type f -name '*.tex')
PDF_OBJS = $(patsubst %.tex,%.pdf,$(SRCS))
PNG_OBJS = $(patsubst %.tex,%.png,$(SRCS))
SVG_OBJS = $(patsubst %.tex,%.svg,$(SRCS))

all: $(SVG_OBJS) $(PNG_OBJS)

$(PDF_OBJS) $(SVG_OBJS): $(SRCS) 
		cd $(dir $<) && \
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-shell-escape $(notdir $<)

$(PNG_OBJS): $(PDF_OBJS)
		inkscape --without-gui -d 100 -e $@ $<

clean:
		rm -rf $(SVG_OBJS)

