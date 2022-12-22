SRCS = $(shell find -type f -name '*.tex')
PDF_OBJS = $(patsubst %.tex,%.pdf,$(SRCS))
PNG_OBJS = $(patsubst %.tex,%.png,$(SRCS))

all: $(PNG_OBJS)

$(PDF_OBJS): $(SRCS)
		pdflatex --interaction nonstopmode -file-line-error -shell-escape $<

$(PNG_OBJS): $(PDF_OBJS)
		pdftoppm $< $@ -png

clean:
		rm -rf $(PDF_OBJS)
		rm -rf $(PNG_OBJS)

