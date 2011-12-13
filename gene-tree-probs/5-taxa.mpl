# Code derived from paperCladeInv.mpl by Elizabeth Allman
# Made into current form By Lyman Gillispie 11.11.11, revised on 12.12.2011
# This file does not work on my machine when loaded as
# a file into maple, but Maple has no problems when 
# it get copied into a worksheet. 
#
# Returns  maple files for the 5taxa trees which may be used in the PhyloStar
# scripts.
# Each contins a vector with the gene tree probabilities at each index.
#
# Dependeds on: alg-gij.mpl, fiProb-5b.mpl, iProb-5ps.mpl, fiProbs-5u.mpl
#
#
restart;
verbose:=1;   

interface(quiet=true,warnlevel=0);
with(LinearAlgebra):

# This will need to be changed depending on the user's machine
currentdir("~/Phylo_Star/five-taxa-probs/"):
currentdir();
## commands to load the algebraic definitions of the pij's
read "alg-gij.mpl":
# define a list of 1s to verify the gene-tree distrubutions sum to one
ones := Vector([seq(1,i=1..105)]):



###
# Working on 5-taxon (3,2) balanced tree   (((ab):x,c):y,(de):z);
###
# load file with gt probs computed using fi's
read "fiProb-5b.mpl":

## checking that sum is one
# define a vector for the gene tree distribution
GTprobs5taxbal := Vector([seq(cat(p,i),i=1..105)]):
GTprobs5taxbal := map(simplify,GTprobs5taxbal):

dv:=simplify(DotProduct(GTprobs5taxbal,ones)):
if dv<>1 then
  print("Gene-Tree probabilities for the 5-taxon Balaced tree do not sum to 1");
end if;

speciestree:= '5taxbal':
save speciestree, GTprobs5taxbal, "gtprobs-5tax-bal.mpl":


##
# Working on 5-taxon pseudo-cat tree ((((a,b):x,(c,d):y)):z,e)
# ****** updated to be working on the 
# ****** 5-taxon pseudo-cat tree ((((a,b):x,(d,e):y)):z,c)
# which one is it???? -Lyman FIGURE IT OUT!!
##

# load file with gt probs computed using fi's
read "fiProb-5ps.mpl":
# define a vector for the gene tree distribution
GTprobs5taxpscat := Vector([seq(cat(p,i),i=1..105)]):
GTprobs5taxpscat := map(simplify,GTprobs5taxpscat):

# checking that sum is one
dv:=simplify(DotProduct(GTprobs5taxpscat,ones)):
if dv<>1 then
 print("Gene-Tree probabilities for the 5-taxon psuedo-caterpilar tree do not sum to 1");
end if;

speciestree:= '5taxpscat':
save speciestree, GTprobs5taxpscat, "gtprobs-5tax-pscat.mpl":


##
# 5-taxon caterpillar tree   ((((ab):x),c:y),d:z),e)
##
# load file with 5-taxa cat gt probs computed using fi's
read "fiProbs-5u.mpl":

# define a vector for the gene tree distribution
GTprobs5taxcat := Vector([seq(cat(p,i),i=1..105)]):
GTprobs5taxcat := map(simplify,GTprobs5taxcat):
## checking that sum is one
dv:=simplify(DotProduct(GTprobs5taxcat,ones)):
if dv<>1 then
 print("Gene-Tree probabilities for the 5-taxon caterpillar tree do not sum to 1");
 end if;
 
speciestree:= '5taxcat':
save speciestree, GTprobs5taxcat, "gtprobs-5tax-cat.mpl":

#numtaxa := 5;
#save numtaxa,GTbal,GTpscat,GTcat,"gtprobs-5tax.m":
