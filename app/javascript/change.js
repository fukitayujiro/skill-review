window.addEventListener('load', function(){

  const borderChange1 = document.getElementById("1")
  const borderChange2 = document.getElementById("2")
  const borderChange3 = document.getElementById("3")
  const borderChange4 = document.getElementById("4")
  const borderChange5 = document.getElementById("5")

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

  borderChange4.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange4.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })
  
  borderChange5.addEventListener('mouseover', function(){
    this.setAttribute("style", "border-bottom:1px solid;")
  })
  borderChange5.addEventListener('mouseout', function(){
    this.removeAttribute("style", "border-bottom:1px solid;")
  })

})