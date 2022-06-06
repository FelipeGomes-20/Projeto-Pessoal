/* <!--  funções do site (botões etc) --> */

function userFunction() {

  MenuUserI = document.getElementById("menu_usuario")

  if (MenuUserI.style.display == "none") {
    MenuUserI.style.display = "flex"
  } else {
    MenuUserI.style.display = "none"
  }
}