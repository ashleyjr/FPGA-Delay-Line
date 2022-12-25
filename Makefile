SRCS = $(shell find -type f -name '*.tex')
PNG_OBJS = $(patsubst %.tex,%.png,$(SRCS))
SVG_OBJS = $(patsubst %.tex,%.svg,$(SRCS))
WAVE_SRCS = $(shell find -type f -name '*.json5')
WAVE_OBJS = $(patsubst %.json5,%.svg,$(WAVE_SRCS))
WAVE_PNG_OBJS = $(patsubst %.json5,%.png,$(WAVE_SRCS))

all: $(SVG_OBJS) $(PNG_OBJS) $(WAVE_OBJS) $(WAVE_PNG_OBJS)

%.svg: %.tex 
		cd $(dir $<) && \
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-shell-escape $(notdir $<)

%.png: %.svg
		inkscape --without-gui -d 100 -e $@ $< 

%.svg : %.json5
		wavedrom-cli -s $@ -i $<

clean:
		rm -rf $(SVG_OBJS)

