module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        array.map { |i| i.positive? ? max : i }
      end

      def search(arr, query, low = 0, high = arr.length - 1)
        return -1 if low > high

        mid = low + ((high - low) / 2)
        if arr[mid] == query
          mid
        elsif arr[mid] > query
          search(arr, query, low, mid - 1)
        else
          search(arr, query, mid + 1, high)
        end
      end

      def find_max(array)
        return nil if array.empty?

        max_value = array[0]
        array.each do |item|
          max_value = item if item > max_value
        end
        max_value
      end
    end
  end
end
