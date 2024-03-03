// Solicita ao usuário que insira um número inteiro não negativo
let numero = parseInt(prompt("Digite um número inteiro não negativo:"));

if (numero >= 0) {
    let resultado = 1;

    // Calcula o fatorial utilizando um loop
    for (let i = 1; i <= numero; i++) {
        resultado = resultado * i;
    }

    // Exibe o resultado no console
    console.log("O fatorial de " + numero + " é: " + resultado);
} else {
    console.log("Por favor, insira um número inteiro não negativo.");
}
