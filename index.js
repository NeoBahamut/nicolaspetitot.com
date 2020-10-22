const moment = require("moment");

console.log(moment().startOf("day").fromNow());

// Tester html-webpack-plugin : js -> html
const h1 = document.createElement("h1");
h1.textContent = "nicolaspetitot.com";

const h2 = document.createElement("h2");
h2.textContent = "VPS expérimental";

const p = document.createElement("p");
p.textContent =
  "VPS à usage de formation sur le projet Camino de la Fabrique Numérique";

const app = document.querySelector("#root");
app.append(h1);
app.append(h2);
app.append(p);

// Tester du code ancien
// créer une instance de classe sans constructeur
class StartUp {
  name = "camino";
}

const myStartUp = new StartUp();

const p2 = document.createElement("p");
p2.textContent = `${myStartUp.name} est top !`;

app.append(p2);
