window.addEventListener('load', function(){

  const borderChange1 = document.getElementById("1")

  borderChange1.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange1.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

})