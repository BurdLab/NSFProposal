#!/bin/bash

# This script sets up the directory structure for an NSF proposal.
#
# Usage: ~/bin/mknsfproposal.sh NSFPROPOSALNAME
#
# This will create the required directory structure and template files
# in the current directory

# Set up variables
proposal_name="$1"

# The path of your master bib file.
stdbibdir=""
# The leading name of your master bib file
stdbibname=""
bibfiles="$stdbibname,$proposal_name"
bibdir="Description"
# The path of the proposal template files
templatelocation=""


# Create the directory structure
mkdir ${proposal_name}
cd ${proposal_name}

cp -r ${templatelocation}/* .

# Create special files (bibliographies) in the required directories
#cd ${proposal_name}
cd Description
touch ${proposal_name}.bib
cd ../

# Amend the template the files 
cd Description
cp ${stdbibdir}$stdbibname.bib .
sed -i '' "s/templatebib/$bibfiles/g" Description.tex

cd ../BioSketch
relstdbibfile="../Description/$stdbibname"
relpropbibfile="../Description/$proposal_name"
relbibfiles="$relstdbibfile,$relpropbibfile"
sed -i '' "s^templatebib^$relbibfiles^g" Biosketch.tex

cd ../DataManagement
sed -i '' "s^templatebib^$relbibfiles^g" DataManagement.tex
