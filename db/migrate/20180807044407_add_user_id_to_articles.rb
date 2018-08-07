# frozen_string_literal: true

class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    # adds a userID to each article
    add_column :articles, :user_id, :integer
  end
end
