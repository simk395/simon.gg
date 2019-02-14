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
