
window.app =
  ready: ->

    # app.draw_circles()
    app.draw_map()

  draw_map: ->
    d3.json "airports.json", (error, airports) ->
      console.log airports


  # draw_circles: ->
  #   canvas = d3.select('body').selectAll('svg').selectAll('circle').data([1,2])
  #   canvas.enter()
  #     .append("circle")
  #     .attr("cx", (d) -> d * 200)
  #     .attr("cy", (d) -> d * 100)
  #     .attr("r", 10)

$(document).ready(app.ready)

