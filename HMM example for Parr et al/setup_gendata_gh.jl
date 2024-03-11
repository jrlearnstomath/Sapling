# Activate local environment, see `Project.toml`
import Pkg; Pkg.activate("D:\\Sapling"); Pkg.instantiate()
;

using RxInfer, Random, BenchmarkTools, Distributions, LinearAlgebra, Plots

"""
    rand_vec(rng, distribution::Categorical)

This function returns a one-hot encoding of a random sample from a categorical distribution. The sample is drawn with the `rng` random number generator.
"""
function rand_vec(rng, distribution::Categorical) 
    k = ncategories(distribution)
    s = zeros(k)
    drawn_category = rand(rng, distribution)
    s[drawn_category] = 1.0
    return s
end

function generate_data(n_samples; seed = 42)
    
    rng = MersenneTwister(seed)
    
    # Transition probabilities 
    state_transition_matrix = [0.9 0.0 0.1;
                                                        0.0 0.9 0.1; 
                                                        0.05 0.05 0.9] 
    # Observation noise
    observation_distribution_matrix = [0.9 0.05 0.05;
                                                                         0.05 0.9 0.05;
                                                                         0.05 0.05 0.9] 
    # Initial state
    s_initial = [1.0, 0.0, 0.0] 
    
    states = Vector{Vector{Float64}}(undef, n_samples) # one-hot encoding of the states
    observations = Vector{Vector{Float64}}(undef, n_samples) # one-hot encoding of the observations
    
    s_prev = s_initial
    
    for t = 1:n_samples
        s_probvec = state_transition_matrix * s_prev
        states[t] = rand_vec(rng, Categorical(s_probvec ./ sum(s_probvec)))
        obs_probvec = observation_distribution_matrix * states[t]
        observations[t] = rand_vec(rng, Categorical(obs_probvec ./ sum(obs_probvec)))
        s_prev = states[t]
    end
    
    return observations, states
end

# Test data
N = 100
o_data, s_data = generate_data(N);

pd = 
scatter(argmax.(s_data), leg=false, xlabel="Time",yticks= ([1,2,3],["Bedroom","Living room","Bathroom"]))

display(plot(pd))
