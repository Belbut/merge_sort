require 'prime'

def fibs(int)
  result = [0, 1]
  (int - 2).times do
    result << result[-2..].sum
  end
  result
end

def fibs_rec(int, result = [0, 1])
  return result[0...int] if int <= 2

  fibs_rec(int - 1, result) if int > result.size + 1

  result << result[-2..].sum if int <= result.size + 1
end

def merge_sort(array)
  size = array.size
  return array if size < 2

  left_array = merge_sort(array[0...size / 2])
  right_array = merge_sort(array[size / 2..])
  result = []
  while (left_array.size + right_array.size).positive?
    case right_array[0] <=> left_array[0]
    when 0..1
      result << left_array.shift
    when -1
      result << right_array.shift
    else
      result.concat(left_array, right_array)
      break
    end
  end
  result
end

# random_array = Array.new(10) { rand(0...200) }
# p random_array
# p merge_sort(random_array)

def sum_of_multiples_of_3_5(until_int = 999)
  result = []
  (1..until_int).each { |element| result << element if (element % 3).zero? || (element % 5).zero? }
  result.sum
end

# p sum_of_multiples_of_3_5(9)

def fibonacci(int)
  return [0, 1][int] if int < 2

  fibonacci(int - 1) + fibonacci(int - 2)
end

def even_fibonacci_numbers_until(until_int)
  result = []
  i = 0

  loop do
    fib_number = fibonacci(i)
    break if fib_number >= until_int

    i += 1
    result << fib_number if fib_number.even?
  end
  result.sum
end

# p even_fibonacci_numbers_until(4_000_000)