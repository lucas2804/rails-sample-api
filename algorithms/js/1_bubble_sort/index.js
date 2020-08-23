function swap(array, j) {
  let temp = array[j];
  array[j] = array[j + 1];
  array[j + 1] = temp;
}

function bubbleSort(array) {
  let max = array.length - 1;
  for (let i = max; i > 0; i--) {
    for (let j = 0; j < i; j++) {
      if (array[j] > array[j + 1]) {
        swap(array, j)
      }
    }
  }
  console.log(array);
  return array;
}


bubbleSort([2, 4, 1, 3, 7]);

// Bubble the max value to the bottom O(N^2)
