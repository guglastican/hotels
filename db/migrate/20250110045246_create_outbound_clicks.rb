class CreateOutboundClicks < ActiveRecord::Migration[7.2]
  def change
    create_table :outbound_clicks do |t|
      t.belongs_to :organization
      t.belongs_to :subject, polymorphic: true

      t.string :url

      t.timestamps
    end
  end
end
