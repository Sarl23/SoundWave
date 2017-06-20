package co.edu.uptc.music.servlets;


import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.uptc.music.logic.managers.SongsManager;
import co.edu.uptc.music.logic.models.Song;

@WebServlet(name = "PlayerServlet", urlPatterns = {"/PlayerServlet"})
public class PlayerServlet extends HttpServlet {

    private SongsManager mng = new SongsManager();

    public void processRequest(HttpServletRequest req, HttpServletResponse resp) {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        String data = req.getParameter("data");
        String currentSongId = req.getParameter("current");
        int opc = Integer.parseInt(data);
        try (PrintWriter writer = resp.getWriter()) {
            switch (opc) {
                default:
                    mng.loadSongs();
                    break;
            }
            Song nSong = null;
            ArrayList<Song> songs = mng.getList();
            for (int i = 0; i < songs.size(); i++) {
                String nId = songs.get(i).getId();
                if (songs.get(i).getId().equalsIgnoreCase(currentSongId)) {
                    try {
                        if (opc == 0) {
                            nSong = songs.get(i - 1);
                        } else if (opc == 1) {
                            nSong = songs.get(i + 1);
                        }
                    } catch (Exception ignored) {
                    }
                    if (nSong != null) break;
                }
            }
            if (nSong != null) {
                writer.write(gson.toJson(nSong));
            }
            writer.close();
        } catch (Exception ignored) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        processRequest(req, resp);
    }
}