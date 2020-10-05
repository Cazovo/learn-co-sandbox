class CLI
    
    def menu
        puts "Welcome to AnimeSearch"
        puts "1. Most Relevant"
        puts "2. Search Anime"

        choice = gets.chomp.to_i
        case choice
            when 1 
                printMostRelevantSubMenu
        
            when 2
                printCustomSearchSubMenu  
            else
                print "Invalid Input"
                menu          
        end
    end

    def printMostRelevantSubMenu
        puts "1. Most recent Anime"
        puts "2. Most recent Manga"
    
        choice = gets.chomp.to_i
        api = API.new
        case choice
            when 1
                puts "Most Recent Anime\n"
                puts "===============================" 
              data = api.most_recent("148")
              data['report']['item'].each do |anime|
                puts anime['anime']
            end
            when 2
                puts "Most Recent Manga\n"
                puts "==============================="
               data = api.most_recent("149")   
               data['report']['item'].each do |anime|
                     puts anime['manga']
                end
            else 
                print "Invalid Input"
                menu
        end
        print "\n\n"
        menu
    end

    def printCustomSearchSubMenu
        print "Search Anime: "
        choice = gets 
        api = API.new
        data = api.get_anime_info_by_name(choice)
        episodeCount = 0
        data['ann']['anime'].each do |anime|
        if anime['type'] == 'TV'
            puts "Rating:" + anime['ratings']['weighted_score']
            episodeCount = anime['episode'].size
            puts "Number of episodes: #{episodeCount}"
            puts "EPISODES"
            puts "==============================="
            anime['episode'].each do |episode|
                puts episode['title']
            end
        end 
    end
        print "\n\n"
        menu
    end
end    

