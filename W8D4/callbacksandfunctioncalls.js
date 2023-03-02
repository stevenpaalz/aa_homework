// window.setTimeout(function () {alert('HAMMERTIME')}, 5000)

// function hammertime(time) {
//     window.setTimeout(function () {
//         alert(`${time} is hammertime!`), time
//     })
// }

const { read } = require('fs');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function sometea() {
    reader.question('Would you like some tea?', (res)=> {
        // const first = res;
        console.log(`You replied with ${res}`);
        reader.question('Would you like some biscuits?', (res2) => {
            // const second = res2;
            console.log(`You replied with ${res2}`);
            const first = translateAnswer(res)
            const second = translateAnswer(res2)
            console.log(`So you ${first} want tea and you ${second} want coffee`)
            reader.close();
        })
    })
    
}

function translateAnswer(str) {
    if (str.toLowerCase() === "yes") {return "do";}
    else { return "don't"}
}

// sometea()


function Cat () {
    this.name = 'Markov';
    this.age = 3;
  }
  
  function Dog () {
    this.name = 'Noodles';
    this.age = 4;
  }
  
  Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
  };
  
  const Markov = new Cat ();
  const Noodles = new Dog ();

// Noodles.chase(Markov);

// Noodles.chase.call(Markov, Noodles);

Noodles.chase.apply(Markov, [Noodles]);