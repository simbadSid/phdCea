



#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- General parameters -----------------------------------------------
#-----------------------------------------------------------------------------------------------------------
LATEX_COMPILER		= pdflatex
LATEX_BIB_LINKER	= bibtex

OBJ_FILE_EXTENSION	= .aux .log .out .toc .bbl .blg .vrb .snm .nav .lof
SRC_DIR			= ./
TOOL_USER_CHOICE	= ./.userChoiceToCompile.sh

all			: compileAndPrintAll


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Main targets -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
compileAndPrintAll	: 
			$(call processAll, TRUE, TRUE)


printAll		: 
			$(call processAll, FALSE, TRUE)


compileAll		:
			$(callprocessAll, TRUE, FALSE)


compileAndPrintSpecific	: 
			$(call processSpecific, TRUE, TRUE)


printSpecific		:
			$(call processSpecific, FALSE, TRUE)


compileSpecific		: 
			$(call processSpecific, TRUE, FALSE)


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Sub Routines -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
define compile
	$(LATEX_COMPILER) $(SRC_DIR)*.tex $(CHAPTER_DIR)*.tex	;\
	$(LATEX_BIB_LINKER) *.aux				;\
	$(LATEX_COMPILER) $(SRC_DIR)*.tex $(CHAPTER_DIR)*.tex	;\
	$(LATEX_COMPILER) $(SRC_DIR)*.tex $(CHAPTER_DIR)*.tex
endef


define print
	gnome-open *.pdf
endef


define process
	ifeq ($(1), TRUE)
		$(call compile)
	endif

	ifeq ($(2), TRUE)
		$(call print)
	endif
endef


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Routines ---------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
define processSpecific
	DIR_TO_PROCESS=`$(TOOL_USER_CHOICE)`				;\
	clear								;\
	cd $(DIR_TO_PROCESS)						;\
	$(call process)
	ls
endef


define processAll
	for file in `ls -d ./*/`; do					\
		cd $(file)						;\
		$(call process)						;\
		cd ../							;\
	done
endef

