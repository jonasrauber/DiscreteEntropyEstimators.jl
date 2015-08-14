# Generic types and functions

###########################################################
#
#   Generic types
#
###########################################################

abstract EntropyEstimator

type Frequencies{T<:Integer}
    f::Vector{T}
end

type Samples{T<:Integer}
    s::Vector{T}
end

Observations = Union{Frequencies, Samples}

###########################################################
#
#   Helper functions
#
###########################################################

function convert(::Type{Frequencies{Int}}, s::Samples)
    Frequencies(StatsBase.counts(s.s))
end

###########################################################
#
#   Generic functions
#
###########################################################

# support samples

function entropy(e::EntropyEstimator, s::Samples)
    entropy(e, convert(Frequencies{Int}, s))
end

# support other bases (units) besides e (nats)

function entropy(e::EntropyEstimator, o::Observations, base::Real)
    entropy(e, o) / log(base)
end
