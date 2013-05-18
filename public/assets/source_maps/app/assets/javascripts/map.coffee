# source: http://bost.ocks.org/mike/map/
window.app =
  ready: ->

    # app.draw_circles()
    app.draw_map()

  draw_map: ->
    width = 960
    height = 1160
    projection = d3.geo.mercator().scale(500).translate([height / 2, width / 2])
    path = d3.geo.path().projection(projection)
    svg = d3.select('body').append('svg')
    # console.log svg
    d3.json "airports.json", (error, airports) ->
    #   # console.log airports
    #  svg.append("path")
    #   .datum(topojson.feature(airports, airports.objects.subunits)).attr "d",
    #   d3.geo.path().projection(d3.geo.mercator())



  # draw_circles: ->
  #   canvas = d3.select('body').selectAll('svg').selectAll('circle').data([1,2])
  #   canvas.enter()
  #     .append("circle")
  #     .attr("cx", (d) -> d * 200)
  #     .attr("cy", (d) -> d * 100)
  #     .attr("r", 10)

$(document).ready(app.ready)

