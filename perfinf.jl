imodel = hidden_markov_model(N)
idata = (o = o_data,)

imarginals = (
    A = vague(MatrixDirichlet, 3, 3), 
    B = vague(MatrixDirichlet, 3, 3), 
    s = vague(Categorical, 3)
)

ireturnvars = (
    A = KeepLast(),
    B = KeepLast(),
    s = KeepLast()
)

result = infer(
    model         = imodel, 
    data          = idata,
    constraints   = hidden_markov_model_constraints(),
    initmarginals = imarginals, 
    returnvars    = ireturnvars, 
    iterations    = 20, 
    free_energy   = true
)




