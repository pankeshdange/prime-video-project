package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "BrowseServlet", value = "/browse")
public class BrowseServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Categories for browsing
        List<String> categories = Arrays.asList(
            "Action & Adventure",
            "Comedy",
            "Drama",
            "Fantasy & Sci-Fi",
            "Horror",
            "Romance",
            "Thriller",
            "Documentary",
            "Kids & Family"
        );
        
        // Featured movies by category
        Map<String, List<Map<String, String>>> moviesByCategory = new HashMap<>();
        
        for (String category : categories) {
            List<Map<String, String>> movies = new ArrayList<>();
            
            // Add sample movies for each category
            for (int i = 1; i <= 6; i++) {
                Map<String, String> movie = new HashMap<>();
                movie.put("title", category + " Movie " + i);
                movie.put("year", String.valueOf(2020 + i));
                movie.put("rating", String.format("%.1f/10", 7.0 + Math.random() * 3));
                movie.put("duration", (90 + i * 10) + " min");
                movies.add(movie);
            }
            
            moviesByCategory.put(category, movies);
        }
        
        request.setAttribute("categories", categories);
        request.setAttribute("moviesByCategory", moviesByCategory);
        request.getRequestDispatcher("/views/browse.jsp").forward(request, response);
    }
}