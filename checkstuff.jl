p1 = scatter(argmax.(s_data), 
                        title="Inference results", 
                        label = "Real", 
                        ms = 6, 
                        legend=:right,
                        xlabel="Time" ,
                        yticks= ([1,2,3],["Bedroom","Living room","Bathroom"]),
                        size=(900,550)
                        )

p1 = scatter!(p1, argmax.(ReactiveMP.probvec.(result.posteriors[:s])),
                        label = "Inferred",
                        ms = 3
                        )

p2 = plot(result.free_energy, 
                    label="Free energy",
                    xlabel="Iteration Number"
                    )

display(plot(p1, p2, layout = @layout([ a; b ])))