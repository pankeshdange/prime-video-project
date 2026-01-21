package com.amazonprime.clone.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Set featured content attributes
        request.setAttribute("featuredTitle", "The Lord of the Rings: The Rings of Power");
        request.setAttribute("featuredDescription", "Epic drama set thousands of years before the events of J.R.R. Tolkien's " +
                "The Hobbit and The Lord of the Rings. This series follows an ensemble cast of characters, " +
                "both familiar and new, as they confront the long-feared re-emergence of evil to Middle-earth.");
        request.setAttribute("featuredGenre", "Fantasy • Drama • Adventure");
        request.setAttribute("featuredRating", "8.5/10");
        request.setAttribute("featuredYear", "2022");
        
        // Prepare categories data for home page
        List<Map<String, Object>> categories = new ArrayList<>();
        
        // Prime Originals
        Map<String, Object> originals = new HashMap<>();
        originals.put("name", "Prime Originals");
        originals.put("items", getOriginals());
        categories.add(originals);
        
        // Continue Watching
        Map<String, Object> continueWatching = new HashMap<>();
        continueWatching.put("name", "Continue Watching");
        continueWatching.put("items", getContinueWatching());
        categories.add(continueWatching);
        
        // Movies
        Map<String, Object> movies = new HashMap<>();
        movies.put("name", "Movies");
        movies.put("items", getMovies());
        categories.add(movies);
        
        // TV Shows
        Map<String, Object> tvShows = new HashMap<>();
        tvShows.put("name", "TV Shows");
        tvShows.put("items", getTVShows());
        categories.add(tvShows);
        
        // Trending Now
        Map<String, Object> trending = new HashMap<>();
        trending.put("name", "Trending Now");
        trending.put("items", getTrending());
        categories.add(trending);
        
        // Recently Added
        Map<String, Object> recentlyAdded = new HashMap<>();
        recentlyAdded.put("name", "Recently Added");
        recentlyAdded.put("items", getRecentlyAdded());
        categories.add(recentlyAdded);
        
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
    
    private List<Map<String, String>> getOriginals() {
        List<Map<String, String>> originals = new ArrayList<>();
        
        String[][] originalsData = {
            {"The Boys", "2019", "3 Seasons", "8.7", "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&auto=format&fit=crop"},
            {"The Marvelous Mrs. Maisel", "2017", "5 Seasons", "8.7", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"Jack Ryan", "2018", "4 Seasons", "8.2", "https://images.unsplash.com/photo-1595769812725-4c6564f7528b?w=400&auto=format&fit=crop"},
            {"Reacher", "2022", "1 Season", "8.1", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"The Terminal List", "2022", "1 Season", "7.9", "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&auto=format&fit=crop"},
            {"The Wheel of Time", "2021", "1 Season", "7.2", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"}
        };
        
        for (String[] data : originalsData) {
            Map<String, String> item = new HashMap<>();
            item.put("title", data[0]);
            item.put("year", data[1]);
            item.put("info", data[2]);
            item.put("rating", data[3]);
            item.put("imageUrl", data[4]);
            item.put("type", "original");
            originals.add(item);
        }
        
        return originals;
    }
    
    private List<Map<String, String>> getContinueWatching() {
        List<Map<String, String>> items = new ArrayList<>();
        
        String[][] data = {
            {"The Rings of Power", "S1 • E5", "68%", "8.5", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"},
            {"The Boys", "S3 • E6", "45%", "8.7", "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&auto=format&fit=crop"},
            {"Reacher", "S1 • E3", "92%", "8.1", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"Jack Ryan", "S3 • E2", "15%", "8.2", "https://images.unsplash.com/photo-1595769812725-4c6564f7528b?w=400&auto=format&fit=crop"},
            {"The Marvelous Mrs. Maisel", "S4 • E1", "5%", "8.7", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"}
        };
        
        for (String[] itemData : data) {
            Map<String, String> item = new HashMap<>();
            item.put("title", itemData[0]);
            item.put("episode", itemData[1]);
            item.put("progress", itemData[2]);
            item.put("rating", itemData[3]);
            item.put("imageUrl", itemData[4]);
            item.put("type", "continue");
            items.add(item);
        }
        
        return items;
    }
    
    private List<Map<String, String>> getMovies() {
        List<Map<String, String>> movies = new ArrayList<>();
        
        String[][] moviesData = {
            {"Tom Clancy's Without Remorse", "2021", "Action", "5.7", "https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=400&auto=format&fit=crop"},
            {"The Tomorrow War", "2021", "Action • Sci-Fi", "6.6", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"},
            {"Coming 2 America", "2021", "Comedy", "6.3", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"The Map of Tiny Perfect Things", "2021", "Romance • Fantasy", "6.7", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"One Night in Miami", "2020", "Drama", "7.1", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"}
        };
        
        for (String[] data : moviesData) {
            Map<String, String> movie = new HashMap<>();
            movie.put("title", data[0]);
            movie.put("year", data[1]);
            movie.put("genre", data[2]);
            movie.put("rating", data[3]);
            movie.put("imageUrl", data[4]);
            movie.put("type", "movie");
            movies.add(movie);
        }
        
        return movies;
    }
    
    private List<Map<String, String>> getTVShows() {
        List<Map<String, String>> shows = new ArrayList<>();
        
        String[][] showsData = {
            {"The Expanse", "2015", "Sci-Fi • Drama", "8.5", "https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=400&auto=format&fit=crop"},
            {"Fleabag", "2016", "Comedy • Drama", "8.7", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"Good Omens", "2019", "Comedy • Fantasy", "8.0", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"},
            {"Hanna", "2019", "Action • Drama", "7.6", "https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=400&auto=format&fit=crop"},
            {"The Wilds", "2020", "Drama • Mystery", "7.3", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"}
        };
        
        for (String[] data : showsData) {
            Map<String, String> show = new HashMap<>();
            show.put("title", data[0]);
            show.put("year", data[1]);
            show.put("genre", data[2]);
            show.put("rating", data[3]);
            show.put("imageUrl", data[4]);
            show.put("type", "tv");
            shows.add(show);
        }
        
        return shows;
    }
    
    private List<Map<String, String>> getTrending() {
        List<Map<String, String>> trending = new ArrayList<>();
        
        String[][] trendingData = {
            {"Thursday Night Football", "Live", "Sports", "Live", "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400&auto=format&fit=crop"},
            {"The Rings of Power", "2022", "Fantasy", "8.5", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"},
            {"The Peripheral", "2022", "Sci-Fi • Thriller", "8.1", "https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=400&auto=format&fit=crop"},
            {"The Lord of the Rings: The Fellowship of the Ring", "2001", "Fantasy • Adventure", "8.8", "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop"},
            {"Cinderella", "2021", "Musical • Romance", "5.9", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"}
        };
        
        for (String[] data : trendingData) {
            Map<String, String> item = new HashMap<>();
            item.put("title", data[0]);
            item.put("year", data[1]);
            item.put("genre", data[2]);
            item.put("rating", data[3]);
            item.put("imageUrl", data[4]);
            item.put("type", "trending");
            trending.add(item);
        }
        
        return trending;
    }
    
    private List<Map<String, String>> getRecentlyAdded() {
        List<Map<String, String>> recent = new ArrayList<>();
        
        String[][] recentData = {
            {"Catherine Called Birdy", "2022", "Comedy • Drama", "7.1", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"My Policeman", "2022", "Drama • Romance", "6.7", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"The Peripheral", "2022", "Sci-Fi • Thriller", "8.1", "https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=400&auto=format&fit=crop"},
            {"The Sound of 007", "2022", "Documentary", "7.2", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"},
            {"Argentina, 1985", "2022", "Drama • History", "7.5", "https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=400&auto=format&fit=crop"}
        };
        
        for (String[] data : recentData) {
            Map<String, String> item = new HashMap<>();
            item.put("title", data[0]);
            item.put("year", data[1]);
            item.put("genre", data[2]);
            item.put("rating", data[3]);
            item.put("imageUrl", data[4]);
            item.put("type", "recent");
            recent.add(item);
        }
        
        return recent;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}