# Probabilities of various histories on 5-taxon caterpillar tree
#

# MATCHING TREE
f1  := (1/1)*P21(x)*P21(y)*P21(z):             #:= P[(1,2,3)] 
f2  := (1/3)*P21(x)*P21(y)*P22(z):             #:= P[(1,2,4)] 
f3  := (1/1)*P21(x)*P22(y)*(1/3)*P31(z):       #:= P[(1,3,3)]
f4  := (1/3)*P21(x)*P22(y)*(1/3)*P32(z):       #:= P[(1,3,4)]
f5  := (1/18)*P21(x)*P22(y)*P33(z):            #:= P[(1,4,4)]
f6  := (1/1)*P22(x)*(1/3)*P31(y)*P21(z):       #:= P[(2,2,3)]
f7  := (1/3)*P22(x)*(1/3)*P31(y)*P22(z):       #:= P[(2,2,4)]
f8  := (1/1)*P22(x)*(1/3)*P32(y)*(1/3)*P31(z): #:= P[(2,3,3)]
f9  := (1/3)*P22(x)*(1/3)*P32(y)*(1/3)*P32(z): #:= P[(2,3,4)]
f10 := (1/18)*P22(x)*(1/3)*P32(y)*P33(z):      #:= P[(2,4,4)]
f11 := (1/1)*P22(x)*P33(y)*(1/18)*P41(z):      #:= P[(3,3,3)]
f12 := (1/3)*P22(x)*P33(y)*(1/18)*P42(z):      #:= P[(3,3,4)]
f13 := (1/18)*P22(x)*P33(y)*(1/6)*P43(z):      #:= P[(3,4,4)]
f14 := (1/180)*P22(x)*P33(y)*P44(z);           #:= P[(4,4,4)] 

f := Vector[row]([f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14]):

v1:=Vector[row](14):
v1[[1,2,3,4,5,6,7,8,9,10,11,12,13,14]]:=1:
p1:=DotProduct(f,v1):

v2:=Vector[row](14):
v2[[2,4,5,7,9,10,12,13,14]]:=1:
p2:=DotProduct(f,v2):

v3:=Vector[row](14):
v3[[3,4,5,8,9,10,11,12,13,14]]:=1:
p3:=DotProduct(f,v3):

v4:=Vector[row](14):
v4[[4,5,9,10,12,13,14]]:=1:
p4:=DotProduct(f,v4):

v5:=Vector[row](14):
v5[[5,10,13,14]]:=1:
p5:=DotProduct(f,v5):

v6:=Vector[row](14):
v6[[5,10,13,14]]:=1:
p6:=DotProduct(f,v6):

v7:=Vector[row](14):
v7[[6,7,8,9,10,11,12,13,14]]:=1:
p7:=DotProduct(f,v7):

v8:=Vector[row](14):
v8[[7,9,10,12,13,14]]:=1:
p8:=DotProduct(f,v8):

v9:=Vector[row](14):
v9[[8,9,10,11,12,13,14]]:=1:
p9:=DotProduct(f,v9):

v10:=Vector[row](14):
v10[[9,10,12,13,14]]:=1:
p10:=DotProduct(f,v10):

v11:=Vector[row](14):
v11[[10,13,14]]:=1:
p11:=DotProduct(f,v11):

v12:=Vector[row](14):
v12[[10,13,14]]:=1:
p12:=DotProduct(f,v12):

v13:=Vector[row](14):
v13[[11,12,13,14]]:=1:
p13:=DotProduct(f,v13):

v14:=Vector[row](14):
v14[[12,13,14]]:=1:
p14:=DotProduct(f,v14):

v15:=Vector[row](14):
v15[[11,12,13,14]]:=1:
p15:=DotProduct(f,v15):

v16:=Vector[row](14):
v16[[12,13,14]]:=1:
p16:=DotProduct(f,v16):

v17:=Vector[row](14):
v17[[13,14]]:=1:
p17:=DotProduct(f,v17):

v18:=Vector[row](14):
v18[[13,14]]:=1:
p18:=DotProduct(f,v18):

v19:=Vector[row](14):
v19[[14]]:=1:
p19:=DotProduct(f,v19):

