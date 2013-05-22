window.app =

  ready: ->

    app.draw_circles()
    app.draw_arc()


  draw_arc: ->

    svgContainer = d3.select('body').selectAll('svg')

    path = svgContainer.append('path')
      .attr('d', 'M224,233 Q466,-10 710,144 Q725,100 762,157')
    totalLength = path.node().getTotalLength()
    console.log totalLength
    path
      .attr("stroke-dasharray", totalLength + " " + totalLength)
      .attr("stroke-dashoffset", totalLength)
      .transition()
        .duration(2000)
        .ease("linear")
        .attr("stroke-dashoffset", 0)




  draw_circles:->
    dataset = [["London",710, 144,"away"], ["Berlin",762, 157,"away"], ["New York",224,233,"home"]]#, ["Q",466,86]]


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
      .attr('class', (d) -> d[3])
      .text (d) -> d[0]





$(document).ready(app.ready)

