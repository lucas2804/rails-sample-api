function swap(array, x, y) {
  let temp = array[x];
  array[x] = array[y];
  array[y] = temp;
}

function selectionSort(array) {
  let max = array.length - 1;
  let lowest_index = 0;
  for (let i = 0; i < max; i++) {
    for (let j = i; j < max; j++) {
      if (array[j] > array[j + 1]) {
        lowest_index = j + 1;
      }
    }
    
    swap(array, i, lowest_index);
    console.log(array)
  }
  return array
}


selectionSort([2, 4, 1, 3, 7]);
// [ 1, 4, 2, 3, 7 ]
// [ 1, 2, 4, 3, 7 ]
// [ 1, 2, 3, 4, 7 ]
// [ 1, 2, 3, 4, 7 ]

// Loop through the array, select the max position
// Then swap only once
// So O(N)
