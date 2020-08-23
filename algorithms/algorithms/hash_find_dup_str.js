function hasDuplicateValue(array) {
  // O(N^2)
  for (var i = 0; i < array.length; i++) {
    for (var j = 0; j < array.length; j++) {
      if (i !== j && array[i] == array[j]) {
        return true;
      }
    }
  }
  return false;
}

// Hash solution
function hasDuplicateValueWithHash(array) {
  var existingValues = {};
  for (var i = 0; i < array.length; i++) {
    if (existingValues[array[i]] === undefined) {
      existingValues[array[i]] = 1;
    } else {
      return true;
    }
  }
  return false;
}
function solution(...arrays) {
  var existingValues = {};
  for (var i = 0; i < arrays.length; i++) {
    if(arrays[i][0] == '[') {
      for (var j = 0; j < arrays[i].length; i++) {
        if (existingValues[arrays[j]] === undefined) {
          existingValues[arrays[j]] = 1;
        } else {
          return true;
        }
      }
    } else{
      if (existingValues[arrays[i]] === undefined) {
        existingValues[arrays[i]] = 1;
      } else {
        return true;
      }
    }
  }
  return false;
}


var result = solution([
  'animal/mammal/dog',
  'animal/mammal/cat/tiger',
  'animal/mammal/cat/lion',
  'animal/mammal/elephant',
  'animal/reptile',
  'plant/sunflower'
]);

var expected = {
  animal: {
    mammal: {
      dog: true,
      cat: {
        tiger: true,
        lion: true
      },
      elephant: true
    },
    reptile: true
  },
  plant: {
    sunflower: true
  }
};

assert.deepEqual(result, expected);


Object.defineProperty(Object.prototype, 'getNestedProp', {
  value: function(desc) {
    var obj = this;
    var arr = desc.split(".");
    while(arr.length && (obj = obj[arr.shift()]));
    return obj;
  },
  enumerable: false
});

Object.defineProperty(Object.prototype, 'setNestedProp', {
  value: function(desc, value) {
    var obj = this;
    var arr = desc.split(".");
    var last = arr.pop();
    while(arr.length && (obj = obj[arr.shift()]));
    
    obj[last] = value;
  },
  enumerable: false
});

var a = { values: [{ value: 'LucDang' }] };
var b = { one: { two: 'foo' } };

a.setNestedProp('values.0.value', b.getNestedProp('one.two'));
console.log(a.values[0].value); // foo
a.getNestedProp('values.0') // { value: undefined }

var a = 'animal.mammal.dog';
var b = 'animal.mammal.cat.tiger';


