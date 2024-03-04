class ValidadorCPF {
    constructor(cpf) {
      this.cpf = cpf.replace(/\D/g, "");
    }
  
    ehValido() {
      if (this.cpf.length !== 11) {
        return false;
      }
  
      if (this.cpf === "00000000000" || this.cpf === "11111111111" || this.cpf === "22222222222" || this.cpf === "33333333333" || this.cpf === "44444444444" || this.cpf === "55555555555" || this.cpf === "66666666666" || this.cpf === "77777777777" || this.cpf === "88888888888" || this.cpf === "99999999999") {
        return false;
      }
  
      let soma = 0;
  
      for (let i = 0; i < 9; i++) {
        soma += (10 - i) * this.cpf[i];
      }
  
      let resto = soma % 11;
  
      if (resto === 10) {
        resto = 0;
      }
  
      if (resto !== this.cpf[9]) {
        return false;
      }
  
      soma = 0;
  
      for (let i = 0; i < 10; i++) {
        soma += (11 - i) * this.cpf[i];
      }
  
      resto = soma % 11;
  
      if (resto === 10) {
        resto = 0;
      }
  
      if (resto !== this.cpf[10]) {
        return false;
      }
  
      return true;
    }
  
    ehValidoRegex() {
      return this.cpf.match(/^[0-9]{11}$/) !== null;
    }
  }
  
  const cpf = "12345678901";
  
  const validador = new ValidadorCPF(cpf);
  
  console.log(`CPF ${cpf} é válido? ${validador.ehValido()}`); // true
  console.log(`CPF ${cpf} é válido (regex)? ${validador.ehValidoRegex()}`); // true
  