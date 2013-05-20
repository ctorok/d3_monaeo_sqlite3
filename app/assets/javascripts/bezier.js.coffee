# source: http://bost.ocks.org/mike/map/
window.app =

  ready: ->

    app.draw_circles()
    app.draw_arc()

  draw_arc: ->
    svgContainer = d3.select('body').selectAll('svg')
    curve = svgContainer.append('path')
      .attr('d', 'M224,233 Q466,-10 710,144')



  draw_circles:->
    dataset = [["London",710, 144], ["Berlin",762, 157], ["New York",224,233]]#, ["Q",466,86]]
    canvas = d3.select('body').selectAll('svg')
      .selectAll('circle')
      .data(dataset)
      .enter()
      .append('circle')
      .attr('cx', (d) -> d[1])
      .attr('cy', (d) -> d[2])
      .attr('r', 10)

    canvas = d3.select('body').selectAll('svg')
      .selectAll("text")
      .data(dataset)
      .enter()
      .append("text")
      .attr('x', (d) -> d[1] + 2)
      .attr('y', (d) -> d[2] + 2)
      .text (d) -> d[0]





$(document).ready(app.ready)
