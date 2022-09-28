"""
https://khuyentran1401.github.io/Efficient_Python_tricks_and_tools_for_data_scientists/Chapter5/testing.html
"""
# pytest_parametrize.py
import pytest

def text_contain_word(word, text):
    '''

    Find whether the text contains a particular word'

    :param word: str
    :param text: str
    :return:
    '''


    return word in text


test = [
    ('There is a duck in this text', True),
    ('There is nothing here', False)
]


@pytest.mark.parametrize('sample, expected', test)
def test_text_contain_word(sample, expected):
    word = 'duck'

    assert text_contain_word(word, sample) == expected

#  pytest -v pytest_parameterize.py
# zsh: /usr/local/bin/pytest: bad interpreter: /usr/bin/python: no such file or directory
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0 -- /opt/anaconda3/envs/mathdatasimplified/bin/python
# cachedir: .pytest_cache
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 2 items
#
# pytest_parameterize.py::test_text_contain_word[There is a duck in this text-True] PASSED                                                                           [ 50%]
# pytest_parameterize.py::test_text_contain_word[There is nothing here-False] PASSED                                                                                 [100%]
#
# =========================================================================== 2 passed in 0.04s ============================================================================
