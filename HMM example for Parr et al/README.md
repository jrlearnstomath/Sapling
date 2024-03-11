**HMM_example.jl** is code from [How to train your Hidden Markov Model example from RxInfer.jl](https://reactivebayes.github.io/RxInfer.jl/stable/examples/basic_examples/Hidden%20Markov%20Model/) adjusted to use variables consistent with Parr et. al.:

State-observation matrix: 'A' instead of 'B'
Transition matrix: 'B' instead of 'A'
observations: 'o' instead of 'x'

It runs:

1. setup_gendata_gh.jl # to initialize the thing and generate the state and observation data
2. modspec.jl # to specify the model
3. perfinf.jl # to perform inference
4. showmats.jl # to display the observation-state mapping matrix (A matrix) and transition matrix (B matrix)
5. checkstuff.jl # to plot expected and observed states, and (Bethe) free energy

Plan on adding more, here or somewhere else, about the interpretation of the results. May also not ask to display the actual state data. Also, the way things are look like the cute Roomba has gone from the living room to the bathroom, and the bathroom to the bedroom, but has not moved between the living room and the bedroom. Which feels a little odd, unless, as pointed out to me, the door between the bedroom and living room was closed when we left.