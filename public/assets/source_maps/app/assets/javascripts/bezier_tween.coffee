window.app =

  ready: ->

    app.draw_circles()
    app.draw_arc()
    # app.selectPaths()
    # app.calc_distance(x1,y1,x2,y2)

  # calc_distance: (x1,y1,x2,y2) ->
  #   Math.sqrt( ((x2 - x1)*(x2 - x1)) + ((y2-y1)*(y2-y1) )

      # svgContainer.calc_distance = (710,144,224,233) ->
      #   Math.sqrt( ((x2 - x1)*(x2 - x1)) + ((y2-y1)*(y2-y1) )


  draw_arc: ->

    # dist = calc_distance(710,144,224,233)
    # calc_distance = (x1,y1,x2,y2) -> Math.sqrt( ((x2 - x1)*(x2 - x1)) + ((y2-y1)*(y2-y1) )
    # # console.log dist
    dataset = [["London",710, 144], ["Berlin",762, 157], ["New York",224,233]]#, ["Q",466,86]]
    svgContainer = d3.select('body').selectAll('svg')

    pathTween = ->
      dataset = [["London",710, 144], ["Berlin",762, 157], ["New York",224,233]]#, ["Q",466,86]]

      interpolate = d3.scale.quantile().domain([0, 1]).range(d3.range(1, dataset.length + 1))
      (t) ->
        path dataset.slice(0, interpolate(t))
    path = svgContainer.append('path')
      .attr('class', 'path')
      .attr('d', 'M224,233 Q466,-10 710,144 Q725,100 762,157').transition().duration(1000).attrTween("d", pathTween)



    # svgContainer = d3.select('body').selectAll('svg')
      # # .append('g')
      # curve = svgContainer.append('path')
      #   .attr('d', 'M224,233 Q466,-10 710,144 Q725,100 762,157')
        # .attr("transform", "translate(" + [710,144] + "," + [762,157] + ")")
        # .transition().duration(2000)


#just entered
 # .data(orders)
 #  .enter().append("svg")
 #    .attr("width", w + 2 * padding)
 #    .attr("height", h + 2 * padding)
 #  .append("g")
 #    .attr("transform", "translate(" + padding + "," + padding + ")");




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

