const titleize = (array, callback) => {
    new_array = array.map((el) => {
        new_el = el[0].toUpperCase() + el.slice(1, el.length).toLowerCase();
        return `Mx. ${new_el} Jingleheimer Schmidt`;
    })
    new_array.forEach((el)=> {callback(el)})
}

const printCallback = (el) => {console.log(el)}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback))

function Elephant(name, height, tricks) {
    this.name = name
    this.height = height
    this.tricks = tricks
}

// prototype functions

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function () {
    this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
  }

Elephant.prototype.play = function () {
    let trick = this.tricks[getRandomInt(0, this.tricks.length)]
    console.log(`${this.name} is ${trick}!`)
}

// maurice = new Elephant("maurice", 67, ["jumping in mud"])


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
    console.log(`${elephant.name} is trotting by!`);
}

// herd.forEach(el => Elephant.paradeHelper(el));

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);
  
    return function (food) {
      order = `${order.slice(0, order.length - 8)} and ${food} please.`;
      console.log(order);
    };
  };