class Calculadora {
    constructor() {}
  
    somar(a, b) {
      return a + b;
    }
  
    subtrair(a, b) {
      return a - b;
    }
  
    multiplicar(a, b) {
      return a * b;
    }
  
    dividir(a, b) {
      if (b === 0) {
        throw new Error("Divisão por zero.");
      }
      return a / b;
    }
  
    raiz(numero) {
      if (numero < 0) {
        throw new Error("Raiz quadrada de número negativo.");
      }
      return Math.sqrt(numero);
    }
  
    fatorial(numero) {
      if (numero === 0) {
        return 1;
      }
      return numero * this.fatorial(numero - 1);
    }
  }
  
  const calculadora = new Calculadora();
  
  // Exemplos de uso
  
  console.log(`Soma de 10 e 5: ${calculadora.somar(10, 5)}`); // 15
  console.log(`Subtração de 10 e 5: ${calculadora.subtrair(10, 5)}`); // 5
  console.log(`Multiplicação de 10 e 5: ${calculadora.multiplicar(10, 5)}`); // 50
  console.log(`Divisão de 10 e 5: ${calculadora.dividir(10, 5)}`); // 2
  console.log(`Raiz quadrada de 9: ${calculadora.raiz(9)}`); // 3
  console.log(`Fatorial de 5: ${calculadora.fatorial(5)}`); // 120
  
  