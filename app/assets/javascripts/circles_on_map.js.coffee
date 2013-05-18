# source: http://bost.ocks.org/mike/map/
window.app =
  ready: ->

    app.draw_circles()



  draw_circles: ->
    dataset = [[710, 144], [762, 157], [224,233]]
    # uk, germany, ny
    canvas = d3.select('body').selectAll('svg').selectAll('circle')
      .data(dataset)
      .enter()
      .append('circle')
      .attr('cx', (d) -> d[0])
      .attr('cy', (d) -> d[1])
      .attr('r', 10)




$(document).ready(app.ready)

