// Formas de crear la secuencia Fibonacci

// Calculamos los numeros y los añadimos al array
function fibonacci(n) {
  const cache = []
  for (let i = 0; i < n; i++) {
    if (cache.length < 2) {
      cache.push(i)
    } else {
      cache.push(cache[i - 1] + cache[i - 2])
    }
  }
  return cache
}

// Calculamos los numeros y los modificamos en el array
function fibonacci2(n) {
  if (n <= 0) return []
  const cache = new Array(n)
  cache[0] = 0
  if (n > 1) cache[1] = 1
  for (let i = 2; i < n; i++) {
    cache[i] = cache[i - 1] + cache[i - 2]
  }
  return cache
}

//Calculamos los numeros de forma recursiva y los modificamos en el array
function fibonacci3(n) {
  function fiboNum(num) {
    if (num < 2) return num
    return fiboNum(num - 1) + fiboNum(num - 2)
  }
  const cache = new Array(n)
  for (let i = 0; i < n; i++) {
    cache[i] = fiboNum(i)
  }
  return cache
}

const r1 = fibonacci(9)
const r2 = fibonacci2(9)
const r3 = fibonacci3(9)

console.log(r1)
console.log(r2)
console.log(r3)

// Esto seria un comentari

