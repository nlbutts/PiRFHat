
$(document).ready(function(){
    //connect to the socket server.
    var socket = io.connect('http://' + document.domain + ':' + location.port + '/test');
    var numbers_received = [];

    function refreshImage(imgElement, imgURL){        // create a new timestamp
        var timestamp = new Date().getTime();
        var el = document.getElementById(imgElement);
        var queryString = "?t=" + timestamp;
        el.src = imgURL + queryString;
    }

    //receive details from server
    socket.on('newnumber', function(msg) {
        console.log("Received " + msg.rssi);
        // //maintain a list of ten numbers
        // if (numbers_received.length >= 10){
        //     numbers_received.shift()
        // }
        //numbers_received.push(msg.number);
        // numbers_string = '';
        // for (var i = 0; i < numbers_received.length; i++){
        //     numbers_string = numbers_string + '<p>' + numbers_received[i].toString() + '</p>';
        // }
        $('#rssi').html(msg.rssi.toString());
        $('#snr').html(msg.snr.toString());
        $('#lastmsg').html(msg.number.toString());

        refreshImage("image", "static/img.jpg");
    });

});