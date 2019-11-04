
base:	draft-arkko-arch-dedr-report.txt

LIBDIR := lib
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b master https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

cleantrash:
	rm -f *~

jaricompile:	draft-arkko-arch-dedr-report.txt Makefile
	scp draft-arkko-arch-dedr-report.txt \
		jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/iab

#		draft-arkko-arch-dedr-report.diff.html \
#	rfcdiff draft-arkko-arch-dedr-report-00.txt draft-arkko-arch-dedr-report.txt
#	cp draft-arkko-arch-dedr-report-from--00.diff.html draft-arkko-arch-dedr-report.diff.html
