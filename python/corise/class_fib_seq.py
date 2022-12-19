import doctest


class Fib(object):
    """
    This class creates the Fibonacci sequence from 0 to the max_num passed in
    """

    def __init__(self, max_seq):
        """
        The max_num is the number to make the Fib sequence up until
        :type max_seq: object
        """
        # Do data input checks and raise errors if not a positive integer
        if type(max_seq) != int:
            raise TypeError("n must be a positive integer")
        if max_seq < 1:
            raise ValueError("n must be a positiive integer")
        #  using a range and start with 1 to N -- need to add one to complete the seq
        self.max_seq = max_seq + 1
        self.current_seq = 0  # is starting number n
        self.additive = 0  # is start of counter x
        self.result = 1  # will be the result y which is z = (x + y)
        if self.max_seq == 0:
            return 0


    def __iter__(self):
        return self

    def __next__(self):
        """
        >>> a=Fib(5)
        >>> for i in a:
        ...     print(i)
        0
        1
        1
        2
        3
        5
        """
        # Increment the current_seq when called
        self.current_seq += 1
        # If exceed the max_seq -- raise exception so it doesn't exhaust
        if self.current_seq > self.max_seq:
            raise StopIteration
        # Start the fibonacci sequence at 0
        if self.current_seq == 1:
            return 0
        self.new_result = self.result + self.additive  # this is z
        # Need the repeat of 1
        if self.current_seq > 2:
            self.additive = self.result
        self.result = self.new_result
        # Return result
        return self.result


print("-------Test1-------")
test1 = Fib(5)
for i in test1:
    print(i)

print("-------Test2-------")
test2 = Fib(21)
for i in test2:
    print(i)

print("-------Test3-------")
test3 = Fib(1)
for i in test3:
    print(i)

# Invoke Doctest when run at the command line
doctest.run_docstring_examples(Fib, globals(), verbose=True, name="Fib")

if __name__ == "__main__":
    import doctest
    # Import the doctest module to do the tests within the __doc__ section
    # Run when imported as a module
    doctest.testmod()
