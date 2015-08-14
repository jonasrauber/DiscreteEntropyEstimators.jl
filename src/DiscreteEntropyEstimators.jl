module DiscreteEntropyEstimators

import Base: convert
import StatsBase

export
    # generic functions
    entropy,

    # helper functions
    convert,

    # generic types
    Frequencies,
    Samples,
    Observations,

    # estimators
    MaximumLikelihoodEntropyEstimator,
    MLEntropyEstimator,
    MLEE,
    MillerMaddowBiasCorrectedEntropyEstimator,
    MillerMaddowBiasCorrected,
    MMBCEE,

    # convenient functions
    entropy_ml

include("generic.jl")
include("estimators.jl")

end # module
