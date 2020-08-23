function grading_students(grades) {
  for (let i = 0; i < grades.length; i++) {
    if (grades[i] >= 38) {
      if (grades[i] % 5 >= 3){
        grades[i] = grades[i] - (grades[i] % 5) + 5
      }
    }
  }
  
  return grades;
}

grading_students([ 73, 67, 38, 33 ]);


