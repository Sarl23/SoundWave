/**
 * Created by jahir on 6/19/17.
 */

function addToFavorites() {
    var xhr = new XMLHttpRequest();

    var player = document.getElementById("song-player");
    var songId = player.getAttribute("current-song-id");

    if (songId !== null && songId !== undefined && songId.length > 0) {
        var username = document.getElementById("user-details").getAttribute("data-username");
        //alert('usuario' + username);
        var toSend = "songId=" + songId + "&username=" + username + "&data=1";
        xhr.open("POST", "PlaylistsServlet", true);
        xhr.onreadystatechange = function () {
            //alert('entrando');
            alert("entrando al metodo");

            if (xhr.readyState === 4 && xhr.status === 200) {
                if (xhr.responseText.length > 0) {

                    var json = JSON.parse(xhr.responseText);

                    console.log(xhr.responseText);
                    if (json.code === 4) {
                        Materialize.toast("Añadido a favoritos!", 2000);
                    }
                }
            }
        }
    }
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(toSend);
}

function loadFavorites() {
    var xhr = new XMLHttpRequest();
    var username = document.getElementById("user-details").getAttribute("data-username");

    var toSend = "username=" + username + "&data=2";
    xhr.open("POST", "PlaylistsServlet", true);
    xhr.onreadystatechange = function () {
        if (xhr.status === 200 && xhr.readyState === 4) {
            if (xhr.responseText.length > 0) {
                var json = JSON.parse(xhr.responseText);
                if (json.songs !== undefined) {
                    loadSongsViews(json.songs);
                }
            }
        }
    };
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(toSend);
}

function addToPlaylist() {
    alert("sdfsdfsdf");

    var player = document.getElementById("song-player");
    var songId = player.getAttribute("current-song-id");
    if (songId !== null && songId !== undefined && songId.length > 0) {
        // TODO: Mostrar dialogo para escoger playlist o crear una nueva (Leer modals
        // http://materializecss.com/modals.html ) TODO: Hacer algo con el id de la cancion:
        // songId
    }
}