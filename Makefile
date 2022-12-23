SRCS = $(shell find -type f -name '*.tex')
SVG_OBJS = $(patsubst %.tex,%.svg,$(SRCS))

all: $(SVG_OBJS)

$(SVG_OBJS): $(SRCS) 
		cd $(dir $<) && \
		pdflatex \
			--interaction nonstopmode \
			-file-line-error \
			-shell-escape $(notdir $<)

clean:
		rm -rf $(SVG_OBJS)

