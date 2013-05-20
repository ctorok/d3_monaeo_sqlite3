# source: http://bost.ocks.org/mike/map/
window.app =

  ready: ->

    app.draw_circles()
    app.draw_arc()

  draw_arc: ->
    # w = 960
    # h = 500
    # r = Math.min(w, h) / 1.8 #radius of the circle my arc will follow
    # s = .09 #arc spacing
    # arc = d3.svg.arc().startAngle(0).endAngle(d) ->
    #   d.value * 2 * Math.PI)
    #   .innerRadius((d) ->
    #     r).outerRadius((d) ->
    #       (d.index + s) * r)

    vis = d3.select('body').selectAll('svg')
    pi = Math.PI

    arc = d3.svg.arc()
      .innerRadius(110)
      .outerRadius(105)
      .startAngle(0)
      .endAngle (t) ->
        t * 2 * pi / 3


    vis.append('path')
      .attr("d", arc)
      .attr("transform", "translate(224,233)")

    # vis = d3.select("body").selectAll("svg")
    # pi = Math.PI
    # arc = d3.svg.chord()
    #   .target(
    #     startAngle: -45 * (pi/180)
    #     endAngle: 15 * (pi/180))
    #   .source(
    #     startAngle: 2.6
    #     endAngle: 2.7)
    #   .radius(260)

    # vis.append("path")
    #   .attr("d", arc)
    #   # .attr("id", "path1")
    #   .attr("transform", "translate(130,520)")












  draw_circles:->
    dataset = [["London",710, 144], ["Berlin",762, 157], ["New York",224,233]]
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

