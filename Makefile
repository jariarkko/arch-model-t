
MD_PREPROCESSOR=markdown-pp /dev/stdin

MD_FILES= draft-arkko-farrell-arch-model-t.md \
		  refs.md \
		  abstract.md \
		  intro.md \
		  observations.md \
		  analysis.md \
		  study.md \
		  changes7258.md \
		  guidelines.md \
		  conclusions.md \
		  acks.md \
		  changes.md

MD_FILESREDUX=	draft-arkko-farrell-arch-model-t-redux.md \
		refsredux.md \
		abstractredux.md \
		introredux.md \
		attackchanges.md \
		principles.md \
		seccons.md \
		iana.md \
		acksredux.md

MD_FILESREDUXREDUX=	draft-arkko-arch-internet-threat-model-guidance.md \
		refsredux.md \
		abstractredux.md \
		introreduxredux.md \
		attackchangesreduxredux.md \
		principlesreduxredux.md \
		seccons.md \
		iana.md \
		acksredux.md

MD_FILES3552=	draft-arkko-farrell-arch-model-t-3552-additions.md \
		changes3552.md \
		changes3552abstract.md \
		changes3552intro.md \
		changes3552seccons.md \
		changes3552refs.md \
		changes3552acks.md

MD_FILES7258=	draft-arkko-farrell-arch-model-t-7258-additions.md \
		changes7258.md \
		changes7258abstract.md \
		changes7258intro.md \
		changes7258seccons.md \
		changes7258refs.md \
		changes7258acks.md

base:	draft-arkko-farrell-arch-model-t.txt \
	draft-arkko-farrell-arch-model-t-redux.txt \
	draft-arkko-farrell-arch-model-t-3552-additions.txt \
	draft-arkko-farrell-arch-model-t-7258-additions.txt \
	draft-arkko-arch-internet-threat-model-guidance.txt \
	draft-arkko-iab-data-minimization-principle.txt

draft-arkko-farrell-arch-model-t.txt: $(MD_FILES)

draft-arkko-farrell-arch-model-t-redux.txt: $(MD_FILESREDUX)

draft-arkko-arch-internet-threat-model-guidance.txt: $(MD_FILESREDUXREDUX)

draft-arkko-farrell-arch-model-t-3552-additions.txt: $(MD_FILES3552)

draft-arkko-farrell-arch-model-t-7258-additions.txt: $(MD_FILES7258)

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
	rm -f draft-arkko-farrell-arch-model-t.txt
	rm -f draft-arkko-farrell-arch-model-t-3552-additions.txt
	rm -f draft-arkko-farrell-arch-model-t-7258-additions.txt
	rm -f *~

OLD=draft-arkko-farrell-arch-model-t-03.txt
OLDREDUX=draft-arkko-farrell-arch-model-t-redux-01.txt
OLDMINIREV=01
OLDMINI=draft-arkko-iab-data-minimization-principle-$(OLDMINIREV).txt
MACHINE=jar@cloud2.arkko.eu
PORT=-p 8820
SCPPORT=-P 8820

jaricompilemin:
	-@ssh $(PORT) $(MACHINE) 'cd /tmp; rm *.txt *.md *.xml'
	scp $(SCPPORT) draft-arkko-iab-data-minimization-principle.md \
		$(OLDMINI) \
		$(MACHINE):/tmp
	ssh $(PORT) $(MACHINE) 'cd /tmp; cat draft-arkko-iab-data-minimization-principle.md  | kramdown-rfc2629 | lib/add-note.py > draft-arkko-iab-data-minimization-principle-pre.xml'
	ssh $(PORT) $(MACHINE) 'cd /tmp; xml2rfc -q --cache=/home/jar/.cache/xml2rfc $(VERSOPT) draft-arkko-iab-data-minimization-principle-pre.xml; cp draft-arkko-iab-data-minimization-principle-pre.txt draft-arkko-iab-data-minimization-principle.txt'
	scp $(SCPPORT) $(MACHINE):/tmp/draft-arkko-iab-data-minimization-principle.txt .
	ssh $(PORT) $(MACHINE) 'cd /tmp; rfcdiff $(OLDMINI) draft-arkko-iab-data-minimization-principle.txt'
	scp $(SCPPORT) $(MACHINE):/tmp/draft-arkko-iab-data-minimization-principle-pre.xml \
		./draft-arkko-iab-data-minimization-principle.xml
	scp $(SCPPORT) $(MACHINE):/tmp/draft-arkko-iab-data-minimization-principle.txt \
		$(MACHINE):/tmp/draft-arkko-iab-data-minimization-principle-from--$(OLDMINIREV).diff.html \
		.
	scp draft-*-data-minimization-*.txt draft-*-data-minimization-*.html root@cloud3.arkko.eu:/var/www/www.arkko.com/html/ietf/iab

jaricompile:	draft-arkko-iab-data-minimization-principle.txt \
		draft-arkko-farrell-arch-model-t.txt \
		draft-arkko-farrell-arch-model-t-redux.txt \
		draft-arkko-arch-internet-threat-model-guidance.txt \
		draft-arkko-farrell-arch-model-t-3552-additions.txt \
		draft-arkko-farrell-arch-model-t-7258-additions.txt \
		Makefile
	rfcdiff $(OLD) draft-arkko-farrell-arch-model-t.txt
	rfcdiff $(OLDREDUX) draft-arkko-arch-internet-threat-model-guidance.txt
	scp 	draft-arkko-farrell-arch-model-t.txt \
		draft-arkko-farrell-arch-model-t-from--03.diff.html \
		draft-arkko-farrell-arch-model-t-redux.txt \
		draft-arkko-arch-internet-threat-model-guidance.txt \
		draft-arkko-arch-internet-threat-model-guidance-from-farrell-arch-model-t-redux-01.diff.html \
		draft-arkko-farrell-arch-model-t-3552-additions.txt \
		draft-arkko-farrell-arch-model-t-7258-additions.txt \
		root@cloud3.arkko.eu:/var/www/www.arkko.com/html/ietf/iab
	scp 	draft-arkko-iab-data-minimization-principle.txt \
		draft-arkko-farrell-arch-model-t.txt \
		draft-arkko-farrell-arch-model-t-from--03.diff.html \
		draft-arkko-farrell-arch-model-t-redux.txt \
		draft-arkko-arch-internet-threat-model-guidance.txt \
		draft-arkko-arch-internet-threat-model-guidance-from-farrell-arch-model-t-redux-01.diff.html \
		draft-arkko-farrell-arch-model-t-3552-additions.txt \
		draft-arkko-farrell-arch-model-t-7258-additions.txt \
		root@cloud3.arkko.eu:/var/www/www.arkko.com/html/ietf/model-t
