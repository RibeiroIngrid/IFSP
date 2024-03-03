//Recebendo os dados do cliente
let nome = prompt("Digite o nome do cliente:");
let endereco = prompt("Digite o endereço do cliente:");
let valorCompra = parseFloat(prompt("Digite o valor da compra:"));
let dataEntrega = prompt("Digite a data de entrega:");

//Exibindo os dados no console
console.log("Dados do Cliente:");
console.log("Nome: " + nome);
console.log("Endereço: " + endereco);
console.log("Valor da Compra: R$ " + valorCompra.toFixed(2));
console.log("Data de Entrega: " + dataEntrega);