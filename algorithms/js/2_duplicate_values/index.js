function hasDuplicateValue(array) {
  let is_duplicated = false;
  let max = array.length - 1;
  let hash = {};
  for (let i = 0; i <= max; i++) {
    console.log(hash);
    if (hash[array[i]] === undefined) {
      hash[array[i]] = 1;
    } else {
      console.log(`${array} has duplicate value`);
      is_duplicated = true;
      break;
    }
  }
  return is_duplicated;
}


hasDuplicateValue([2, 4, 1, 2]);
// { "2": 1 }
// { "2": 1, "4": 1 }
// { "1": 1, "2": 1, "4": 1 }
