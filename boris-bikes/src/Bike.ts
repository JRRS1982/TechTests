export class Bike {  
  working: boolean;

  constructor() {
    this.working = true;
  }

  reportBroken() {
    this.working = false;
  }
}
