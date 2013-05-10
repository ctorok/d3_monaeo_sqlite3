# window.app makes a global variable called 'app'. The window does this.
# this is so we can access this from anywhere. if it's not global, you can't get to it
#
# code,city,country,lat,lon
# code: "RIO", lat_x: -22.90, long_y: -43.24
# code: "YTO", lat_x: 43.64, long_y: -79.40


window.app =
  ready: ->
    # console.log(jsonCities)
    app.draw_arc()
    app.draw_circles()

  draw_arc: ->
    vis = d3.select('body').append('svg')
    pi = Math.PI

    arc = d3.svg.arc()
      .innerRadius(110)
      .outerRadius(107)
      .startAngle(-45 * (pi/180)) #converting from degs to radians
      .endAngle(15 * (pi/180))

    vis.append('path')
      .attr("d", arc)
      .attr("transform", "translate(200,200)")


  draw_circles: ->
    jsonCities = [
      code: "RIO"
      city: "Rio de Janeiro"
      country: "Brazil"
      lat_x: 120
      lat_y: 120
      radius: 15
      color: "green"
    ,
      code: "YTO"
      city: "Toronto"
      country: "Canada"
      lat_x: 230
      lat_y: 95
      radius: 12
      color: "purple"
    ]


    svg = d3.select('body').select('svg')

    elem = svg.selectAll("g myCircleText").data(jsonCities)

    #Create and place the "blocks" containing the circle and the text
    elemEnter = elem.enter()
      .append("g")
      # .attr("transform", (d) -> "translate(" + d.lat_x + ",80)")
    circle = elemEnter.append("circle")
      .attr("cx", (d) -> d.lat_x)
      .attr("cy", (d) -> d.lat_y)
      .attr("r", (d) -> d.radius)
      .style("fill", (d) -> d.color)
      .append("text")
        .attr("dx", (d) -> -20)
        .text((d) -> "Hello there")






$(document).ready(app.ready)
