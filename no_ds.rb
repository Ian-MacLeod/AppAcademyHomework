def window_range(arr, window_size)
  left_maxes = []
  left_mins = []
  arr.each_with_index do |el, idx|
    if idx % window_size == 0
      left_maxes << el
      left_mins << el
    else
      left_maxes << [left_maxes.last, el].max
      left_mins << [left_mins.last, el].min
    end
  end

  right_maxes = []
  right_mins = []
  arr.zip(0...arr.length).reverse.each do |el, idx|
    if idx % window_size == 0 || idx == arr.length - 1
      right_maxes << el
      right_mins << el
    else
      right_maxes << [right_maxes.last, el].max
      right_mins << [right_mins.last, el].min
    end
  end
  right_maxes.reverse!
  right_mins.reverse!

  max_range = 0
  (arr.length - window_size + 1).times do |idx|
    max = [left_maxes[idx + window_size - 1], right_maxes[idx]].max
    min = [left_mins[idx + window_size - 1], right_mins[idx]].min
    max_range = max - min if max - min > max_range
  end

  max_range
end
