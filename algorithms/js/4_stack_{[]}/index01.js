// Linter.new.lint('( var x = { y: [1, 2, 3] } )')
// Linter.new.lint('( var x = { y: [1, 2, 3] ')

function isOpenedCharacter(char) {
  let validChars = ['{', '(', '['];
  return validChars.includes((char));
}

function isClosedCharacter(char) {
  // let validChars = ['{', '}', '(', ')', '[', ']'];
  let validChars = ['}', ')', ']'];
  return validChars.includes((char));
}

function isCouple(openedChar, closedChar) {
  let coupleArray = ['{}', '[]', '()'];
  let comparedStr = openedChar + closedChar;
  
  return coupleArray.includes(comparedStr)
}

function lintValid(str) {
  let stack = [];
  str = str.split('/');
  let max = str.length - 1;
  let isLintValid = false;
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


lintValid('/test/../test/../test/../test/../a/b/c/..');
lintValid('/a/b/c/d/../c/d/a/b');
