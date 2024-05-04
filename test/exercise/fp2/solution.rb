module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0
        while index < length
          yield self[index]
          index += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each do |element|
          result << yield(element)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each do |element|
          result << element unless element.nil?
        end
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial
        my_each do |element|
          acc = acc.nil? ? element : yield(acc, element)
        end
        acc
      end
    end
  end
end
