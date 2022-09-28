"""
    https://khuyentran1401.github.io/Efficient_Python_tricks_and_tools_for_data_scientists/Chapter5/testing.html
"""
# !pip install pytest-benchmark

import pytest

# PyTest benchmark_example.py

def list_comprehension(len_list=5):
    return [i for i in range(len_list)]

def test_concat(benchmark):
    res = benchmark(list_comprehension)
    assert res == [0, 1, 2, 3, 4]

#  pytest -v pytest_benchmark_example.py
# zsh: /usr/local/bin/pytest: bad interpreter: /usr/bin/python: no such file or directory
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 1 item
# pytest_benchmark_example.py::test_concat PASSED
#
# pytest_benchmark_example.py .                                                                                                                                      [100%]
#
#
# ------------------------------------------------------ benchmark: 1 tests -----------------------------------------------------
# Name (time in ns)          Min          Max      Mean    StdDev    Median     IQR    Outliers  OPS (Mops/s)  Rounds  Iterations
# -------------------------------------------------------------------------------------------------------------------------------
# test_concat           504.7500  24,002.2500  544.8702  171.8932  531.4500  7.4500  1367;12101        1.8353   89494          20
# -------------------------------------------------------------------------------------------------------------------------------
#
# Legend:
#   Outliers: 1 Standard Deviation from Mean; 1.5 IQR (InterQuartile Range) from 1st Quartile and 3rd Quartile.
#   OPS: Operations Per Second, computed as 1 / Mean
# =========================================================================== 1 passed in 2.40s ================================================================
