def bubble_sort(arr)
  max = arr.length - 1
  for i in 0..max
    for j in 0..(max - i - 1)
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if arr[j] > arr[j + 1]
    end
  end

  arr
end

bubble_sort([3, 8, 2, 9, 1])


