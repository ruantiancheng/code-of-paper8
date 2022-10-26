function write_func(str,PP,SS,RR,QQ,XX)

csvwrite([str,'P.csv'],PP)
csvwrite([str,'S.csv'],SS)
csvwrite([str,'R.csv'],RR)
csvwrite([str,'Q.csv'],QQ)
csvwrite([str,'X.csv'],XX)

