import pytest

# pip install pytest 

"""
    https://mathdatasimplified.com/2022/08/30/execute-a-fixture-only-once-per-session/
    Execute a Fixture Only Once per Session
    August 30, 2022 by khuyentran1476
    Pytest fixture allows you to use the same data to test different functions. Every time you use a pytest fixture in a test, a fixture will be executed.

    This means that a fixture will be executed twice if used in two different tests.

    If a fixture is expensive to execute, you can make the fixture be executed only once per session using scope=session. 
"""

@pytest.fixture(scope="session")

def my_data():
    print("Reading data...")
    return 1

def test_division(my_data):
    print("Test division...")
    assert my_data / 2 == 0.5

def test_modulus(my_data):
    print("Test modulus...")
    assert my_data % 2 == 1

# pytest pytest_fix_test_once_example.py -s
# Inside pycharm it shows

#========================================================================== test session starts ===========================================================================
# platform darwin -- Python 3.9.12, pytest-7.1.2, pluggy-1.0.0
# rootdir: /Users/heidischmidt/PycharmProjects/mathdatasimplified
# collected 2 items

# pytest_tips.py Reading data...
# Test division...
# .Test modulus...
# .
