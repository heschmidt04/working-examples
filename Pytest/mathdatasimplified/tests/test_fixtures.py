"""
   https://khuyentran1401.github.io/Efficient_Python_tricks_and_tools_for_data_scientists/Chapter5/testing.html
   If you want to use the same data to test different functions, use pytest fixtures
   To use pytest fixtures, add the decorator @pytest.fixtures to the function that creates the data you want to reuse

"""

import pytest
from textblob import TextBlob

def extract_sentiment(text):
    """
     Extract sentiment using textblob
     Polarity is within range [-1, 1]
     -1 is a bad/negative sentiment
      1 is a good/positive sentiment


    :param text: str
    :return: str
    """
    text = TextBlob(text)
    return text.sentiment.polarity

def example_data():
    return "Today I found my duck and I am happy"
@pytest.fixture
# text = example_data()
def test_extract_sentiment():
    text = example_data()
    sentiment = extract_sentiment(text)
    assert sentiment > 0

#  pytest -v pytest_fixtures.py
# zsh: /usr/local/bin/pytest: bad interpreter: /usr/bin/python: no such file or directory
# ========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0 -- /opt/anaconda3/envs/mathdatasimplified/bin/python
# cachedir: .pytest_cache
# benchmark: 3.4.1 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# plugins: benchmark-3.4.1
# collected 1 item
#
# pytest_fixtures.py::test_extract_sentiment PASSED                                                                                                                  [100%]
#
# =========================================================================== 1 passed in 0.60s ============================================================================