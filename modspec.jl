# Model specification
@model function hidden_markov_model(n)
    
    A ~ MatrixDirichlet([ 10.0 1.0 1.0; 
                                            1.0 10.0 1.0; 
                                            1.0 1.0 10.0 ])
    B ~ MatrixDirichlet(ones(3,3))
    
    s_0 ~ Categorical(fill(1.0 / 3.0, 3))
    
    s = randomvar(n)
    o = datavar(Vector{Float64}, n)
    
    s_prev = s_0
    
    for t in 1:n
        s[t] ~ Transition(s_prev, B) 
        o[t] ~ Transition(s[t], A)
        s_prev = s[t]
    end
    
end

# Constraints specification
@constraints function hidden_markov_model_constraints()
    q(s_0, s, A, B) = q(s_0, s)q(A)q(B)
end