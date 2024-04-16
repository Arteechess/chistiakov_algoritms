let input = document.querySelector('.input');
let power = "";

function insert(num) {
    if (input.textContent === "0") {
        input.textContent = "";
    }
    input.textContent += num;
}

function clean() {
    input.textContent = "0";
    power = "";
}

function back() {
    let exp = input.textContent;
    input.textContent = exp.substring(0, exp.length - 1) || "0";
}

function calculatePower(num, pow) {
    let result = 1;
    for (let i = 0; i < pow; i++) {
        result *= num;
    }
    return result;
}

function equal() {
    let exp = input.textContent;
    if (exp.includes('^')) {
        let [base, exponent] = exp.split('^');
        let num = parseFloat(base);
        let pow = parseFloat(exponent);
        input.textContent = calculatePower(num, pow);
        power = "";
        return;
    }
    if (exp) {
        input.textContent = Function('"use strict";return (' + exp + ')')();
    }
}

function percent() {
    input.textContent = parseFloat(input.textContent) / 100;
}

function constant(name) {
    if (input.textContent === "0") {
        input.textContent = "";
    }
    if (name === "pi") {
        input.textContent += Math.PI.toFixed(8);
    }
    if (name === "e") {
        input.textContent += Math.E.toFixed(8);
    }
}

function operation(name) {
    let num = parseFloat(input.textContent);
    if (name === "sqrt") {
        input.textContent = Math.sqrt(num);
    }
    if (name === "sqr") {
        input.textContent = Math.pow(num, 2);
    }
    if (name === "^-1") {
        input.textContent = Math.pow(num, -1);
    }
    if (name === "^") {
        power = input.textContent;
        input.textContent += "^";
    }
}

function factorial(n) {
    return (n !== 1) ? n * factorial(n - 1) : 1;
}

function fact() {
    input.textContent = factorial(parseFloat(input.textContent));
}

function log(name) {
    let num = parseFloat(input.textContent);
    if (name === 'lg') {
        input.textContent = Math.log10(num).toFixed(8);
    }
    if (name === 'ln') {
        input.textContent = Math.log(num).toFixed(8);
    }
}

document.querySelector('.type').addEventListener('click', function() {
    if (document.querySelector('.type').textContent === "deg") {
        this.textContent = "rad";
        console.log('Градусы')
    } else if (document.querySelector('.type').textContent === "rad") {
        this.textContent = "deg";
        console.log('Радианы')
    }
});

function f(name) {
    if (name == 'sin') {
        if(document.querySelector('.type').textContent == "deg") {
            // Если режим градусов
            input.textContent = parseFloat(Math.sin(eval(input.textContent) / 180 * Math.PI).toFixed(8).toString());
        } else {
            // Если режим радианов
            input.textContent = parseFloat(Math.sin(eval(input.textContent)).toFixed(8).toString());
        }        
    }
    if (name == 'cos') {
        if(document.querySelector('.type').textContent == "deg") {
            // Если режим градусов
            input.textContent = parseFloat(Math.cos(eval(input.textContent) / 180 * Math.PI).toFixed(8).toString());
        } else {
            // Если режим радианов
            input.textContent = parseFloat(Math.cos(eval(input.textContent)).toFixed(8).toString());
        } 
    }
    if (name == 'tan') {
        if(document.querySelector('.type').textContent == "deg") {
            // Если режим градусов
            input.textContent = parseFloat(Math.tan(eval(input.textContent) / 180 * Math.PI).toFixed(8).toString());
        } else {
            // Если режим радианов
            input.textContent = parseFloat(Math.tan(eval(input.textContent)).toFixed(8).toString());
        }  
    }
    if (name == 'ctg') {
        if(document.querySelector('.type').textContent == "deg") {
            // Если режим градусов
            input.textContent = parseFloat(1/Math.tan(eval(input.textContent) / 180 * Math.PI).toFixed(8).toString());
        } else {
            // Если режим радианов
            input.textContent = parseFloat(1/Math.tan(eval(input.textContent)).toFixed(8).toString());
        } 
    }
}