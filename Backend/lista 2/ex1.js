
class Cliente {
    constructor(nome, endereco, cep, cpf) {
      this._nome = nome;
      this._endereco = endereco;
      this._cep = cep;
      this._cpf = cpf;
  
      this._validarDados();
    }
  
    // Métodos de acesso (getters e setters)
    get nome() {
      return this._nome;
    }
  
    set nome(novoNome) {
      this._nome = novoNome;
      this._validarNome();
    }
  
    get endereco() {
      return this._endereco;
    }
  
    set endereco(novoEndereco) {
      this._endereco = novoEndereco;
    }
  
    get cep() {
      return this._cep;
    }
  
    set cep(novoCep) {
      this._cep = novoCep;
      this._validarCep();
    }
  
    get cpf() {
      return this._cpf;
    }
  
    set cpf(novoCpf) {
      this._cpf = novoCpf;
      this._validarCpf();
    }
  
    // Métodos de validação
    _validarNome() {
      if (!this._nome || this._nome.length === 0) {
        throw new Error("Nome inválido!");
      }
    }
  
    _validarEndereco() {
      if (!this._endereco || this._endereco.length === 0) {
        throw new Error("Endereço inválido!");
      }
    }
  
    _validarCep() {
      const regexCep = /^\d{5}-\d{3}$/;
      if (!regexCep.test(this._cep)) {
        throw new Error("CEP inválido!");
      }
    }
  
    _validarCpf() {
      const regexCpf = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/;
      if (!regexCpf.test(this._cpf)) {
        throw new Error("CPF inválido!");
      }
    }
  
    // Exibir dados na tela
    exibirDados() {
      console.log(`Nome: ${this._nome}`);
      console.log(`Endereço: ${this._endereco}`);
      console.log(`CEP: ${this._cep}`);
      console.log(`CPF: ${this._cpf}`);
    }
  }
  
  // Exemplo de uso
  const cliente1 = new Cliente(
    "João Silva",
    "Rua das Flores, 123",
    "12345-678",
    "123.456.789-00"
  );
  
  cliente1.exibirDados();
  