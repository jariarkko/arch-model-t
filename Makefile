
base:	draft-arkko-farrell-arch-model-t.txt

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

jaricompile:	draft-arkko-farrell-arch-model-t.txt Makefile
	scp draft-arkko-farrell-arch-model-t.txt \
		jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/iab

#		draft-arkko-farrell-arch-model-t.diff.html \
#	rfcdiff draft-arkko-farrell-arch-model-t-00.txt draft-arkko-farrell-arch-model-t.txt
#	cp draft-arkko-farrell-arch-model-t-from--00.diff.html draft-arkko-farrell-arch-model-t.diff.html
