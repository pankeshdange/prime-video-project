package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "SearchServlet", value = "/search")
public class SearchServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String query = request.getParameter("q");
        
        // Sample search results
        List<Map<String, String>> results = new ArrayList<>();
        
        if (query != null && !query.trim().isEmpty()) {
            // Mock search results
            String[][] mockResults = {
                {"The Lord of the Rings: The Rings of Power", "2022", "TV Series", "8.5/10"},
                {"The Boys", "2019", "TV Series", "8.7/10"},
                {"Jack Ryan", "2018", "TV Series", "8.2/10"},
                {"The Marvelous Mrs. Maisel", "2017", "TV Series", "8.7/10"},
                {"Reacher", "2022", "TV Series", "8.1/10"},
                {"The Terminal List", "2022", "TV Series", "7.9/10"},
                {"The Wheel of Time", "2021", "TV Series", "7.2/10"},
                {"Tom Clancy's Without Remorse", "2021", "Movie", "5.7/10"}
            };
            
            for (int i = 0; i < mockResults.length; i++) {
                if (mockResults[i][0].toLowerCase().contains(query.toLowerCase())) {
                    Map<String, String> result = new HashMap<>();
                    result.put("id", String.valueOf(i + 1));
                    result.put("title", mockResults[i][0]);
                    result.put("year", mockResults[i][1]);
                    result.put("type", mockResults[i][2]);
                    result.put("rating", mockResults[i][3]);
                    results.add(result);
                }
            }
        }
        
        // Popular searches
        List<String> popularSearches = Arrays.asList(
            "The Boys", "Jack Ryan", "Reacher", 
            "The Marvelous Mrs. Maisel", "The Terminal List",
            "The Wheel of Time", "Thursday Night Football"
        );
        
        request.setAttribute("query", query);
        request.setAttribute("results", results);
        request.setAttribute("popularSearches", popularSearches);
        request.getRequestDispatcher("/views/search.jsp").forward(request, response);
    }
}