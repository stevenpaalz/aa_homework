function madLib(verb, adjective, noun) {
    console.log(`We shall ${verb} the ${adjective} ${noun}`.toUpperCase());
}

// madLib('make', 'best', 'guac');

function isSubstring(subString, searchString) {
    return subString.includes(searchString);
}

// console.log(isSubstring("time to program", "time"))
// console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(array) {
    let newArray = [];
    array.forEach(num => {
        if ((num % 3 === 0) ^ (num % 5 === 0)) {
            newArray.push(num);
        }
    });
    return newArray;
}

// console.log(fizzBuzz([1,2,3,4,5]))
// console.log(fizzBuzz([9,12,15,20]))
// console.log(fizzBuzz([15, 30, 45]))

function isPrime(number) {
    if (number < 2) {
        return false; 
    }
    for (let i = 2; i < number; i ++) {
        if (number % i === 0) {
            return false;
        }
    }
    return true;
}

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

function sumOfNPrimes(n) {
    let sum = 0;
    let primes = firstNPrimes(n);
    for (const num of primes) {
        sum += num;
    }
    return sum;
}

function firstNPrimes(n) {
    let primes = []
    let i = 2
    while (primes.length < n) {
        if (isPrime(i)) {
            primes.push(i);
        }
        i ++;
    }
    return primes;
}

console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))