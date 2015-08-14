using DiscreteEntropyEstimators
using Base.Test

@test entropy_ml(Frequencies([1, 1, 2])) == entropy(MLEE(), Frequencies([1, 1, 2]))
@test entropy_ml(Frequencies([1, 1, 2]), 2) == 1.5
@test entropy_ml(Frequencies([1, 1, 2]), e) == entropy_ml(Frequencies([1, 1, 2]))
@test entropy_ml(Frequencies([1, 1, 1, 1, 4, 4, 4]), 4) == 1.25
@test entropy_ml(Samples([1, 2, 3, 3])) == entropy_ml(Frequencies([1, 1, 2]))
