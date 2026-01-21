package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // User profile data
        Map<String, Object> user = new HashMap<>();
        user.put("name", "Kastro");
        user.put("email", "kastro@example.com");
        user.put("plan", "Prime Video");
        user.put("planType", "Monthly");
        user.put("nextBilling", "April 15, 2024");
        user.put("profiles", 3);
        user.put("watchlistItems", 42);
        user.put("continueWatching", 8);
        
        // Watch history
        List<Map<String, String>> watchHistory = new ArrayList<>();
        String[][] historyData = {
            {"The Lord of the Rings: The Rings of Power", "Episode 8", "2 days ago", "68%"},
            {"The Boys", "Season 3, Episode 6", "1 week ago", "100%"},
            {"Reacher", "Season 1, Episode 4", "2 weeks ago", "45%"},
            {"Jack Ryan", "Season 3, Episode 3", "3 weeks ago", "100%"}
        };
        
        for (String[] data : historyData) {
            Map<String, String> item = new HashMap<>();
            item.put("title", data[0]);
            item.put("episode", data[1]);
            item.put("time", data[2]);
            item.put("progress", data[3]);
            watchHistory.add(item);
        }
        
        // Watchlist
        List<Map<String, String>> watchlist = new ArrayList<>();
        String[][] watchlistData = {
            {"The Terminal List", "2022", "Action", "8 Episodes"},
            {"The Marvelous Mrs. Maisel", "2017", "Comedy", "43 Episodes"},
            {"Tom Clancy's Without Remorse", "2021", "Action", "Movie"},
            {"The Wheel of Time", "2021", "Fantasy", "8 Episodes"}
        };
        
        for (int i = 0; i < watchlistData.length; i++) {
            Map<String, String> item = new HashMap<>();
            item.put("id", String.valueOf(i + 1));
            item.put("title", watchlistData[i][0]);
            item.put("year", watchlistData[i][1]);
            item.put("genre", watchlistData[i][2]);
            item.put("info", watchlistData[i][3]);
            watchlist.add(item);
        }
        
        request.setAttribute("user", user);
        request.setAttribute("watchHistory", watchHistory);
        request.setAttribute("watchlist", watchlist);
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }
}