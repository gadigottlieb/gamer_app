class GameApi

  def self.search(query)
    raw_response = HTTParty.get("http://thegamesdb.net/api/GetGamesList.php?name=#{(query)}")
    games = raw_response['Data']['Game'] || []
    games.map { |game| game }
  end

  def self.game(id)
    raw_response = HTTParty.get("http://thegamesdb.net/api/GetGame.php?id=#{URI.escape(id)}")
    base_image_url = raw_response['Data']['baseImgUrl']
    image_path = raw_response['Data']['Game']['Images']['boxart'][1]['thumb']
    Game.new(
      game_title: raw_response['Data']['Game']['GameTitle'] || 'Unknown',
      game_photo: base_image_url + image_path,
      release_date: raw_response['Data']['Game']['ReleaseDate'] || 'Unknown',
      platform: raw_response['Data']['Game']['Platform'] || 'Unknown',
      platform_img: base_image_url + "platform/fanart/#{raw_response['Data']['Game']['PlatformId']}-1.jpg",
      plot: raw_response['Data']['Game']['Overview'] || 'Unknown',
      publisher: raw_response['Data']['Game']['Publisher'] || 'Unknown',
      developer: raw_response['Data']['Game']['Developer'] || 'Unknown',
      genres: raw_response['Data']['Game']['Genres']['genre'] || 'Unknown',
      esrb_rating: raw_response['Data']['Game']['ESRB'] || 'Unknown',
      rating: raw_response['Data']['Game']['Rating'] || 'Unknown',
      youtube: raw_response['Data']['Game']['Youtube'] || 'Unknown'
    )
  end
end
