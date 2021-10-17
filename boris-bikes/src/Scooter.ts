
export class Scooter {
  working: boolean;

  constructor() {
    this.working = true;
  }

  reportBroken() {
    this.working = false;
  }
}
