function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

console.log(madLib('make', 'best', 'guac'));

function isSubstring(string, sub) {
  for (let i = 0; i < string.length - sub.length; i++) {
    if (sub === string.slice(i, i + sub.length)) {
      return true;
    }
  }
  return false;
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(n) {
  let result = [];
  for (let i = 1; i <= n; i++) {
    if (i % 15 !== 0 && (i % 3 === 0 || i % 5 === 0)) {
      result.push(i);
    }
  }
  return result;
}

console.log(fizzBuzz(50));

function isPrime(n) {
  if (n < 2) return false;
  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(17));
console.log(isPrime(1));
console.log(isPrime(35));

function firstNPrimes(n) {
  let primes = [];
  let i = 0
  while (primes.length < n) {
    if (isPrime(i)) primes.push(i);
    i++;
  }
  return primes;
}

console.log(firstNPrimes(10));

function sumOfNPrimes(n) {
  return firstNPrimes(n).reduce((a, b) => { return a + b; }, 0)
}

console.log(sumOfNPrimes(10));
