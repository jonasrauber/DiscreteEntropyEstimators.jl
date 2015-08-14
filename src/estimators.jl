# Discrete entropy estimators

###########################################################
#
#   Entropy estimator types
#
###########################################################

type MaximumLikelihoodEntropyEstimator <: EntropyEstimator end
typealias MLEntropyEstimator MaximumLikelihoodEntropyEstimator
typealias MLEE MaximumLikelihoodEntropyEstimator

###########################################################
#
#   Entropy estimator implementations
#
###########################################################

# Maximum Likelihood

function entropy(e::MLEE, f::Frequencies)
    p = f.f / sum(f.f)
    p::Vector{Float64}
    StatsBase.entropy(p)
end

entropy_ml(o::Observations) = entropy(MLEE(), o)
entropy_ml(o::Observations, base::Real) = entropy(MLEE(), o, base)
