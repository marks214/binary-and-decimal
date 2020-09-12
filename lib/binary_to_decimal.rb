# A method named `binary_to_decimal` that receives as input an array of size 8.
# The array is randomly filled with 0’s and 1’s.
# The most significant bit is at index 0.
# The least significant bit is at index 7.
# Calculate  and return the decimal value for this binary number using
# the algorithm you devised in class.

def binary_to_decimal(binary_array)
    #check that the given input is of the correct data type:
    return "empty array" if binary_array.empty? == true
    return "incorrect data type" if binary_array[0].class != Integer
    # max_exponent figures out the max power/exponent for each base relative to the length of the given array (not assuming length 8)
    #e.g., if you were given an array of length 4, then the max power would be 3
    max_exponent = binary_array.length - 1
    #each_exponent creates an array of descending exponents to be used with each base in the iteration block
    #e.g., an array of length 8 would have exponents of [7, 6, 5, 4, 3, 2, 1, 0]
    each_exponent = (0..max_exponent).to_a.reverse!
    decimal_value = 0

    # do math (sum exponentiated array values)
    binary_array.each_with_index do |element, index|
      decimal_value += (element * 2 ** each_exponent[index])
    end

    #return converted value
    return decimal_value
end

# decimal_to_binary takes an integer and converts it an arrayed version
# of its corresponding binary number (each integer will be comma separated)
def decimal_to_binary(number)
    #check that the given input is of the correct data type
    return "error" if number.class != Integer
    binary_array = []

    # fill binary array with remainder values until constraint is met
    # this works because with integer division 1/2 = 0
    while number > 0 do
        binary = number % 2
        binary_array << binary
        number = number / 2
    end
    #reverse the order and return the array
    binary_array = binary_array.reverse!
    return binary_array
end
