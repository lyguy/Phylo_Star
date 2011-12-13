# From Pamilo and Nei
#
# P_{ij}(t) = Prob(i alleles enter an edge and j alleles leave on a branch of length t)
#


#################################
#
#  Algebraic Formulation
#
#################################

# Algebraic computations
P21:= t->1-t:
P22:=t->t:
P31:=t->1-3*t/2+(t^3)/2:
P32:=t->3*(t-(t^3))/2:
P33:=t->(t^3):
P41:=t->1-9*t/5+(t^3)-(t^6)/5:
P42:=t->9*t/5-3*(t^3)+6*(t^6)/5:
P43:=t->2*(t^3)-2*(t^6):
P44:=t->(t^6):
