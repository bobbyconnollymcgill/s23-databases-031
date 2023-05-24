function makeSupermarket() {
  let moneyInCashRegister = 1000;
  let inventory = ["potatoes", "wine", "soup", "carrots", "parsley"];

  return {
    buyFood: function (food, cost) {
      if (!inventory.includes(food)) {
        throw "we're sorry, we don't have that food";
      }

      inventory = inventory.filter((e) => e !== food);

      moneyInCashRegister += cost;
    },

    report: function () {
      console.log({
        moneyInCashRegister,
        inventory,
      });
    },
  };
}

class Supermarket {
  constructor() {
    this.moneyInCashRegister = 1000;
    this.inventory = ["soup"];
  }

  buyFood() {}

  aquireFood(newFood) {
    this.inventory.push(newFood);
  }

  report() {}
}

const supermarket = new Supermarket();

supermarket.report();

supermarket.buyFood("potatoes", 9);

supermarket.report();

supermarket.aquireFood("celery");
