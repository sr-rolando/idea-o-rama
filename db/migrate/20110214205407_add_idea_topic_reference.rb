class AddIdeaTopicReference < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.integer "topic_id"
      # uses the 'foreigner' gem:
      t.foreign_key :topics, :dependent => :delete
    end
  end

  def self.down
    change_table :ideas do |t|
      t.remove :topics_id
    end
  end
end
