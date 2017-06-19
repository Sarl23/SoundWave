package co.edu.uptc.music.logic.managers;

import java.sql.ResultSet;

import co.edu.uptc.music.logic.models.Song;
import co.edu.uptc.music.persistence.SongDAO;

public class SongsManager extends BaseManager<Song> {

    private SongDAO songDAO;

    public SongsManager() {
        songDAO = new SongDAO();
    }

    public boolean addSong(String id, String name, String artist, String genre, int length,
                           String path, String img) {
        return addItem(new Song(id, name, artist, genre, length, path, img));
    }

    public boolean removeSong(String name) {
        return removeItem(findItem(name));
    }

    @Override
    public Song findItem(String s) {
        for (Song song : getList()) {
            if (song.getName().equalsIgnoreCase(s)) return song;
        }
        return null;
    }

    public void loadSongs() {

        ResultSet rs = songDAO.querySongs();
        if (rs != null) {
            try {
                clearList();
                while (rs.next()) {
                    String id = rs.getString("SONG_ID");
                    String name = rs.getString("NAME");
                    String artist = rs.getString("ARTIST");
                    String genre = rs.getString("GENRE");
                    String length = rs.getString("LENGTH");
                    String path = rs.getString("FILE_PATH");
                  //  String img = rs.getString("IMG_PATH");
                    addItem(new Song(id, name, artist, genre, Integer.parseInt(length), path, " "));
                }
            } catch (Exception ignored) {
            }
        }
    }

    public void songArtist() {

        ResultSet rs = songDAO.QuerysongArtis();
        if (rs != null) {
            try {clearList();
                while (rs.next()) {
                    String id = rs.getString("SONG_ID");
                    String name = rs.getString("NAME");
                    String artist = rs.getString("ARTIST");
                    String genre = rs.getString("GENRE");
                    String length = rs.getString("LENGTH");
                    String path = rs.getString("FILE_PATH");
                    //  String img = rs.getString("IMG_PATH");
                    addItem(new Song(id, name, artist, genre, Integer.parseInt(length), path, " "));
                }
            } catch (Exception ignored) {
            }
        }
    }

    public void songGender() {

        ResultSet rs = songDAO.QuerysongGender();
        if (rs != null) {
            try {clearList();
                while (rs.next()) {
                    String id = rs.getString("SONG_ID");
                    String name = rs.getString("NAME");
                    String artist = rs.getString("ARTIST");
                    String genre = rs.getString("GENRE");
                    String length = rs.getString("LENGTH");
                    String path = rs.getString("FILE_PATH");
                    //  String img = rs.getString("IMG_PATH");
                    addItem(new Song(id, name, artist, genre, Integer.parseInt(length), path, " "));
                }
            } catch (Exception ignored) {
            }
        }
    }
}