var clientes = [
  {
    id: 1,
    nome: "Luis Santos Silveira",
    idade: 18,
  },
  {
    id: 2,
    nome: "Ricardo Lopes Alves",
    idade: 30,
  },
  {
    id: 3,
    nome: "Gustavo Silva Junior",
    idade: 26,
  },
];

var numero = "5(1)9-876-543-21";

/*
    1) Percorra o objeto clientes e mostre o nome da cada cliente da seguinte maneira:
    “ultimoSobrenome, primeiroNome”;
*/
clientes.forEach((cliente) => {
  const names = cliente.nome.split(" ");

  console.log(names[0], names[names.length - 1]);
});

/*
    2) Formate a variável “numero” para o seguinte formato: “(XX)_X_XXXX-XXXX”;
*/

const SYMBOLS = ["+", "(", ")", "-"];

numero = numero
  .split("")
  .map((string) =>
    SYMBOLS.reduce((acc, simbol) => acc.split(simbol).join(""), string)
  )
  .join("")
  .replace(/^(\d{2})(\d)(\d{4})(\d{4}).*/, "($1) $2 $3-$4");

console.log("\n" + numero);

/*
    3) Qual a ordem dos prints no console?
        1 - Função C
        2 - Função d
        3 - alertUser("a")
    */

/*
    4) Existe algum erro nesse código? Se sim, comente sobre?

    Sim, existe um erro na "function b", pois o return da função vem primeiro que qualquer outro comando
    fazendo com que função não execute nada.
*/