v20:=Vector[row](14):
v20[[14]]:=1:
p20:=DotProduct(f,v20):

v21:=Vector[row](14):
v21[[14]]:=1:
p21:=DotProduct(f,v21):

v22:=Vector[row](14):
v22[[14]]:=1:
p22:=DotProduct(f,v22):

v23:=Vector[row](14):
v23[[14]]:=1:
p23:=DotProduct(f,v23):

v24:=Vector[row](14):
v24[[14]]:=1:
p24:=DotProduct(f,v24):

v25:=Vector[row](14):
v25[[6,7,8,9,10,11,12,13,14]]:=1:
p25:=DotProduct(f,v25):

v26:=Vector[row](14):
v26[[7,9,10,12,13,14]]:=1:
p26:=DotProduct(f,v26):

v27:=Vector[row](14):
v27[[8,9,10,11,12,13,14]]:=1:
p27:=DotProduct(f,v27):

v28:=Vector[row](14):
v28[[9,10,12,13,14]]:=1:
p28:=DotProduct(f,v28):

v29:=Vector[row](14):
v29[[10,13,14]]:=1:
p29:=DotProduct(f,v29):

v30:=Vector[row](14):
v30[[10,13,14]]:=1:
p30:=DotProduct(f,v30):

v31:=Vector[row](14):
v31[[11,12,13,14]]:=1:
p31:=DotProduct(f,v31):

v32:=Vector[row](14):
v32[[12,13,14]]:=1:
p32:=DotProduct(f,v32):

v33:=Vector[row](14):
v33[[11,12,13,14]]:=1:
p33:=DotProduct(f,v33):

v34:=Vector[row](14):
v34[[12,13,14]]:=1:
p34:=DotProduct(f,v34):

v35:=Vector[row](14):
v35[[13,14]]:=1:
p35:=DotProduct(f,v35):

v36:=Vector[row](14):
v36[[13,14]]:=1:
p36:=DotProduct(f,v36):

v37:=Vector[row](14):
v37[[14]]:=1:
p37:=DotProduct(f,v37):

v38:=Vector[row](14):
v38[[14]]:=1:
p38:=DotProduct(f,v38):

v39:=Vector[row](14):
v39[[14]]:=1:
p39:=DotProduct(f,v39):

v40:=Vector[row](14):
v40[[14]]:=1:
p40:=DotProduct(f,v40):

v41:=Vector[row](14):
v41[[14]]:=1:
p41:=DotProduct(f,v41):

v42:=Vector[row](14):
v42[[14]]:=1:
p42:=DotProduct(f,v42):

v43:=Vector[row](14):
v43[[11,12,13,14]]:=1:
p43:=DotProduct(f,v43):

v44:=Vector[row](14):
v44[[12,13,14]]:=1:
p44:=DotProduct(f,v44):

v45:=Vector[row](14):
v45[[11,12,13,14]]:=1:
p45:=DotProduct(f,v45):

v46:=Vector[row](14):
v46[[12,13,14]]:=1:
p46:=DotProduct(f,v46):

v47:=Vector[row](14):
v47[[13,14]]:=1:
p47:=DotProduct(f,v47):

v48:=Vector[row](14):
v48[[13,14]]:=1:
p48:=DotProduct(f,v48):

v49:=Vector[row](14):
v49[[14]]:=1:
p49:=DotProduct(f,v49):

v50:=Vector[row](14):
v50[[14]]:=1:
p50:=DotProduct(f,v50):

v51:=Vector[row](14):
v51[[14]]:=1:
p51:=DotProduct(f,v51):

v52:=Vector[row](14):
v52[[14]]:=1:
p52:=DotProduct(f,v52):

v53:=Vector[row](14):
v53[[14]]:=1:
p53:=DotProduct(f,v53):

v54:=Vector[row](14):
v54[[14]]:=1:
p54:=DotProduct(f,v54):

v55:=Vector[row](14):
v55[[14]]:=1:
p55:=DotProduct(f,v55):

v56:=Vector[row](14):
v56[[14]]:=1:
p56:=DotProduct(f,v56):

v57:=Vector[row](14):
v57[[14]]:=1:
p57:=DotProduct(f,v57):

