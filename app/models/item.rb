class Item < ActiveRecord::Base
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  # mount_uploader :avatar, AvatarUploader

  after_initialize {}
  after_save {}
  after_create {}
  after_update {}
  after_destroy {}


end
