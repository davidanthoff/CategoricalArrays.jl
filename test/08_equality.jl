module TestEquality
    using Base.Test
    using CategoricalArrays

    pool1 = NominalPool([1, 2, 3])
    pool2 = NominalPool([2.0, 1.0, 3.0])

    @test isequal(pool1, pool1) === true
    @test isequal(pool1, pool2) === false
    @test isequal(pool2, pool2) === true

    @test (pool1 == pool1) === true
    @test (pool1 == pool2) === false
    @test (pool2 == pool2) === true

    @test (pool1 === pool1) === true
    @test (pool1 === pool2) === false
    @test (pool2 === pool2) === true

    opool1 = OrdinalPool([1, 2, 3])
    opool2 = OrdinalPool([2.0, 1.0, 3.0])

    @test isequal(opool1, opool1) === true
    @test isequal(opool1, opool2) === false
    @test isequal(opool2, opool2) === true

    @test (opool1 == opool1) === true
    @test (opool1 == opool2) === false
    @test (opool2 == opool2) === true

    @test (opool1 === opool1) === true
    @test (opool1 === opool2) === false
    @test (opool2 === opool2) === true

    nv1a = NominalValue(1, pool1)
    nv2a = NominalValue(1, pool2)
    nv1b = NominalValue(2, pool1)
    nv2b = NominalValue(2, pool2)

    @test isequal(nv1a, nv1a) == true
    @test isequal(nv1a, nv2a) == false
    @test isequal(nv1a, nv1b) == false
    @test isequal(nv1a, nv2b) == true

    @test isequal(nv1b, nv1a) == false
    @test isequal(nv1b, nv2a) == true
    @test isequal(nv1b, nv1b) == true
    @test isequal(nv1b, nv2b) == false

    @test isequal(nv2a, nv1a) == false
    @test isequal(nv2a, nv2a) == true
    @test isequal(nv2a, nv1b) == true
    @test isequal(nv2a, nv2b) == false

    @test isequal(nv2b, nv1a) == true
    @test isequal(nv2b, nv2a) == false
    @test isequal(nv2b, nv1b) == false
    @test isequal(nv2b, nv2b) == true

    @test isequal(1, nv1a) == true
    @test isequal(1, nv2a) == false
    @test isequal(1, nv1b) == false
    @test isequal(1, nv2b) == true

    @test isequal(nv1a, 2) == false
    @test isequal(nv2a, 2) == true
    @test isequal(nv1b, 2) == true
    @test isequal(nv2b, 2) == false

    @test (nv1a == nv1a) == true
    @test (nv1a == nv2a) == false
    @test (nv1a == nv1b) == false
    @test (nv1a == nv2b) == true

    @test (nv1b == nv1a) == false
    @test (nv1b == nv2a) == true
    @test (nv1b == nv1b) == true
    @test (nv1b == nv2b) == false

    @test (nv2a == nv1a) == false
    @test (nv2a == nv2a) == true
    @test (nv2a == nv1b) == true
    @test (nv2a == nv2b) == false

    @test (nv2b == nv1a) == true
    @test (nv2b == nv2a) == false
    @test (nv2b == nv1b) == false
    @test (nv2b == nv2b) == true

    @test (nv1a === nv1a) == true
    @test (nv1a === nv2a) == false
    @test (nv1a === nv1b) == false
    @test (nv1a === nv2b) == false

    @test (nv1b === nv1a) == false
    @test (nv1b === nv2a) == false
    @test (nv1b === nv1b) == true
    @test (nv1b === nv2b) == false

    @test (nv2a === nv1a) == false
    @test (nv2a === nv2a) == true
    @test (nv2a === nv1b) == false
    @test (nv2a === nv2b) == false

    @test (nv2b === nv1a) == false
    @test (nv2b === nv2a) == false
    @test (nv2b === nv1b) == false
    @test (nv2b === nv2b) == true

    @test (1 == nv1a) == true
    @test (1 == nv2a) == false
    @test (1 == nv1b) == false
    @test (1 == nv2b) == true

    @test (nv1a == 2) == false
    @test (nv2a == 2) == true
    @test (nv1b == 2) == true
    @test (nv2b == 2) == false

    ov1a = OrdinalValue(1, opool1)
    ov2a = OrdinalValue(1, opool2)
    ov1b = OrdinalValue(2, opool1)
    ov2b = OrdinalValue(2, opool2)

    @test isequal(ov1a, ov1a) == true
    @test isequal(ov1a, ov2a) == false
    @test isequal(ov1a, ov1b) == false
    @test isequal(ov1a, ov2b) == true

    @test isequal(ov1b, ov1a) == false
    @test isequal(ov1b, ov2a) == true
    @test isequal(ov1b, ov1b) == true
    @test isequal(ov1b, ov2b) == false

    @test isequal(ov2a, ov1a) == false
    @test isequal(ov2a, ov2a) == true
    @test isequal(ov2a, ov1b) == true
    @test isequal(ov2a, ov2b) == false

    @test isequal(ov2b, ov1a) == true
    @test isequal(ov2b, ov2a) == false
    @test isequal(ov2b, ov1b) == false
    @test isequal(ov2b, ov2b) == true

    @test isequal(1, ov1a) == true
    @test isequal(1, ov2a) == false
    @test isequal(1, ov1b) == false
    @test isequal(1, ov2b) == true

    @test isequal(ov1a, 2) == false
    @test isequal(ov2a, 2) == true
    @test isequal(ov1b, 2) == true
    @test isequal(ov2b, 2) == false

    @test (ov1a == ov1a) == true
    @test (ov1a == ov2a) == false
    @test (ov1a == ov1b) == false
    @test (ov1a == ov2b) == true

    @test (ov1b == ov1a) == false
    @test (ov1b == ov2a) == true
    @test (ov1b == ov1b) == true
    @test (ov1b == ov2b) == false

    @test (ov2a == ov1a) == false
    @test (ov2a == ov2a) == true
    @test (ov2a == ov1b) == true
    @test (ov2a == ov2b) == false

    @test (ov2b == ov1a) == true
    @test (ov2b == ov2a) == false
    @test (ov2b == ov1b) == false
    @test (ov2b == ov2b) == true

    @test (ov1a === ov1a) == true
    @test (ov1a === ov2a) == false
    @test (ov1a === ov1b) == false
    @test (ov1a === ov2b) == false

    @test (ov1b === ov1a) == false
    @test (ov1b === ov2a) == false
    @test (ov1b === ov1b) == true
    @test (ov1b === ov2b) == false

    @test (ov2a === ov1a) == false
    @test (ov2a === ov2a) == true
    @test (ov2a === ov1b) == false
    @test (ov2a === ov2b) == false

    @test (ov2b === ov1a) == false
    @test (ov2b === ov2a) == false
    @test (ov2b === ov1b) == false
    @test (ov2b === ov2b) == true

    @test (1 == ov1a) == true
    @test (1 == ov2a) == false
    @test (1 == ov1b) == false
    @test (1 == ov2b) == true

    @test (ov1a == 2) == false
    @test (ov2a == 2) == true
    @test (ov1b == 2) == true
    @test (ov2b == 2) == false
end
