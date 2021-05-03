PYTHON.1 := python3
PYTHON.2 := py -3
PYTHON.3 := python

ifeq ($(OS),Windows_NT)
SHELL = cmd
COMMAND =
NULL = NUL
EXITCODE = 0
NEWLINE =  &&
else
SHELL = sh
COMMAND = command -v
NULL = /dev/null
EXITCODE = $$?
NEWLINE = ;
endif

ifeq (0, $(shell $(COMMAND) $(PYTHON.1) --version > $(NULL) 2>&1$(NEWLINE) echo $(EXITCODE)))
PYTHON ?= $(PYTHON.1)
else ifeq (0, $(shell $(COMMAND) $(PYTHON.2) --version > $(NULL) 2>&1$(NEWLINE) echo $(EXITCODE)))
PYTHON ?= $(PYTHON.2)
else ifeq (0, $(shell $(COMMAND) $(PYTHON.3) --version > $(NULL) 2>&1$(NEWLINE) echo $(EXITCODE)))
PYTHON ?= $(PYTHON.3)
endif
$(info Using $(shell $(PYTHON) --version) at $(shell where $(PYTHON) 2> $(NULL)))

init:
ifeq ($(OS),Windows_NT)
	@del .git\hooks\post-commit ||:
	@mklink .git\hooks\post-commit ..\..\githooks\post-commit ||:
else
	@ln -s -f ../../githooks/post-commit .git/hooks/post-commit
endif

host:
	$(PYTHON) -m mkdocs serve

build:
	$(PYTHON) -m mkdocs build

sometarget:
	$(info Hello)
