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
  let max = str.length - 1;
  let isLintValid = false;
  for (let i = 0; i <= max; i++) {
    if (isOpenedCharacter(str[i])) {
      stack.push(str[i])
    }
    
    if (isClosedCharacter(str[i])) {
      let lastChar = stack[stack.length - 1];
      if (isCouple(lastChar, str[i])) {
        stack.pop()
      } else {
        isLintValid = false;
        break
      }
    }
  }
  
  if (stack.length === 0) {
    isLintValid = true;
  } else {
    isLintValid = false;
  }
  
  return isLintValid
}

lintValid('( var x = { y: [1, 2, 3] } )');
lintValid('( var x = { y: [1, 2, 3] ');
