# DiscreteEntropyEstimators

[![Build Status](https://travis-ci.org/jonasrauber/DiscreteEntropyEstimators.jl.svg?branch=master)](https://travis-ci.org/jonasrauber/DiscreteEntropyEstimators.jl)

##Available Estimators

* Maximum Likelihood
    * ``MaximumLikelihoodEntropyEstimator``
    * ``MLEntropyEstimator``
    * ``MLEE``
* Miller-Maddow Bias Correction
    * ``MillerMaddowBiasCorrectedEntropyEstimator``
    * ``MillerMaddowBiasCorrected``
    * ``MMBCEE``
* **WORK IN PROGRESS**

##Basic Usage

The most general syntax is

```julia
H = entropy(estimator, observations, base)
```

The default base is ``e``, i.e. the default unit is nats.
Using the maximum likelihood estimator, the entropy in nats can be calculated like this:

```julia
H = entropy(MLEE(), Frequencies([1, 1, 2]))
```

Using bits instead of nats:

```julia
H = entropy_ml(Frequencies([1, 1, 2]), 2) # bits
print(H) # -> 1.5
```

Instead of frequencies, the samples can also be provided directly:

```julia
H = entropy(MLEE(), Samples([1, 2, 3, 3]))
```

Some estimators provide convenience functions:

```julia
H = entropy_ml(Frequencies([1, 1, 2]))
```

