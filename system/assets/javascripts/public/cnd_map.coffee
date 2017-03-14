define ['async!http://maps.google.com/maps/api/js?sensor=false'],()->
  $.extend true,Cnd,
    gmap: (node)->
      latlng = new google.maps.LatLng(46.782008, 23.699802);
      myOptions =
        zoom: 13,
        center: latlng,
        scaleControl: false,
        mapTypeId: google.maps.MapTypeId.MAP
      map = new google.maps.Map(node, myOptions)
      marker = new google.maps.Marker
        position: latlng,
        map: map,
        title: "CND Control"
      return
  Cnd
