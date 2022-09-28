import pytest

'''
If you want to test the combinations of two sets of parameters
writing all possible combinations can be time consuming 
and is difficult to read

'''

def average(n1, n2):
    return (n1 + n2) / 2

def perct_difference(n1, n2):
    return (n2 - n1)/ n1 * 100

# Test the combinations of operations and inputs
@pytest.mark.parametrize("operation, n1, n2",
                         [(average, 1, 2),
                          (average, 2, 3),
                          (perct_difference, 1, 2),
                          (perct_difference, 2, 3)
                         ])
def test_is_float(operation, n1, n2):
    assert isinstance(operation(n1, n2), float)

# pytest -v pytest_combination.py
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0 -- /opt/anaconda3/envs/mathdatasimplified/bin/python
# cachedir: .pytest_cache
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 4 items
#
# pytest_combination.py::test_is_float[average-1-2] PASSED                                                                                                           [ 25%]
# pytest_combination.py::test_is_float[average-2-3] PASSED                                                                                                           [ 50%]
# pytest_combination.py::test_is_float[perct_difference-1-2] PASSED                                                                                                  [ 75%]
# pytest_combination.py::test_is_float[perct_difference-2-3] PASSED                                                                                                  [100%]
#
# =========================================================================== 4 passed in 0.05s ============================================================================
#