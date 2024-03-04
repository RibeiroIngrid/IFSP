class NumerosPrimos {
    constructor() {}
  
    contaPrimos(inicio, fim) {
      if (inicio > fim) {
        throw new Error("O primeiro número deve ser menor que o segundo.");
      }
  
      let quantidadePrimos = 0;
  
      for (let i = inicio; i <= fim; i++) {
        if (this.Primo(i)) {
          quantidadePrimos++;
        }
      }
  
      return quantidadePrimos;
    }
  
    Primo(numero) {
      if (numero <= 1) {
        return false;
      }
  
      for (let i = 2; i <= Math.sqrt(numero); i++) {
        if (numero % i === 0) {
          return false;
        }
      }
  
      return true;
    }
  }
  
  const obj = new NumerosPrimos();
  
  const x = obj.contaPrimos(5, 20);
  
  console.log(`Quantidade de números primos entre 5 e 20: ${x}`); // 6
  