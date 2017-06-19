<%--
  Created by IntelliJ IDEA.
  User: jahir
  Date: 6/7/17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <!-- -->
    <head>
        <title>SoundWave</title>
        <meta lang="es"/>
        <link rel="stylesheet" href="assets/css/materialize.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/materialdesignicons.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--<link rel="shortcut icon" type="image/x-icon" href="/images/icon1.ico" /> -->
    </head>

    <body onload="loadSongs()">
        <div class="navbar-fixed">
            <nav>
                <div class="nav-wrapper cyan">
                    <ul class="left">
                        <li>
                            <a href="#" data-activates="slide-out"
                               class="button-collapse waves-effect waves-light show-on-large">
                                <i class="mdi mdi-menu material-icons"></i>
                            </a>
                        </li>
                        <a href="#" class="brand-logo left waves-effect waves-light">SoundWave</a>
                    </ul>
                    <ul class="right">
                        <li>
                            <form>
                                <div class="input-field">
                                    <input id="search" type="search" required>

                                    <label class="label-icon" for="search">

                                        <i class="mdi mdi-magnify material-icons"></i>

                                    </label>
                                    <i class="mdi mdi-close material-icons"></i>
                                </div>
                            </form>
                        </li>
                        <li>
                            <a class="waves-effect waves-light" href="#">
                                <i class="mdi mdi-upload material-icons"></i>
                            </a>
                        </li>
                        <li>
                            <a class="waves-effect waves-light" href="#!"
                               onclick="showCompoMenu('login')">
                                <i class="mdi mdi-account-circle material-icons"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- MENU ITEMS-->
        <ul id="slide-out" class="side-nav">
            <li>
                <div class="nav-title">
                    <h5 class="cyan-text">SoundWave</h5>
                    <a onclick="closeDrawer()"
                       class="waves-effect show-on-large">
                        <i class="mdi mdi-chevron-left"></i>
                    </a>
                </div>
            </li>
            <li>
                <div class="divider"></div>
            </li>
            <li>
                <a class="waves-effect" href="#!" onclick="showCompoMenu('songs');loadSongs()">
                    <i class="mdi mdi-music-circle"></i>
                    Canciones
                </a>

            </li>
            <li>
                <a class="waves-effect" href="#!"
                   onclick="showCompoMenu('artists-list');loadSongsByArtist();">
                    <i class="mdi mdi-account-box"></i>
                    Artistas
                </a>
            </li>

            <li>

                <a class="waves-effect" href="#!"
                   onclick="showCompoMenu('genres');loadSongsByGenre()">
                    <i class="mdi mdi-tag-multiple"></i>
                    Generos
                </a>
            </li>

            <li>
                <div class="divider"></div>
            </li>
            <li>
                <a class="subheader">Personal</a>
            </li>
            <li>
                <a class="waves-effect" href="#!" onclick="showCompoMenu('list-favorite')">
                    <i class="mdi mdi-heart"></i>
                    Favoritos
                </a>
            </li>
            <li>
                <a class="waves-effect" href="#!" onclick="showCompoMenu('playlists-list')">
                    <i class="material-icons">queue_music</i>
                    Listas de reproduccion
                </a>
            </li>
            <li>
                <a class="waves-effect" href="#!" onclick="showCompoMenu('login')">Cuenta</a>
            </li>
        </ul>
        <!-- fin MENU INTEMS-->

        <main>
            <!-- Inicio canciones -->
            <div id="songs" style="display:none;" class="section-content">
                <h3 class="cyan-text section-title">Canciones</h3>
            </div>
            <!-- Final canciones
            <div class="divider"></div>
            <!-- Inicio Login -->
            <div class="login-container" id="login-section">
                <div class="row">
                    <div class="col s4 m6 l6">
                        <div class="card-panel">
                            <div class="row">
                                <h4 class="primary-text">Iniciar sesion</h4>
                                <h6 class="primary-text">con tu cuenta de SoundWave</h6>
                            </div>
                            <div id="main-fields">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="username" type="text" class="validate">
                                        <label for="username">Correo electronico o nombre de
                                                              usuario</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" type="password" class="validate">
                                        <label for="password">Contraseña</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a id="create-account" class="text-link" onclick="showRegister()">
                                    Aun no tienes cuenta?
                                </a>
                                <br>
                                <a id="login" class="waves-effect btn cyan"
                                   onclick="login();">
                                    Iniciar sesion
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin login -->
            <!-- Inicio detalles usuario -->
            <div class="login-container" id="user-details" style="display: none;">
                <div class="row">
                    <div class="col s4 m6 l6">
                        <div class="card-panel">
                            <div class="row">
                                <h4 id="user-name" class="primary-text"></h4>
                                <h6 id="user-type" class="primary-text"></h6>
                            </div>
                            <div class="row">
                                <a id="logout" class="waves-effect btn cyan"
                                   onclick="logout();">
                                    Cerrar sesion
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Final detalles usuario
            <div class="divider"></div>
            <!-- Inicio crear cuenta -->
            <div class="login-container" id="register-section" style="display: none;">
                <div class="row">
                    <div class="col s4 m6 l6">
                        <div class="card-panel">
                            <div class="row">
                                <h4 class="primary-text">Registrate</h4>
                                <h6 class="primary-text">para tener tu cuenta de SoundWave</h6>
                            </div>
                            <div id="create-account-fields">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="new-fullname" type="text" class="validate">
                                        <label for="new-fullname">Nombre completo</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="new-email" type="email" class="validate">
                                        <label for="new-email">Correo electronico</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="new-username" type="text" class="validate">
                                        <label for="new-username">Nombre de usuario</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="new-password" type="password"
                                               class="validate">
                                        <label for="new-password">Contraseña</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select id="new-type">
                                            <option value="US04" disabled selected>Normal
                                            </option>
                                            <option value="US01">Admin</option>
                                            <option value="US02">Premium</option>
                                            <option value="US03">Artista</option>
                                            <option value="US04">Normal</option>
                                            <option value="US05">Invitado</option>
                                        </select>
                                        <label>Tipo</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a id="cancel" class="waves-effect btn cyan"
                                   onclick="hideRegister();">
                                    Cancelar
                                </a>
                                <br><br>
                                <a id="create" class="waves-effect btn cyan"
                                   onclick="createUser();">
                                    Crear cuenta
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin crear cuenta
            <div class="divider"></div>
            <!-- Inicio de lista de artistas-->
            <div id="artists-list" style="display:none;" class="section-content">
                <div class="container">
                    <!-- Page Content goes here -->
                    <ul class="collection with-header">
                        <li class="collection-header"><h4>Artistas</h4></li>
                        <li class="collection-item avatar">
                            <img src="https://i1.sndcdn.com/artworks-000227625218-5u67k2-t500x500.jpg"
                                 alt="" class="circle">
                            <span class="title">NCS </span>
                            <p>NCS Release <br>
                               Genero: Mix ING.Electronica
                            </p>
                            <a href="#!" class="secondary-content">
                                <i class="mdi mdi-library-music"></i>
                            </a>
                        </li>
                        <li class="collection-item avatar">
                            <i class="material-icons circle">img art</i>
                            <span class="title">SARL</span>
                            <p>First Line <br>
                               Second Line
                            </p>
                            <a href="#!" class="secondary-content">
                                <i class="mdi mdi-library-music"></i>
                            </a>
                        </li>
                        <li class="collection-item avatar">
                            <i class="material-icons circle green">img art</i>
                            <span class="title">Title</span>
                            <p>First Line <br>
                               Second Line
                            </p>
                            <a href="#!" class="secondary-content">
                                <i class="mdi mdi-library-music"></i>
                            </a>
                        </li>
                        <li class="collection-item avatar">
                            <i class="material-icons circle red">play_arrow</i>
                            <span class="title">Title</span>
                            <p>First Line <br>
                               Second Line
                            </p>
                            <a href="#!" class="secondary-content">
                                <i class="mdi mdi-library-music"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Fin de lista de artistas
            <div class="divider"></div>
            <!-- Inicio lista de generos -->
            <div id="genres" style="display:none;" class="section-content">
                <h3 class="cyan-text section-title">Generos</h3>
                <div class="row">
                    <div class="col s4 m3 l2">
                        <div class="grid-item">
                            <img class="responsive-img" crossorigin="anonymous"
                                 src="https://i1.sndcdn.com/artworks-000227378436-y07in3-t500x500.jpg"
                                 onload="loadCardColors(event)"/>
                            <div class="divider"></div>
                            <div class="grid-item-content">
                                <p class="primary-text">Electro House</p>
                            </div>
                        </div>
                    </div>

                    <div class="col s4 m3 l2">
                        <div class="grid-item">
                            <img class="responsive-img" crossorigin=""
                                 src="http://3.bp.blogspot.com/--pem6TeduTg/TiXe97AyVlI/AAAAAAAAACU/ou6R6fM-j58/s1600/pop.jpg"
                                 onload="loadCardColors(event)"/>
                            <div class="divider"></div>
                            <div class="grid-item-content">
                                <p class="primary-text">Dubstep</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s4 m3 l2">
                        <div class="grid-item">
                            <img class="responsive-img" crossorigin=""
                                 src="https://i1.sndcdn.com/artworks-000228571109-9v1ty0-t500x500.jpg"
                                 onload="loadCardColors(event)"/>
                            <div class="divider"></div>
                            <div class="grid-item-content">
                                <p class="primary-text">Electro Dance</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- fin de lista de generos
            <div class="divider"></div>
            <!-- Inicio de lista de playlists -->
            <div id="playlists-list" style="display:none;" class="section-content">
                <h3 class="cyan-text section-title">Tus PlayLists</h3>
                <div class="container">
                    <ul class="collection with-header">
                        <li class="collection-header"><h4>Listas de reproduccion</h4></li>
                        <li class="collection-item">
                            <div class="playlist-title">
                                Music
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                        <li class="collection-item">
                            <div>Colegio
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                        <li class="collection-item">
                            <div>Gym
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- fin de lista de playlists
            <div class="divider"></div>
            <!-- Lista de Facoritos -->
            <div id="list-favorite" style="display:none;" class="section-content">
                <h3 class="cyan-text section-title">Favoritos</h3>
                <div class="container">
                    <ul class="collection with-header">
                        <li class="collection-header"><h4>Mis favoritos</h4></li>
                        <li class="collection-item">
                            <div class="playlist-title">
                                Riot
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                        <li class="collection-item">
                            <div>Psycho
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                        <li class="collection-item">
                            <div>Free
                                <a href="#!" class="secondary-content">
                                    <i class="mdi mdi-play"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Fin lista de favoritos -->
        </main>


        <!-- inicio player -->
        <div class="player">
            <div class="progress" onmousedown="moveSong(event)">
                <div class="determinate" id="song-progress" style="width: 0"></div>
            </div>
            <div id="song-picture">
                <img id="current-album" src="" crossorigin=""
                     class="responsive-img player-img"/>
            </div>
            <div class="song-details">
                <h5 id="song-detail-name" class="primary-text"></h5>
                <h6 id="song-detail-artist" class="secondary-text"></h6>
            </div>

            <div class="buttons">
                <a class="waves-ripple" onclick="addfavorites()">
                    <i class="material-icons">grade</i>
                </a>

                <i class="mdi mdi-skip-previous waves-ripple"></i>

                <a class="waves-ripple" onclick="seek(false)">
                    <i class="mdi mdi-skip-backward waves-ripple"></i>
                </a>
                <a class="waves-ripple pulse" onclick="playPauseSong(true)">
                    <i id="play-button" class="mdi mdi-play-circle">
                    </i>
                </a>
                <a class="waves-ripple pulse" onclick="playPauseSong(false)">
                    <i id="pause-button" class="mdi mdi-pause-circle"></i>
                </a>
                <a class="waves-ripple" onclick="seek(true)">
                    <i class="mdi mdi-skip-forward waves-ripple"></i>
                </a>
                <i class="mdi mdi-skip-next waves-ripple"></i>

                <a class="waves-ripple pulse" onclick="addplayList()">
                    <i class="material-icons">playlist_add</i>
                </a>
            </div>
            <div class="whole-volume-container">
                <i class="mdi mdi-volume-high volume-icon-low"></i>
                <div class="volume-container">
                    <form>
                        <p class="range-field">
                            <input type="range" id="volume-slider" min="0" max="100" value="100"
                                   oninput="updateVolume()" onchange="updateVolume()"/>
                        </p>
                    </form>
                </div>
                <i class="mdi mdi-volume-low volume-icon"></i>
            </div>
            <audio id="song-player" preload="none" ontimeupdate="updateSongProgress()">
                <source src="" type="audio/mpeg"/>
            </audio>
        </div>
        <!-- fin player -->


        <script src="assets/js/load.js"></script>
        <script src="assets/js/core.js"></script>
        <script src="assets/js/music.js"></script>
        <script src="assets/js/jquery-2.1.4.min.js"></script>
        <script src="assets/js/materialize.min.js"></script>
        <script src="assets/js/vibrant.min.js"></script>
        <script src="assets/js/ui.js"></script>

        <script type="text/javascript">
            $('.button-collapse').sideNav({
                                              menuWidth: 280, // Default is 300
                                              edge: 'left', // Choose the horizontal origin
                                              closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
                                              draggable: true // Choose whether you can drag to open on touch screens
                                          }
            );
            $('.slider').slider({
                                    indicators: false,
                                    interval: 2500
                                });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>

        <!--
         <form method="POST" action="ServUpload" enctype="multipart/form-data">

            File: <input type="file" name="file" id="file"/> <br/>
            Destination:<input type="text" value="/tmp" name="destination"/> </br>

            <input type="submit" value="Upload" name="upload" id="upload"/>

        </form>
        -->
    </body>
</html>