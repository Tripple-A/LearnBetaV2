class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :shortDescription
      t.string :url
      t.string :imgUrl
      t.float :providerRatings
      t.string :duration
      t.string :provider
      t.string :author
      t.string :level
      t.string :medium
      t.string :language
      t.string :category
      t.string :broad_category
      t.text :tags
      t.timestamps
    end
  end
end
