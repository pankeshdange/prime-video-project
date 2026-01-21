package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "DetailsServlet", value = "/details")
public class DetailsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String movieId = request.getParameter("id");
        if (movieId == null) movieId = "1";
        
        // Sample movie data
        Map<String, Object> movie = new HashMap<>();
        movie.put("id", movieId);
        movie.put("title", "The Lord of the Rings: The Rings of Power");
        movie.put("year", "2022");
        movie.put("rating", "8.5/10");
        movie.put("duration", "50-70 min per episode");
        movie.put("seasons", "1 Season");
        movie.put("episodes", "8 Episodes");
        movie.put("genre", "Fantasy, Drama, Adventure");
        movie.put("description", "Epic drama set thousands of years before the events of J.R.R. Tolkien's " +
                "The Hobbit and The Lord of the Rings. This series follows an ensemble cast of characters, " +
                "both familiar and new, as they confront the long-feared re-emergence of evil to Middle-earth.");
        movie.put("director", "J. A. Bayona, Wayne Che Yip");
        movie.put("cast", "Morfydd Clark, Robert Aramayo, Owain Arthur, Nazanin Boniadi");
        movie.put("maturityRating", "TV-14");
        movie.put("languages", "English, Spanish, French");
        
        // Similar content
        List<Map<String, String>> similarContent = new ArrayList<>();
        String[] similarTitles = {
            "The Wheel of Time", "The Boys", "The Marvelous Mrs. Maisel",
            "The Terminal List", "Jack Ryan", "Reacher"
        };
        
        for (int i = 0; i < similarTitles.length; i++) {
            Map<String, String> item = new HashMap<>();
            item.put("id", String.valueOf(i + 2));
            item.put("title", similarTitles[i]);
            item.put("year", String.valueOf(2020 + i));
            item.put("rating", String.format("%.1f/10", 7.5 + Math.random() * 2));
            similarContent.add(item);
        }
        
        request.setAttribute("movie", movie);
        request.setAttribute("similarContent", similarContent);
        request.getRequestDispatcher("/views/details.jsp").forward(request, response);
    }
}