//recebendo dois números
let num1 = prompt("Digite o primeiro número: ");
let num2 = prompt("Digite o segundo número: ");
let operacao = prompt("Digite de 1 à 4 sendo: 1 - Soma, 2 - Subtração, 3 - Multiplicar, 4 - Dividir");

//processamento das operações
switch (operacao) {
    case 1:
        console.log("Resultado da Soma:", num1 + num2);
        break;
    case 2:
        console.log("Resultado da Subtração:", num1 - num2);
        break;
    case 3:
        console.log("Resultado da Multiplicação:", num1 * num2);
        break;
    case 4:
        if (num2 !== 0) {
            console.log("Resultado da Divisão:", num1 / num2);
        } else {
            console.log("Não é possível dividir por zero.");
        }
        break;
    default:
        console.log("Opção inválida. Escolha uma operação de 1 a 4.");
}
