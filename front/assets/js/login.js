const form = document.getElementById('myForm');

form.addEventListener('submit', function(event) {
    const password = getPwdInputs();
    if (password[0] !== password[1]){
        event.preventDefault();
    }
})

function getPwdInputs() {
    const ary = [];
    const inputs = document.getElementsByTagName("input");
    for (let i=0; i<inputs.length; i++) {
        if (inputs[i].type.toLowerCase() === "password") {
            ary.push(inputs[i].value);
        }
    }
    return ary;
}