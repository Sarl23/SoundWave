/**
 * Created by jahir on 6/18/17.
 */

function loadSongs() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SongsServlet", true);
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
    xhr.send("data=1");
}

function loadSongsByArtist() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SongsServlet", true);
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
    xhr.send("data=2");
}

function loadSongsByGenre() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SongsServlet", true);
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
    xhr.send("data=3");
}

function loadSongsViews(list) {
    var songs = document.getElementById("songs");
    songs.innerHTML = "<h3 class=\"cyan-text section-title\">Canciones</h3>";
    songs.innerHTML +=
        "<div><a class=\"waves-effect btn cyan\" onclick=\"loadSongsByGenre()\">Genero</a>";
    songs.innerHTML +=
        "<a class=\"waves-effect btn cyan\" onclick=\"loadSongsByArtist()\">Artista</a>";
    songs.innerHTML +=
        "<a class=\"waves-effect btn cyan\" onclick=\"loadSongs()\">Sin filtros</a></div>";

    var row = document.createElement("div");
    row.setAttribute("class", "row");
    for (var i = 0; i < list.length; i++) {
        var imgPath = list[i].img;
        if (i % 6 === 0) {
            songs.appendChild(row);
            row = document.createElement("div");
            row.setAttribute("class", "row");
        }

        var col = document.createElement("div");
        col.setAttribute("class", "col s4 m3 l2");

        var item = document.createElement("div");
        item.setAttribute("class", "grid-item");
        item.setAttribute("data-song-id", list[i].id);
        item.setAttribute("data-path", list[i].path);
        item.setAttribute("data-name", list[i].name);
        item.setAttribute("data-artist", list[i].artist);
        item.setAttribute("onclick", "playSong(event)");

        var img = document.createElement("img");
        img.setAttribute("class", "responsive-img album");
        img.setAttribute("crossorigin", "");
        img.setAttribute("src", imgPath);

        var divider = document.createElement("div");
        divider.setAttribute("class", "divider");

        var content = document.createElement("div");
        content.setAttribute("class", "grid-item-content");

        var title = document.createElement("p");
        title.setAttribute("class", "primary-text");
        title.innerHTML = getShortText(list[i].name);

        var subtitle = document.createElement("h6");
        subtitle.setAttribute("class", "secondary-text");
        subtitle.innerHTML = getShortText(list[i].artist);

        var dots = document.createElement("i");
        dots.setAttribute("class", "mdi mdi-dots-vertical menu");
        dots.setAttribute("data-activates", "songs-menu");

        content.appendChild(title);
        content.appendChild(subtitle);
        // content.appendChild(dots);

        if (imgPath !== undefined && imgPath.length > 1) {
            img.setAttribute("onload", "loadCardColors(event)");
        }
        item.appendChild(img);
        item.appendChild(divider);
        item.appendChild(content);

        col.appendChild(item);

        row.appendChild(col);
    }
    songs.appendChild(row);
}

function getShortText(text) {
    if (text.length <= 20) {
        return text;
    }
    return text.substr(0, 19) + "...";
}

function loadArtists() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SongsServlet", true);
    xhr.onreadystatechange = function () {
        if (xhr.status === 200 && xhr.readyState === 4) {
            if (xhr.responseText.length > 0) {
                var json = JSON.parse(xhr.responseText);
                var list = document.getElementById("artists-collection");
                list.innerHTML = "<li class=\"collection-header\"><h4>Artistas</h4></li>";
                if (json.artists !== undefined) {
                    for (var i = 0; i < json.artists.length; i++) {
                        var li = document.createElement("li");
                        li.setAttribute("class", "collection-item avatar");

                        var img = document.createElement("img");
                        img.setAttribute("src", json.artists[i].img);
                        img.setAttribute("class", "circle");

                        var sp = document.createElement("span");
                        sp.setAttribute("class", "title");
                        sp.innerHTML = json.artists[i].name;

                        var pp = document.createElement("p");
                        pp.innerHTML = camelize(json.artists[i].genre);

                        li.appendChild(img);
                        li.appendChild(sp);
                        li.appendChild(pp);

                        list.appendChild(li);
                    }
                }
            }
        }
    };
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("data=4");
}
function loadGenreViews(list) {
    var genres = document.getElementById("genres");
    genres.innerHTML = "";

    var h = document.createElement("h3");
    h.setAttribute("class", "cyan-text section-title");
    h.innerHTML = "Generos";

    genres.appendChild(h);

    var row = document.createElement("div");
    row.setAttribute("class", "row");
    for (var i = 0; i < list.length; i++) {
        var Pathimg = list[i].imgPath;
        if (i % 6 === 0) {
            genres.appendChild(row);
            row = document.createElement("div");
            row.setAttribute("class", "row");
        }

        var col = document.createElement("div");
        col.setAttribute("class", "col s4 m3 l2");

        var griditem = document.createElement("div");
        griditem.setAttribute("class", "grid-item");

        var imgAl = document.createElement("img");
        imgAl.setAttribute("class", "responsive-img");
        imgAl.setAttribute("crossorigin", "anonymous");
        imgAl.setAttribute("src", Pathimg);
        imgAl.setAttribute("onload", "loadCardColors(event)");

        var divider = document.createElement("div");
        divider.setAttribute("class", "divider");

        var content = document.createElement("div");
        content.setAttribute("class", "grid-item-content");

        var p = document.createElement("p");
        p.setAttribute("class", "primary-text");
        p.innerHTML = list[i].description;

        content.appendChild(p);
        griditem.appendChild(imgAl);
        griditem.appendChild(divider);
        griditem.appendChild(content);
        col.appendChild(griditem);
        row.appendChild(col);
    }
    genres.appendChild(row);
}

function loadGenres() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "GenresServlet", true);
    xhr.onreadystatechange = function () {
        if (xhr.status === 200 && xhr.readyState === 4) {
            if (xhr.responseText.length > 0) {
                var a = xhr.responseText;
                var json = JSON.parse(a);
                if (json.genres !== undefined) {
                    loadGenreViews(json.genres);
                }
            }
        }
    };
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("");
}