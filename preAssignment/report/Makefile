LATEX_COMPILER		= pdflatex
LATEX_BIB_LINKER	= bibtex

SRC_DIR			= ./

OBJ_FILE_EXTENSION	= .aux .log .out .toc .bbl .blg .lof
OBJ_FILE_DIR		= ./
OUTPUT_FILE		= main.pdf

all			: compileAndPrint

PROJECT_DIR		= ./BasicLinearAlgebraCompilerForStructuredMatrices ./Roofline_AnInsightfulVisualPerformanceModelForMulticoreArchitectures



#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Print results ----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
compileAndPrintAll	: compileAll printAll


printAll		:
			for project in $(PROJECT_DIR); do\
				$(call SR_PRINT, $$project);\
			done


compileAndPrintSpecific	:
			project=`./.userChoiceToCompile.sh`;\
			$(call SR_PRINT, $$project);\
			$(call SR_COMPILE, $$project);\


printSpecific		:
			project=`./.userChoiceToCompile.sh`;\
			$(call SR_PRINT, $$project);\


#-----------------------------------------------------------------------------------------------------------
# --------------------------------------- Compile ----------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
compileAll		:
			for project in $(PROJECT_DIR); do\
				$(call SR_COMPILE, $$project);\
			done


compileSpecific		:
			project=`./.userChoiceToCompile.sh`;\
			$(call SR_COMPILE, $$project);\


#-----------------------------------------------------------------------------------------------------------
#---------------------------------------- General Methodes -------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
.PHONY			: clean mrproper


clean			:
			for project in $(PROJECT_DIR); do\
				for directory in $(OBJ_FILE_DIR); do\
					for extension in $(OBJ_FILE_EXTENSION); do\
						rm -f $$project/$$directory*$$extension;\
					done\
				done\
			done


mrproper		: clean
			for project in $(PROJECT_DIR); do\
				rm $$project/$(OUTPUT_FILE);\
			done


#-----------------------------------------------------------------------------------------------------------
#---------------------------------------- Sub routines -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------
define SR_PRINT
	gnome-open $(1)/$(OUTPUT_FILE)
endef


define SR_COMPILE
	cd $(1);\
	$(LATEX_COMPILER) $(SRC_DIR)*.tex;\
	$(LATEX_BIB_LINKER) *.aux;\
	$(LATEX_COMPILER) $(SRC_DIR)*.tex;\
	$(LATEX_COMPILER) $(SRC_DIR)*.tex;\
	cd ../
endef

