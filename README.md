# LaTeX Package for NSF proposals
This is a LaTeX package for typesetting NSF-style proposals. It is heavily based on
the package developed by Stefan Grapenthin and Sarah Gille, though the set-up is somewhat
different.

The idea behind this package is to produce the individual sections of an NSF proposal as
separate documents with the correct pagination and adhering to the NSF propodal guidelines.
The package is set up to suit the way that I work, but should be easily adapted to
other workflows. So far things are not that well commented or documented, and there are
still some tweaks that I want to make, but it is working on my OS-X systems (I cannot guarantee
that it will work on other systems). Note that this still a work in progress, so please treat
it as such if you wish to use it. 

## Installation
The package consists of the following components:

### Setting up the directory structure
The shell script `mknsfproposal.sh` that should be placed somewhere in your path
and made executable. This shell script creates the directory structure for the
proposal and copies all the appropriate files from the `doc` directory. The script
takes one argument, the name of the proposal. For example

```
mknsfproposal.sh Project1
```

will create the appropriate directory structure in a subdirectory (called `Project1`) of the
current working directory. These subdirectories and files are

 * BioSketch: This contains the BioSketch file. It uses the bibliography file that will be placed
   in the Description directory.
 * Budgets: This contains the Budget Justification document. It does *not* contain the budget itself
   and I leave that up to whatever system you use for it.
 * Build: This is where all the final `pdf` files will be placed at the end of the compile.
 * CurrentPending: This contains the Current and Pending document.
 * DataManagement: This contains the data management plan.
 * Description: This contains both the Description and the References. There is also a subdirectory
   for Figures.
 * Facilities: This contains the Facilities description document
 * Literature: This is an empty directory where you can put pdfs of papers relevant to this
   specific project; I will then build the project specific bibliography from these files.
 * makefile: This is the makefile for the complete project. It will create all the `pdf` files
   and copy them into the Build directory from where they can be uploaded into Fastlane. Note
   that *each subdirectory also has it's own makefile* that makes the files in that specific
   directory. The master makefile uses these to create the proposal. To make the project
   type `make` from the top level directory of the project. To clean everything, type
   `make clean`.
 * PosddocPlan: This contains the document for the Postdoctoral Mentoring Plan
 * Summary: This contains the one page summary document. 

This script also does a couple of other things:

 * It sets up the appropriate bibliography files. My setup for this is that I have a large master
   bibliography file that contains my own publications and other papers that I reference
   frequently. I then also like to have a project specific bibliography file. Some of the references
   from this latter `bib` file will make it to my master `bib` file, but not all of them will.
   So the script copies across my master bibliography file and places it in the Decscription
   folder. It also changes the bibliography entries in the appropriate Description, Biosketch, and
   DataManagement source files so that they all references the `bib` files in the Description
   directory.
 * The script also creates an enpty project specific `bib` file in the Description directory.

## The LaTeX Class File
The LaTeX class file `nsfproposal.cls` should be placed in a location where your TeX
installation can find it. I place it in my local, use specific `texmf` folder which, on a Mac
is found in `~/Library/texmf`.

## The doc directory
This contains the template that gets copied across to form your project. I place this in the
doc directory of my local, user specific `texmf` folder. 