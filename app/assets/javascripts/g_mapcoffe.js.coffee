
window.app =
  ready: ->
    app.draw_map()

  draw_map: ->
    map = new google.maps.Map(d3.select("#map").node(),
      zoom: 5
      center: new google.maps.LatLng(40.7142, -74.0064)
      mapTypeId: google.maps.MapTypeId.TERRAIN)

    # Load the station data. When the data comes back, create an overlay.
    d3.json "stations.json", (data) ->
      overlay = new google.maps.OverlayView()

      # Add the container when the overlay is added to the map.
      overlay.onAdd = ->
        layer = d3.select(@getPanes().overlayLayer).append("div").attr("class", "stations")

        # Draw each marker as a separate SVG element.
        # We could use a single SVG, but what size would it have?
        overlay.draw = ->
          # update existing markers

          # Add a circle.

          # Add a label.
          transform = (d) ->
            d = new google.maps.LatLng(d.value[1], d.value[0])
            d = projection.fromLatLngToDivPixel(d)
            d3.select(this).style("left", (d.x - padding) + "px").style "top", (d.y - padding) + "px"
          projection = @getProjection()
          padding = 10
          marker = layer.selectAll("svg").data(d3.entries(data)).each(transform).enter().append("svg:svg").each(transform).attr("class", "marker")
          marker.append("svg:circle").attr("r", 4.5).attr("cx", padding).attr "cy", padding
          marker.append("svg:text").attr("x", padding + 7).attr("y", padding).attr("dy", ".31em").text (d) ->
            d.key



      # Bind our overlay to the map
      overlay.setMap map

$(document).ready(app.ready)

