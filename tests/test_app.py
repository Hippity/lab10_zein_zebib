from app import greet
import unittest

class TestApp(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("World"), "Hello World, from Zein Zebib!")

if __name__ == "__main__":
    unittest.main()
