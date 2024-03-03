// Solicita ao usuário que insira um número inteiro maior do que 1
let n = parseInt(prompt("Digite um número inteiro maior do que 1:"));

// Verifica se o número é maior que 1
if (n > 1) {
    let primo = true;

    // Verifica se o número é divisível por algum número entre 2 e n-1
    for (let i = 2; i < n; i++) {
        if (n % i === 0) {
            primo = false;
            break;
        }
    }

    // Exibe o resultado no console
    if (primo) {
        console.log(n + " é um número primo.");
    } else {
        console.log(n + " não é um número primo.");
    }
} else {
    console.log("Por favor, insira um número inteiro maior do que 1.");
}
