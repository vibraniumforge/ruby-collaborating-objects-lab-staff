class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(input)
    artist = input.split(" - ").first
    songname = input.split(" - ")[1]
    new_song = self.new(songname)
    new_song.artist_name = artist
    new_song.save
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def save
    @@all << self
    self
  end

  def self.find_by_artist(artist)
    binding.pry
    Song.all.select do | song |
      song.artist == artist
    end
  end

end