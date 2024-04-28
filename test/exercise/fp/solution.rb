module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        valid_films = _array.select do |film|
          countries = film['country'].split(',') if film['country']
          film['rating_kinopoisk'].to_f.positive? && countries && countries.size > 1
        end

        ratings = valid_films.map { |film| film['rating_kinopoisk'].to_f }

        if ratings.size.positive?
          ratings.reduce(0.0) { |sum, rating| sum + rating } / ratings.size
        else
          0
        end
      end

      def chars_count(_films, _threshold)
        kinopoisk_list = _films.select do |film|
          film['rating_kinopoisk'].to_f >= _threshold
        end

        kinopoisk_list.reduce(0) do |sum, film|
          sum + film['name'].count('и')
        end
      end
    end
  end
end
