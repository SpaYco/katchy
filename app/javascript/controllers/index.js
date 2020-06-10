window.hamburgerBtn = function(){
    let navPosition = document.getElementsByTagName("nav")[0].style.left
    if (navPosition != "-90vw") {
        document.getElementsByTagName("nav")[0].style.left = "-90vw";
        document.getElementById("menu-btn").style.right = "-52px";
        

    }else{
        document.getElementsByTagName("nav")[0].style.left = 0;
        document.getElementById("menu-btn").style.right = "2px";
    }
}
