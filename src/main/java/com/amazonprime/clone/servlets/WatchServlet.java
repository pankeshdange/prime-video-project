package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "WatchServlet", value = "/watch")
public class WatchServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String videoId = request.getParameter("id");
        if (videoId == null) videoId = "1";
        
        // Video data
        Map<String, Object> video = new HashMap<>();
        video.put("id", videoId);
        video.put("title", "The Lord of the Rings: The Rings of Power - Episode 1");
        video.put("season", "1");
        video.put("episode", "1");
        video.put("episodeTitle", "A Shadow of the Past");
        video.put("description", "Galadriel hunts down the last remnants of Morgoth's followers; " +
                "Arondir makes an unsettling discovery; a harfoot makes a discovery of her own.");
        video.put("duration", "68 min");
        video.put("nextEpisode", "Episode 2");
        video.put("nextEpisodeId", "2");
        
        // Episode list
        List<Map<String, String>> episodes = new ArrayList<>();
        String[] episodeTitles = {
            "A Shadow of the Past",
            "Adrift",
            "Adar",
            "The Great Wave",
            "Partings",
            "Udûn",
            "The Eye",
            "Alloyed"
        };
        
        for (int i = 0; i < episodeTitles.length; i++) {
            Map<String, String> episode = new HashMap<>();
            episode.put("number", String.valueOf(i + 1));
            episode.put("title", episodeTitles[i]);
            episode.put("duration", (55 + i * 3) + " min");
            episode.put("description", "Episode description for " + episodeTitles[i]);
            episodes.add(episode);
        }
        
        request.setAttribute("video", video);
        request.setAttribute("episodes", episodes);
        request.getRequestDispatcher("/views/watch.jsp").forward(request, response);
    }
}