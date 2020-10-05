class Anime

    attr_accessor :title, :episodes, :genres, :themes
    @@all = []

    def initialize
        @title = ""
        @episodes = ""
        @genres = []
        @theme = []
        @@all << self
    end   

    def self.all
        @@all
    end    
end    