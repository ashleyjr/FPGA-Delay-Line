SRCS = $(shell find -type f -name '*.tex')
PDF_OBJS = $(patsubst %.tex,%.pdf,$(SRCS))
PNG_OBJS = $(patsubst %.tex,%.png,$(SRCS))
SVG_OBJS = $(patsubst %.tex,%.svg,$(SRCS))


WAVE_SRCS = $(shell find -type f -name '*.json5')
WAVE_OBJS = $(patsubst %.json5,%.svg,$(WAVE_SRCS))

all: $(SVG_OBJS) $(PNG_OBJS) $(WAVE_OBJS)

$(PDF_OBJS) $(SVG_OBJS): $(SRCS) 
		cd $(dir $<) && \
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-shell-escape $(notdir $<)

$(PNG_OBJS): $(PDF_OBJS)
		inkscape --without-gui -d 100 -e $@ $<

$(WAVE_OBJS) : $(WAVE_SRCS)
		wavedrom-cli -i $< -s $@

clean:
		rm -rf $(SVG_OBJS)

