TEX_SRCS = $(shell find -type f -name '*.tex')
TEX_OBJS = $(patsubst %.tex,%.png,$(TEX_SRCS))

WAVE_SRCS = $(shell find -type f -name '*.json5')
WAVE_OBJS = $(patsubst %.json5,%.png,$(WAVE_SRCS))

TMPL_SRCS = $(shell find -type f -name '*.tmpl')
TMPL_OBJS = $(patsubst %.tmpl,%.sv,$(TMPL_SRCS))


all: $(TEX_OBJS) $(WAVE_OBJS) $(TMPL_OBJS)

# pdflatex to make svg/pdfs
%.pdf: %.tex 
		cd $(dir $<) && \
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-shell-escape $(notdir $<)

# wavedrom to make svg
%.svg : %.json5
		wavedrom-cli -s $@ -i $<

# Convert all pdfs to pngs
%.png: %.pdf
		inkscape --without-gui -d 100 -e $@ $< 

# Convert all svgs to pngs
%.png: %.svg
		inkscape --without-gui -d 100 -e $@ $< 

# Convert all tmpl to sv
%.sv: %.tmpl
		python tools/yaptu.py $< > $@

