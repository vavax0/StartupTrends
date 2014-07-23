class AddAttachmentWebsiteThumbnailToStartups < ActiveRecord::Migration
  def self.up
    change_table :startups do |t|

      t.attachment :website_thumbnail

    end
  end

  def self.down

    drop_attached_file :startups, :website_thumbnail

  end
end
