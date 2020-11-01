window.addEventListener('load', function(){

  const borderChange1 = document.getElementById("1")
  const borderChange1 = document.getElementById("2")
  const borderChange1 = document.getElementById("3")

  borderChange1.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange1.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

  borderChange2.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange2.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

  borderChange3.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange3.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

})