# pytest_without_ids.py

from pytest import mark

def average(n1, n2):
    return (n1 + n2) / 2

@mark.parametrize(
    "n1, n2",
    [(-1, -2), (2, 3), (0, 0)],
)
def test_is_float(n1, n2):
    assert isinstance(average(n1, n2), float)

# pytest -v pytest_without_ids.py
# zsh: /usr/local/bin/pytest: bad interpreter: /usr/bin/python: no such file or directory
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0 -- /opt/anaconda3/envs/mathdatasimplified/bin/python
# cachedir: .pytest_cache
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 3 items
#
# pytest_without_ids.py::test_is_float[-1--2] PASSED                                                                                                                 [ 33%]
# pytest_without_ids.py::test_is_float[2-3] PASSED                                                                                                                   [ 66%]
# pytest_without_ids.py::test_is_float[0-0] PASSED                                                                                                                   [100%]
#
# =========================================================================== 3 passed in 0.16s ============================================================================
# (