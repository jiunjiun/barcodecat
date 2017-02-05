class ChangeEventMetaToMeta < ActiveRecord::Migration[5.0]
  def change
    Event.all.each do |event|
      event.create_meta desc: event.desc, keywords: event.keywords
    end

    remove_column :events, :keywords
    remove_column :events, :image
  end
end
