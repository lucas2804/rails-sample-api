def dupValues(arr)
  hash = {}
  arr.each_with_index do |item, index|
    if hash[item]
      return true
    else
      hash[item] += 1
    end
  end

  false
end

dupValues([3, 8, 3, 9, 1])
dupValues([3, 8, 4, 9, 1])
