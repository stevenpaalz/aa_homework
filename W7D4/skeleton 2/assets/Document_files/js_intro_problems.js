const titleize = (array, callback) => {
    array.prototype.map((el) => {
        el = el[0].toUpperCase() + el.slice(1, el.length).toLowerCase();
        return `Mx. ${el} Jingleheimer Schmidt`;
    })
    array.forEach((el)=> {callback(el)})
}

const printCallback = (el) => {console.log(el)}

console.log(titleize(["Mary", "Brian", "Leo"], printCallback);)