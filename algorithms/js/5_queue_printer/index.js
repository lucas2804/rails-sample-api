class Printer {
  constructor() {
    this.queue = [];
  }
  
  queue_job(str) {
    this.queue.push(str);
  }
  
  print() {
    this.queue.forEach((str) => { console.log(str) })
  }
}


printer = new Printer();
printer.queue_job('1st');
printer.queue_job('2rd');
printer.queue_job('3nd');

printer.print(); // 1st 2st 3nd
