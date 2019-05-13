class TemplateOne < ApplicationRecord
  mount_uploader :about_image, PageImageUploader

  private

  FRONT_END_COLOUR = %w(
  red
  blue
  black
  green)
end
