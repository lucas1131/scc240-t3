# Java makefile
# Project name
NAME=main
MAIN_CLASS_NAME:=$(NAME)


# Directories
# LIBDIR=lib
BLDDIR=build
SRCDIR=src

# If the first argument is "run"
ifeq (run, $(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif


# Search for source files
SRC=$(shell find -name "*.java")


CC=javac
CFLAGS=

USER_LIBS=
DEFAULT_LIBS=
LIBS=$(USER_LIBS) $(DEFAULT_LIBS)

ifdef debug
	CFLAGS += -Xlint
endif

# GIT_STAT:=$(shell echo -e "GET http://github.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1; echo $$?)

all: checkname checkdirs clean main

.PHONY: main
main: 
	@echo Building $(SRC)
	@$(CC) -d $(BLDDIR) $(SRC) $(JAVAFLAGS)
	@cd $(BLDDIR)
	# @ln -s `pwd`/src/resources `pwd`/build/resources
	cp $(SRCDIR)/resources/*.fxml $(BLDDIR)/app/
	@# @echo Creating JAR archive...
	@# @jar cvf $(BLDDIR)/$(NAME).jar manifest.mf $(BLDDIR)/*

# Run directives
.PHONY: run
run:
	java -classpath $(BLDDIR) app.$(NAME)
	@# java -jar $(BLDDIR) $(NAME).jar

# Utility directives
.PHONY: clean
clean: checkname
	@echo Cleaning up project...
	@-rm -rf $(BLDDIR)/*
	@-rm -f vgcore*
	@-rm -f $(NAME).zip
	@-rm -f $(NAME).tar.gz

.PHONY: list
list: 
	clear
	ls -lhR

.PHONY: tar
tar: checkname clean 
	@echo Compressing files...
	@tar -zcvf $(NAME).tar.gz *
	@echo Done.

.PHONY: zip
zip: checkname clean 
	@echo Compressing files...
	@zip -r $(NAME).zip *
	@echo Done.

.PHONY: git-show
git-show:
	git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"

sense:
	$(error Doesnt make sense)

.PHONY: readme
readme: checkname
	@echo Generating README...
	@echo "# Makefile" >> README.md
	@echo "" >> README.md
	@echo "\`\`\`Makefile" >> README.md
	@echo "all: compile project" >> README.md
	@echo "run: run executable" >> README.md
	@echo "clean: clean object files and zip/tar" >> README.md
	@echo "list: list all project's directories and files" >> README.md
	@echo "zip/tar: compress project folder" >> README.md
	@echo "readme: generate this readme" >> README.md
	@echo "create: create project structure" >> README.md
	@echo "\`\`\`" >> README.md
	@echo "" >> README.md
	@echo "" >> README.md
	@echo "Set \`debug=1\` to compile/run in debug mode  " >> README.md
	@echo "Use \`CFLAGS+=flags\` to add compiler flags  " >> README.md
	@echo "Set \`CC=compiler\` to change compiler  " >> README.md
	@echo "Set \`NAME=name\` to set project name  " >> README.md
	@echo "Set \`USER_LIBS=libraries\` to set user-defined libraries  " >> README.md
	@echo "" >> README.md

# Check for directory existence and create them if necessary
checkdirs: 
	@if [ ! -d $(BLDDIR)/ ]; then mkdir -p $(BLDDIR)/; fi
	@# @if [ ! -d $(LIBDIR)/ ]; then mkdir -p $(LIBDIR)/; fi
	@if [ ! -d $(SRCDIR)/ ]; then mkdir -p $(SRCDIR)/; fi

# Check if project has a name
checkname: 
ifeq ($(strip $(NAME)),)
	$(error No project name provided (open this make and set NAME))
endif

# .PHONY: update
# update:
# 	@echo Updating Makefile...
# 	git clone git@github.com:lucas1131/MakefileGit.git
# 	cp MakefileGit/Makefile .
# 	-rm -rf MakefileGit/

create: checkname
	@echo Creating directories...
	@mkdir $(NAME) 
	@mkdir $(NAME)/$(SRCDIR)
	@# @mkdir $(NAME)/$(LIBDIR)
	@mkdir $(NAME)/$(BLDDIR)

	cp ./Makefile $(NAME)/
	@echo Generating README...
	cd $(NAME)
	$(MAKE) readme

package:
ifeq ($(strip $(pkg)),)
	$(error No package specified)
endif
	mkdir $(SRCDIR)/$(pkg)

remove_package:
ifeq ($(strip $(pkg)),)
	$(error No package specified)
endif
	rm -rf $(SRCDIR)/$(pkg)

