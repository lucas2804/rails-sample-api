function swap(arr, i, j) {
  let temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

function mini_max_sum(arr) {
  let hash = {};
  for (let i = 0; i < arr.length; i++) {
    let value = arr[i];
    if (hash[value] === undefined) {
      hash[value] = 1;
    } else {
      hash[value] += 1;
    }
  }
  let max = 0;
  Object.keys(hash).forEach(function (key) {
    if (max <= hash[key]) {
        max = hash[key]
    }
  });
  return max;
}

arr = [3, 2, 1, 3];
mini_max_sum(arr);
