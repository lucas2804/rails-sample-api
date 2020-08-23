function stackf(str) {
  let stack = [];
  str = str.split('/');
  let max = str.length - 1;
  for (let i = 0; i <= max; i++) {
    if (str[i] !== '') {
      stack.push(str[i])
    }
    
    if (str[i] === '..') {
      stack.pop();
      stack.pop();
    }
  }
  
  console.log(stack);
  stack = `/${stack.join('/')}/`;
  return stack;
}


function solution(queries) {
  let curr = '';
  let result = [];
  for (let i = 0; i < queries.length; i++) {
    let cmd = queries[i].split(' ')[0];
    if (cmd === 'cd') {
      let value = queries[i].split(' ')[1];
      if (value[0] === '/') {
        curr = `${value}`;
      } else {
        curr = `${curr}/${value}`;
      }
    } else {
      let stack = stackf(curr);
      result.push(stack)
    }
  }
  if (result[0] === '//') {
    result[0] = '/'
  }
  console.log(result);
  return result
}

solution(['pwd', 'cd /asd', 'pwd', 'cd /xsa', 'pwd']);
solution(['cd /a/b/c/d', 'pwd', 'cd ../c/d/a/b', 'pwd']);
solution(['cd /test/../test/../test/../test/../a/b/c/..', 'pwd']);
solution(['pwd', 'cd /xgztbykka', 'pwd', 'cd /gia/kxfls', 'pwd']);


