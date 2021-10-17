export interface IBike {
  working: boolean;
  reportBroken: () => void;
}

export class Bike {
  working: boolean;

  constructor() {
    this.working = true;
  }

  reportBroken() {
    this.working = false;
  }
}