v58:=Vector[row](14):
v58[[14]]:=1:
p58:=DotProduct(f,v58):

v59:=Vector[row](14):
v59[[14]]:=1:
p59:=DotProduct(f,v59):

v60:=Vector[row](14):
v60[[14]]:=1:
p60:=DotProduct(f,v60):

v61:=Vector[row](14):
v61[[3,4,5,8,9,10]]:=1:  v61[[11,12,13,14]]:=2:
p61:=DotProduct(f,v61):

v62:=Vector[row](14):
v62[[8,9,10]]:=1:     v62[[11,12,13,14]]:=2:
p62:=DotProduct(f,v62):

v63:=Vector[row](14):
v63[[8,9,10]]:=1:     v63[[11,12,13,14]]:=2:
p63:=DotProduct(f,v63):

v64:=Vector[row](14):
v64[[5,10,13]]:=1:       v64[[14]]:=2:
p64:=DotProduct(f,v64):

v65:=Vector[row](14):
v65[[10,13]]:=1:         v65[[14]]:=2:
p65:=DotProduct(f,v65):

v66:=Vector[row](14):
v66[[10,13]]:=1:         v66[[14]]:=2:
p66:=DotProduct(f,v66):

v67:=Vector[row](14):
v67[[5,10,13]]:=1:       v67[[14]]:=2:
p67:=DotProduct(f,v67):

v68:=Vector[row](14):
v68[[13]]:=1:            v68[[14]]:=2:
p68:=DotProduct(f,v68):

v69:=Vector[row](14):
v69[[13]]:=1:            v69[[14]]:=2:
p69:=DotProduct(f,v69):

v70:=Vector[row](14):
v70[[10,13]]:=1:         v70[[14]]:=2:
p70:=DotProduct(f,v70):

v71:=Vector[row](14):
v71[[13]]:=1:            v71[[14]]:=2:
p71:=DotProduct(f,v71):

v72:=Vector[row](14):
v72[[13]]:=1:            v72[[14]]:=2:
p72:=DotProduct(f,v72):

v73:=Vector[row](14):
v73[[10,13]]:=1:         v73[[14]]:=2:
p73:=DotProduct(f,v73):

v74:=Vector[row](14):
v74[[13]]:=1:            v74[[14]]:=2:
p74:=DotProduct(f,v74):

v75:=Vector[row](14):
v75[[13]]:=1:          v75[[14]]:=2:
p75:=DotProduct(f,v75):

v76:=Vector[row](14):
v76[[2,4,7,9,12]]:=1:  v76[[5,10,13]]:=2:  v76[[14]]:=3:
p76:=DotProduct(f,v76):

v77:=Vector[row](14):
v77[[7,9,12]]:=1:      v77[[10,13]]:=2:    v77[[14]]:=3:
p77:=DotProduct(f,v77):

v78:=Vector[row](14):
v78[[7,9,12]]:=1:      v78[[10,13]]:=2:    v78[[14]]:=3:
p78:=DotProduct(f,v78):

v79:=Vector[row](14):
v79[[4,9,12]]:=1:         v79[[5,10,13]]:=2:  v79[[14]]:=3:
p79:=DotProduct(f,v79):

v80:=Vector[row](14):
v80[[12]]:=1:          v80[[13]]:=2:       v80[[14]]:=3:
p80:=DotProduct(f,v80):

v81:=Vector[row](14):
v81[[12]]:=1:          v81[[13]]:=2:       v81[[14]]:=3:
p81:=DotProduct(f,v81):

v82:=Vector[row](14):
v82[[9,12]]:=1:        v82[[10,13]]:=2:    v82[[14]]:=3:
p82:=DotProduct(f,v82):

v83:=Vector[row](14):
v83[[12]]:=1:          v83[[13]]:=2:       v83[[14]]:=3:
p83:=DotProduct(f,v83):

v84:=Vector[row](14):
v84[[12]]:=1:          v84[[13]]:=2:       v84[[14]]:=3:
p84:=DotProduct(f,v84):

v85:=Vector[row](14):
v85[[9,12]]:=1:        v85[[10,13]]:=2:    v85[[14]]:=3:
p85:=DotProduct(f,v85):

