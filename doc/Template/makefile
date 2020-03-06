# This is the proposal makefile


BUILDDIR = Build
SUBDIRS = BioSketch Budgets CurrentPending DataManagement Description Facilities PostdocPlan Summary
CP = cp

PHONY: subdirs

subdirs:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
		echo $$dir; \
		$(CP) $$dir/*.pdf $(BUILDDIR); \
	done

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
