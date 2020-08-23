function time_conversion(str) {
  let signal = `${str[(str.length - 2)]}${str[(str.length - 1)]}`;
  str = str.substring(0, str.length - 2);
  let the_bot_one = str.substring(2, str.length);
  let the_top_one = str.substring(0, 2);
  
  the_top_one = parseInt(the_top_one);
  if (signal === 'PM') {
    if (the_top_one < 12) {
      the_top_one = the_top_one + 12;
    }
  } else {
    if (the_top_one === 12) {
      the_top_one = the_top_one - 12;
    }
    
    if (the_top_one < 12) {
      the_top_one = `0${the_top_one}`
    }
  }
  
  return `${the_top_one}${the_bot_one}`
}

time_conversion('07:05:45PM'); // 19:05:45
time_conversion('05:05:45AM'); //  05:05:45
time_conversion('12:45:54PM'); //  12:45:54
time_conversion('12:00:00AM'); //  00:00:00
