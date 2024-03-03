//Recebendo os dados
let peso = parseFloat(prompt("Digite seu peso em kg:"));
let altura = parseFloat(prompt("Digite sua altura em metros:"));

//calculando o IMC
let imc = peso/(altura*altura);

//categoria de IMC
if (imc < 16.5) {
    console.log("Desnutrição") ;
} else if (imc >= 16.6 && imc <= 18.5) {
    console.log ("Abaixo do peso");
} else if (imc >= 18.6 && imc <= 24.9) {
    console.log ("Peso normal");
} else if (imc >= 25 && imc <= 29.9) {
    console.log ("Sobrepeso");
} else {
    console.log ("Obesidade");
}

