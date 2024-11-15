from app import greet
import unittest

class TestApp(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("World"), "Hello World, from Zein Zebib!")
    
    def test_greet_invalid_input(self):
        with self.assertRaises(ValueError):
            greet(123)

if __name__ == "__main__":
    unittest.main()
