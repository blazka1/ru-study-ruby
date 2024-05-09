module Exercise
  module Fp2
    class MyArray < Array
      def my_each
        recurse = lambda do |index|
          return if index >= size

          yield self[index]
          recurse.call(index + 1)
        end
        recurse.call(0)
        self
      end

      def my_map
        mapper = lambda do |result, index|
          return result if index >= size

          result << yield(self[index])

          mapper.call(result, index + 1)
        end

        mapper.call(MyArray.new, 0)
      end

      def my_compact
        compact_recursively = lambda do |index, accum|
          return MyArray.new(accum) if index == size

          current_element = self[index]
          next_accum = current_element.nil? ? accum : accum + [current_element]

          compact_recursively.call(index + 1, next_accum)
        end

        compact_recursively.call(0, [])
      end

      def my_reduce(acc = nil, index = 0, &block)
        raise ArgumentError, 'no block given' unless block_given?

        if acc.nil? && !empty?
          acc = self[0]
          index = 1
        end

        return acc if index >= size

        my_reduce(yield(acc, self[index]), index + 1, &block)
      end
    end
  end
end
