//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.

function initMap() {
    var mapCanvas = document.getElementById('map-canvas');
    var lats = new google.maps.LatLng(44.5403, -78.5463)
    var mapOptions = {
        center: lats,
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(mapCanvas, mapOptions);

    var marker = new google.maps.Marker({
        position: lats,
        map: map,
        title: 'Hello World!'
    });


}
