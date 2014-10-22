class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string    :game_title
      t.string    :game_photo
      t.string    :release_date
      t.string    :platform
      t.string    :platform_img
      t.text      :plot
      t.string    :publisher
      t.string    :developer
      t.string    :genres
      t.string    :esrb_rating
      t.string    :rating
      t.string    :youtube

    end
  end
end
