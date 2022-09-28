# pytest_combination.py
import pytest

def average(n1, n2):
    return (n1 + n2) / 2

def perc_difference(n1, n2):
    return (n2 - n1)/n1 * 100

# Test the combinations of operations and inputs
@pytest.mark.parametrize("operation", [average, perc_difference])
@pytest.mark.parametrize("n1, n2", [(1, 2), (2, 3)])
def test_is_float(operation, n1, n2):
    assert isinstance(operation(n1, n2), float)

#  pytest -v pytest_combination2.py
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0 -- /opt/anaconda3/envs/mathdatasimplified/bin/python
# cachedir: .pytest_cache
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 4 items
#
# pytest_combination2.py::test_is_float[1-2-average] PASSED                                                                                                          [ 25%]
# pytest_combination2.py::test_is_float[1-2-perc_difference] PASSED                                                                                                  [ 50%]
# pytest_combination2.py::test_is_float[2-3-average] PASSED                                                                                                          [ 75%]
# pytest_combination2.py::test_is_float[2-3-perc_difference] PASSED                                                                                                  [100%]
#
# =========================================================================== 4 passed in 0.04s ============================================================================
#