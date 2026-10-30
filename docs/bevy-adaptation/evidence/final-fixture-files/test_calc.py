import unittest
from calc import increment
class CalcTest(unittest.TestCase):
    def test_increment(self):
        self.assertEqual(increment(4), 5)
