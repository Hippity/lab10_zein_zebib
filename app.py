def greet(name):
    if not isinstance(name, str):
        raise ValueError("Name must be a string")
    return f"Hello {name}, from Zein Zebib!"


if __name__ == "__main__":
    print(greet("World"))
