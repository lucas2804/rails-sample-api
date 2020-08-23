function staircase(n) {
  for (let i = 1; i <= n; i++) {
    let str = '';
    let spaceN = n - i;
    let symbolN = i;
    for (let j = 1; j <= spaceN; j++) {
      str += ' '
    }
    
    for (let j = 1; j <= symbolN; j++) {
      str += '#'
    }
    
    console.log(str)
  }
}


staircase(6);