v86:=Vector[row](14):
v86[[12]]:=1:          v86[[13]]:=2:       v86[[14]]:=3:
p86:=DotProduct(f,v86):

v87:=Vector[row](14):
v87[[12]]:=1:          v87[[13]]:=2:       v87[[14]]:=3:
p87:=DotProduct(f,v87):

v88:=Vector[row](14):
v88[[4,9]]:=1:         v88[[5,10,12]]:=2:  v88[[13,14]]:=3:
p88:=DotProduct(f,v88):

v89:=Vector[row](14):
v89[[13]]:=1:          v89[[14]]:=3:
p89:=DotProduct(f,v89):

v90:=Vector[row](14):
v90[[13]]:=1:          v90[[14]]:=3:
p90:=DotProduct(f,v90):

v91:=Vector[row](14):
v91[[9]]:=1:           v91[[10,12]]:=2:   v91[[13,14]]:=3:
p91:=DotProduct(f,v91):

v92:=Vector[row](14):
v92[[13]]:=1:          v92[[14]]:=3:
p92:=DotProduct(f,v92):

v93:=Vector[row](14):
v93[[13]]:=1:          v93[[14]]:=3:
p93:=DotProduct(f,v93):

### check this one with James
v94:=Vector[row](14):
v94[[9]]:=1:           v94[[10,12]]:=2:   v94[[13,14]]:=3:
p94:=DotProduct(f,v94):

v95:=Vector[row](14):
v95[[13]]:=1:          v95[[14]]:=3:
p95:=DotProduct(f,v95):

v96:=Vector[row](14):
v96[[13]]:=1:          v96[[14]]:=3:
p96:=DotProduct(f,v96):

v97:=Vector[row](14):
v97[[9,10]]:=1:        v97[[12]]:=2:     v97[[13,14]]:=3:
p97:=DotProduct(f,v97):

v98:=Vector[row](14):
v98[[10,13]]:=1:       v98[[14]]:=3:
p98:=DotProduct(f,v98):

v99:=Vector[row](14):
v99[[10,13]]:=1:       v99[[14]]:=3:
p99:=DotProduct(f,v99):

v100:=Vector[row](14):
v100[[9,10]]:=1:       v100[[12]]:=2:    v100[[13,14]]:=3:
p100:=DotProduct(f,v100):

v101:=Vector[row](14):
v101[[10,13]]:=1:       v101[[14]]:=3:
p101:=DotProduct(f,v101):

v102:=Vector[row](14):
v102[[10,13]]:=1:       v102[[14]]:=3:
p102:=DotProduct(f,v102):

v103:=Vector[row](14):
v103[[4,5,9,10]]:=1:    v103[[12]]:=2:   v103[[13,14]]:=3:
p103:=DotProduct(f,v103):

v104:=Vector[row](14):
v104[[5,10,13]]:=1:     v104[[14]]:=3:
p104:=DotProduct(f,v104):

v105:=Vector[row](14):
v105[[5,10,13]]:=1:     v105[[14]]:=3:
p105:=DotProduct(f,v105):



