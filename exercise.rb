class Exercise
  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # Map each word through the transformation and join back with spaces
    str.split.map do |word|
      # Extract the word without punctuation to check its length
      word_only = word.gsub(/[^a-zA-Z]/, '')
      
      if word_only.length > 4
        # Determine if we need capital or lowercase marklar
        replacement = word_only[0] =~ /[A-Z]/ ? 'Marklar' : 'marklar'
        
        # Preserve any punctuation that might be attached to the word
        # by replacing just the alphabetic part
        word.gsub(/[a-zA-Z]+/, replacement)
      else
        word
      end
    end.join(' ')
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # Handle edge cases
    return 0 if nth <= 0
    return 0 if nth <= 2  # First two terms (1,1) are not even
    
    # Initialize Fibonacci sequence
    fib = [1, 1]
    sum_even = 0
    
    # Generate Fibonacci sequence up to nth term
    while fib.length < nth
      next_fib = fib[-1] + fib[-2]
      fib << next_fib
      sum_even += next_fib if next_fib.even?
    end
    
    sum_even
  end
  
  # Alternative implementation with better performance for large nth values
  def self.even_fibonacci_optimized(nth)
    return 0 if nth <= 0
    
    a, b = 1, 1
    sum_even = 0
    
    # Only generate up to n-2 more terms (since we start with 2 terms)
    (nth - 2).times do
      a, b = b, a + b
      sum_even += b if b.even?
    end
    
    sum_even
  end
end