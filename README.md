Phy Star is a collection of Matlab procedures for applying the STAR node
numbering algorithm.


#Script Documentation

#symstar.m
`SYMSTAR(ntaxa,treename)`

Generates Maple file for species tree <ntaxa>-taxa <treename tree>, with abitrary edge
lengths `a_i` via the STAR node-numbering algorithm
  
`symstar` depends on having two files, one containg an ordered list of
trees and one containg an ordered list of the probablities of each tree

  ../gene-trees/          <- tree files
  ../gene-tree-probs/    <- tree probibilities

Gene-trees and gene tree probabilities must be in the same order
Ghere must be a vector `GTprobs<ntaxa>tax<treename>` in the probability file with the gene-tree
probabilities 
  
The gene trees must be in Newick format, with or without edge lengths,
they are discarded.

Current performance bottlenecks are the repeated calls to `phytree()`
which is pretty slow, and is on the inside loop often, also the
function `starhash.m` which translates numbers to polynomial strings for later
symbolic work in maple.

Dependencies: `mstarf.m`, `starhash.m`, `strcelltomaple.m` 


#strcelltomaple.m
`[R]=strcelltomaple(M)`
Reads a Matlab stringcell `M` and returns the string `R`, which is `M`
formated for entry into Maple as a matrix
See also: `matrixtomaple.m`

#matrixtomaple.m
`[R]=marixtomaple(M)`
Reads a Matlab matrix `M` and returns the string `R`, which is `M`
formated for entry into Maple
See also: `strcelltomaple.m`


#starhash.m
`[symlen] = starhash(len)`

Accepts an integer `len` and returns a string `symlen` which is of the
form
>`symlen = <len(1)>*a[1] + <len(2)>*a[2] + ... + <len(ii)>*a[ii]`

where `<len(ii)>` is the `ii`'th digit of `len`.
This string is formated to be used in Maple, where an array `a`
represents the branch lengths used for STAR, `a` may be left undefined,
and manipulated symbolically 

#readforest.m
`[treecollect] = READFOREST(filename)`

 Accepts the path of a text file of Newick-formated trees and returns a cell array, where
 element `treecollect{ii}` corresponds to line `ii` of `filename`


#mstarf.m
`[dmatricies,treeforest] = MSTARF(treefile,StarLength)`

Accepts the path of a text file of Newick-formated trees and returns a cell-array of 
the distance matricies for STAR.
Does the same thing as FSTARF except doesn't create a file

##Arguments:
* `treefile`: path to a text-file of Newick-format rooted binary trees,
seperated by new lines (see `READFOREST`)
* `StarLength`: lengths for internal edges of the gene-trees

##Return Values:
* `dmatricies`: cell-array of the distance matricies(gene-trees), made ultra-metric,
these may then be averaged for STAR 
* `treeforest`: cell-array of the gene-trees from `treefile`

`dmatrix{ii}` corresponds to the tree `treeforest{ii}`

Depends on: `READFOREST`, `MAKEULTRA`

# fstarf.m
`[dmatricies,treeforest] = FSTARF(treefile,outfile,StarLength)`

Accepts the path of a text file of Newick-formated trees and returns a cell-array of 
the distance matricies for STAR.
Does the same thing as MSTARF except creates a file

##Arguments:
* `treefile`: path to a text-file of Newick-format rooted binary trees,
* `outfile`: path to output file, if it does not exist it will be
created, if it exists it will be overwritten.
seperated by new lines (see `READFOREST`)
* `StarLength`: lengths for internal edges of the gene-trees

##Return Values:
* `dmatricies`: cell-array of the distance matricies(gene-trees), made ultra-metric,
these may then be averaged for STAR 
* `treeforest`: cell-array of the gene-trees from `treefile`

`dmatrix{ii}` corresponds to the tree `treeforest{ii}`

Depends on: `READFOREST`, `MAKEULTRA`


#makeultra.m
`umtree = MAKEULTRA(tr,edgelengths,dleaftoroot)`

   Returns a rooted ultrametric tree with the topology of `tr`, internal branch lengths
   defined by `edgelengths` and leaf-to-root distance defined by
   `dleaftoroot`.
    
#Arguments:
  * `tr`: rooted tree of class `phytree` from Matlab's Bioinformatics
  tool box, branch lengths may be 0 or empty
  * `edgelengths`: a vector where `edgelengths[ii]` is the length of an
   internal branch at level `ii`
  * `dleaftoroot`: is distance of leaves from the root in the final STAR tree

#`[aa,DD] = isUltraMetric(tr)`
Takes  a rooted phytree `tr`, `aa = true` if the tree is ultramatric, and
is `false` otherwise. `DD` the patristic distance matrix may be returnd
for `tr` may be returned as well.

`isUltraMetric` is not clled by anything else, and may be depricated in the future. 



  
Copyright (C) 2011 Lyman Gillispie
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

