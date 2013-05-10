# window.app makes a global variable called 'app'. The window does this.
# this is so we can access this from anywhere. if it's not global, you can't get to it
#
# code,city,country,lat,lon
# code: "RIO", lat_x: -22.90, long_y: -43.24
# code: "YTO", lat_x: 43.64, long_y: -79.40


window.app =
  ready: ->
    # console.log(jsonCities)
    app.draw_circles()


  draw_circles: ->
    jsonCities = [
      code: "RIO"
      city: "Rio de Janeiro"
      country: "Brazil"
      lat_x: 30
      lat_y: 30
      radius: 20
      color: "green"
    ,
      code: "YTO"
      city: "Toronto"
      country: "Canada"
      lat_x: 70
      lat_y: 70
      radius: 20
      color: "purple"
    ]
    svg = d3.select('body').append('svg')
    g = svg.append('g')
    # load and display the cities
    g.selectAll('circle')
      .data(jsonCities.nodes)
      .enter().append("circle")
      .attr("cx", (d) -> d.lat_x)
      .attr("cy", (d) -> d.lat_y)
      .attr("r", (d) -> d.radius)
      # .attr("name", (d) -> d.code)
      .style("fill", (d) -> d.color)
      .append("text")
        .attr("text-anchor", "middle")
        .text((d) -> d.city)


 #  # Define the data for the circles

 # elem = svg.selectAll("g myCircleText").data(json.nodes)

 #  #Create and place the "blocks" containing the circle and the text
 #  elemEnter = elem.enter().append("g").attr("transform", (d) ->
 #    "translate(" + d.x + ",80)"
 #  )

 #  #Create the circle for each block
 #  circle = elemEnter.append("circle").attr("r", (d) ->
 #    d.r
 #  ).attr("stroke", "black").attr("fill", "white")

 #  # Create the text for each block
 #  elemEnter.append("text").attr("dx", (d) ->
 #    -20
 #  ).text (d) ->
 #    d.label












$(document).ready(app.ready)
