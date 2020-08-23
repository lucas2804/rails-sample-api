function add(x, y = null) {
  if (arguments.length === 2) {
    return x + y;
  } else {
    return function (y) {
      return x + y;
    };
  }
}
