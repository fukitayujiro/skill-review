window.addEventListener('load', function(){

  const colorChange = document.getElementById("1")

  colorChange.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })

  colorChange.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

})