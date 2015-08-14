# Discrete entropy estimators

###########################################################
#
#   Entropy estimator types
#
###########################################################

type MaximumLikelihoodEntropyEstimator <: EntropyEstimator end
typealias MLEntropyEstimator MaximumLikelihoodEntropyEstimator
typealias MLEE MaximumLikelihoodEntropyEstimator

type MillerMaddowBiasCorrectedEntropyEstimator <: EntropyEstimator end
typealias MillerMaddowBiasCorrected MillerMaddowBiasCorrectedEntropyEstimator
typealias MMBCEE MillerMaddowBiasCorrectedEntropyEstimator

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

# Millor-Maddow Corrected

function entropy{T}(e::MillerMaddowBiasCorrected, f::Frequencies{T})
    n = sum(f.f) # number of samples
    nz = sum(f.f .!= zero(T)) # number of non-zero categories
    entropy(MLEE(), f) + (nz - 1) / (2 * n)
end
