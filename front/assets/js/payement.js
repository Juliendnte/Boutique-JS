document.getElementById('myForm').addEventListener('submit', function() {
    const watches = localStorage.getItem("panier")
    document.cookie = "panier=" + (watches || "") + "; path=/";
});
