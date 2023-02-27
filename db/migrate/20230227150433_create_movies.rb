class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.float :rating
      t.string :poster_url

      t.timestamps
    end
  end
end
