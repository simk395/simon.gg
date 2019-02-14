def rank(i)
 if @stats_arr[i]["rank"] == "BRONZE"
   image_tag("/ranks/BRONZE.png", class: "game-rank")
 elsif @stats_arr[i]["rank"] == "SILVER"
   image_tag("/ranks/SILVER.png",class: "game-rank")
 elsif @stats_arr[i]["rank"] == "GOLD"
   image_tag("/ranks/GOLD.png",class: "game-rank")
 elsif @stats_arr[i]["rank"] == "PLATINUM"
   image_tag("/ranks/PLATINUM.png",class: "game-rank")
 elsif @stats_arr[i]["rank"] == "DIAMOND"
   image_tag("/ranks/DIAMOND.png",class: "game-rank")
 elsif @stats_arr[i]["rank"] == "MASTER"
   image_tag("/ranks/MASTER.png",class: "game-rank")
 elsif @stats_arr[i]["rank"] == "CHALLENGER"
   image_tag("/ranks/CHALLENGER.png",class: "game-rank")
 end
end

def stats(i)
  <p class="game-player-stat">Damage:
    <%= @stats_arr[i]["damage"] %>
  </p>
  <p class="game-player-stat">Kills:
    <%= @stats_arr[i]["kills"] %>
  </p>
  <p class="game-player-stat">Deaths:
    <%= @stats_arr[i]["deaths"] %>
  </p>
  <p class="game-player-stat">Assists:
    <%= @stats_arr[i]["assists"] %>
  </p>
  <% kda = ((@stats_arr[i]["kills"]+@stats_arr[i]["assists"]).to_f/@stats_arr[i]["deaths"]).round(2) %>
  <% if @stats_arr[i]["kills"] > 1 && @stats_arr[i]["deaths"] == 0%>
    <p class="game-player-kda-perfect"><%= kda %></p>
  <% elsif kda < 1 %>
    <p class="game-player-kda-bad"><%= kda %>
  <% elsif kda >= 1 && kda < 3%>
    <p class="game-player-kda-avg"><%= kda %>
  <% elsif kda >= 3 && kda < 4%>
    <p class="game-player-kda-good"><%= kda %>
  <% elsif kda >= 4%>
    <p class="game-player-kda-gg"><%= kda %>
  <% end%>
end
