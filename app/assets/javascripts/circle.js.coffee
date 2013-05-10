# window.app makes a global variable called 'app'. The window does this.
# this is so we can access this from anywhere. if it's not global, you can't get to it
#
# code,city,country,lat,lon
# code: "RIO", lat_x: -22.90, long_y: -43.24
# code: "YTO", lat_x: 43.64, long_y: -79.40


window.app =


  ready: ->
    # arrarr = [a: 1, b: 2]
    console.log(arrarr)
    app.draw_circles()


  draw_circles: ->
    canvas = d3.select('body').append('svg').selectAll('circle').data([1,2])
    # canvas.selectAll('circle').data(data).enter().append("circle").attr("cx", (d) -> d.x).attr("cy", (d) -> d.y).attr "r", 2.5
    canvas.enter()
      .append("circle")
      .attr("cx", (d) -> d * 200)
      .attr("cy", (d) -> d * 100)
      .attr("r", 25)

    canvas.exit()
       .transition()
       .attr('cx', 0)
       .attr('cy', 0)
       .attr('r', 0)
       .remove()


$(document).ready(app.ready)