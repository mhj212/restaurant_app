#Foodieana Jones app

What Rotten Tomatoes is for movies, Foodieana Jones is to NYC restaurants.  I take the user review score from Yelp, Michelin's NYC Guide for 2014, The New York Times'restaurant database, and your own review and average them together.

##APIs and Gems used

Heroku
Yelp API

##Code Snippet

Things got a little complicated and I'm happy I found out how to code it:

```


<% if Restaurant.find_by_name(@restaurant_hash["businesses"][0]["name"]) != nil %>

  <% if @michelin_rating == nil && @nyt_rating == nil %>
  <% @total_rating = @yelp_rating %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating != nil && @nyt_rating == nil %>
  <% @total_rating = (@yelp_rating + (Restaurant.find_by_name(@restaurant_hash["businesses"][0]["name"]).rating*10) + @michelin_rating) / 3 %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating == nil && @nyt_rating != nil %>
  <% @total_rating = (@yelp_rating + (Restaurant.find_by_name(@restaurant_hash["businesses"][0]["name"]).rating*10) + @nyt_rating) / 3 %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating != nil && @nyt_rating != nil %>
  <% @total_rating = (@yelp_rating + (Restaurant.find_by_name(@restaurant_hash["businesses"][0]["name"]).rating*10) + @michelin_rating + @nyt_rating) / 4 %>
  <% @total_rating = @total_rating.to_i %> 
  <h4>Total Rating: <%= @total_rating %></h4>

  <% end %>

<% else %>

<% @total_rating = 1 %>
<% @total_rating = @total_rating.to_i %>

  <% if @michelin_rating == nil && @nyt_rating == nil %>
  <% @total_rating = @yelp_rating %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating != nil && @nyt_rating == nil %>
  <% @total_rating = (@yelp_rating + @michelin_rating) / 2 %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating == nil && @nyt_rating != nil %>
  <% @total_rating = (@yelp_rating + @nyt_rating) / 2 %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>

  <% elsif @michelin_rating != nil && @nyt_rating != nil %>
  <% @total_rating = (@yelp_rating + @michelin_rating + @nyt_rating) / 3 %> 
  <% @total_rating = @total_rating.to_i %>
  <h4>Total Rating: <%= @total_rating %></h4>
  <% end %>

<% end %>

```