##### Original file
#
#MATCHING TREE
#f1  := P[(1,2,3)] = (1/1)*p_{2 1}(T1)*p_{2 1}(T2)*p_{2 1}(T3)
#f2  := P[(1,2,4)] = (1/3)*p_{2 1}(T1)*p_{2 1}(T2)*p_{2 2}(T3)
#f3  := P[(1,3,3)] = (1/1)*p_{2 1}(T1)*p_{2 2}(T2)*(1/3)*p_{3 1}(T3)
#f4  := P[(1,3,4)] = (1/3)*p_{2 1}(T1)*p_{2 2}(T2)*(1/3)*p_{3 2}(T3)
#f5  := P[(1,4,4)] = (1/18)*p_{2 1}(T1)*p_{2 2}(T2)*p_{3 3}(T3)
#f6  := P[(2,2,3)] = (1/1)*p_{2 2}(T1)*(1/3)*p_{3 1}(T2)*p_{2 1}(T3)
#f7  := P[(2,2,4)] = (1/3)*p_{2 2}(T1)*(1/3)*p_{3 1}(T2)*p_{2 2}(T3)
#f8  := P[(2,3,3)] = (1/1)*p_{2 2}(T1)*(1/3)*p_{3 2}(T2)*(1/3)*p_{3 1}(T3)
#f9  := P[(2,3,4)] = (1/3)*p_{2 2}(T1)*(1/3)*p_{3 2}(T2)*(1/3)*p_{3 2}(T3)
#f10 := P[(2,4,4)] = (1/18)*p_{2 2}(T1)*(1/3)*p_{3 2}(T2)*p_{3 3}(T3)
#f11 := P[(3,3,3)] = (1/1)*p_{2 2}(T1)*p_{3 3}(T2)*(1/18)*p_{4 1}(T3)
#f12 := P[(3,3,4)] = (1/3)*p_{2 2}(T1)*p_{3 3}(T2)*(1/18)*p_{4 2}(T3)
#f13 := P[(3,4,4)] = (1/18)*p_{2 2}(T1)*p_{3 3}(T2)*(1/6)*p_{4 3}(T3)
#f14 := P[(4,4,4)] = (1/180)*p_{2 2}(T1)*p_{3 3}(T2)*p_{4 4}(T3)
#
#
#Gene Tree                  Prob assuming ((((AB)C)D)E) species tree
#
#((((A,B),C),D),E);         f1+f2+f3+f4+f5+f6+f7+f8+f9+f10+f11+f12+f13+f14
#((((A,B),C),E),D);         f2+f4+f5+f7+f9+f10+f12+f13+f14
#((((A,B),D),C),E);         f3+f4+f5+f8+f9+f10+f11+f12+f13+f14
#((((A,B),D),E),C);         f4+f5+f9+f10+f12+f13+f14
#((((A,B),E),C),D);         f5+f10+f13+f14
#((((A,B),E),D),C);         f5+f10+f13+f14
#((((A,C),B),D),E);         f6+f7+f8+f9+f10+f11+f12+f13+f14
#((((A,C),B),E),D);         f7+f9+f10+f12+f13+f14
#((((A,C),D),B),E);         f8+f9+f10+f11+f12+f13+f14
#((((A,C),D),E),B);         f9+f10+f12+f13+f14
#((((A,C),E),B),D);         f10+f13+f14
#((((A,C),E),D),B);         f10+f13+f14
#((((A,D),B),C),E);         f11+f12+f13+f14
#((((A,D),B),E),C);         f12+f13+f14
#((((A,D),C),B),E);         f11+f12+f13+f14
#((((A,D),C),E),B);         f12+f13+f14
#((((A,D),E),B),C);         f13+f14
#((((A,D),E),C),B);         f13+f14
#((((A,E),B),C),D);         f14
#((((A,E),B),D),C);         f14
#((((A,E),C),B),D);         f14
#((((A,E),C),D),B);         f14
#((((A,E),D),B),C);         f14
#((((A,E),D),C),B);         f14
#((((B,C),A),D),E);         f6+f7+f8+f9+f10+f11+f12+f13+f14
#((((B,C),A),E),D);         f7+f9+f10+f12+f13+f14
#((((B,C),D),A),E);         f8+f9+f10+f11+f12+f13+f14
#((((B,C),D),E),A);         f9+f10+f12+f13+f14
#((((B,C),E),A),D);         f10+f13+f14
#((((B,C),E),D),A);         f10+f13+f14
#((((B,D),A),C),E);         f11+f12+f13+f14
#((((B,D),A),E),C);         f12+f13+f14
#((((B,D),C),A),E);         f11+f12+f13+f14
#((((B,D),C),E),A);         f12+f13+f14
#((((B,D),E),A),C);         f13+f14
#((((B,D),E),C),A);         f13+f14
#((((B,E),A),C),D);         f14
#((((B,E),A),D),C);         f14
#((((B,E),C),A),D);         f14
#((((B,E),C),D),A);         f14
#((((B,E),D),A),C);         f14
#((((B,E),D),C),A);         f14
#((((C,D),A),B),E);         f11+f12+f13+f14
#((((C,D),A),E),B);         f12+f13+f14
#((((C,D),B),A),E);         f11+f12+f13+f14
#((((C,D),B),E),A);         f12+f13+f14
#((((C,D),E),A),B);         f13+f14
#((((C,D),E),B),A);         f13+f14
#((((C,E),A),B),D);         f14
#((((C,E),A),D),B);         f14
#((((C,E),B),A),D);         f14
#((((C,E),B),D),A);         f14
#((((C,E),D),A),B);         f14
#((((C,E),D),B),A);         f14
#((((D,E),A),B),C);         f14
#((((D,E),A),C),B);         f14
#((((D,E),B),A),C);         f14
#((((D,E),B),C),A);         f14
#((((D,E),C),A),B);         f14
#((((D,E),C),B),A);         f14
#(((A,B),(C,D)),E);         f3+f4+f5+f8+f9+f10+2*f11+2*f12+2*f13+2*f14
#(((A,C),(B,D)),E);         f8+f9+f10+2*f11+2*f12+2*f13+2*f14
#(((A,D),(B,C)),E);         f8+f9+f10+2*f11+2*f12+2*f13+2*f14
#(((A,B),(C,E)),D);         f5+f10+f13+2*f14
#(((A,C),(B,E)),D);         f10+f13+2*f14
#(((A,E),(B,C)),D);         f10+f13+2*f14
#(((A,B),(D,E)),C);         f5+f10+f13+2*f14
#(((A,D),(B,E)),C);         f13+2*f14
#(((A,E),(B,D)),C);         f13+2*f14
#(((A,C),(D,E)),B);         f10+f13+2*f14
#(((A,D),(C,E)),B);         f13+2*f14
#(((A,E),(C,D)),B);         f13+2*f14
#(((B,C),(D,E)),A);         f10+f13+2*f14
#(((B,D),(C,E)),A);         f13+2*f14
#(((B,E),(C,D)),A);         f13+2*f14
#(((A,B),C),(D,E));         f2+f4+2*f5+f7+f9+2*10+f12+2*f13+3*f14
#(((A,C),B),(D,E));         f7+f9+2*f10+f12+2*f13+3*f14
#(((B,C),A),(D,E));         f7+f9+2*f10+f12+2*f13+3*f14
#(((A,B),D),(C,E));         f4+2*f5+f9+2*f10+f12+2*f13+3*f14
#(((A,D),B),(C,E));         f12+2*f13+3*f14
#(((B,D),A),(C,E));         f12+2*f13+3*f14
#(((A,C),D),(B,E));         f9+2*f10+f12+2*f13+3*f14
#(((A,D),C),(B,E));         f12+2*f13+3*f14
#(((C,D),A),(B,E));         f12+2*f13+3*f14
#(((B,C),D),(A,E));         f9+2*f10+f12+2*f13+3*f14
#(((B,D),C),(A,E));         f12+2*f13+3*f14
#(((C,D),B),(A,E));         f12+2*f13+3*f14
#(((A,B),E),(C,D));         f4+2*f5+f9+2*f10+2*f12+3*f13+3*f14
#(((A,E),B),(C,D));         f13+3*f14
#(((B,E),A),(C,D));         f13+3*f14
#(((A,C),E),(B,D));         f9+2*f10+2*f12+3*f13+3*f14
#(((A,E),C),(B,D));         f13+3*f14
#(((C,E),A),(B,D));         f13+3*f14
#(((B,C),E),(A,D));         f9+2*f10+2*f12_3*f13+3*f14
#(((B,E),C),(A,D));         f13+3*f14
#(((C,E),B),(A,D));         f13+3*f14
#(((A,D),E),(B,C));         f9+f10+2*f12+3*f13+3*f14
#(((A,E),D),(B,C));         f10+f13+3*f14
#(((D,E),A),(B,C));         f10+f13+3*f14
#(((B,D),E),(A,C));         f9+f10+2*f12+3*f13+3*f14
#(((B,E),D),(A,C));         f10+f13+3*f14
#(((D,E),B),(A,C));         f10+f13+3*f14
#(((C,D),E),(A,B));         f4+f5+f9+f10+2*f12+3*f13+3*f14
#(((C,E),D),(A,B));         f5+f10+f13+3*f14
#(((D,E),C),(A,B));         f5+f10+f13+3*f14
