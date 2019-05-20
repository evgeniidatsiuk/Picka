FactoryBot.define do
  factory :image do
    photos { Rack::Test::UploadedFile.new(Rails.root.join('public/apple-touch-icon.png'), 'image/png') }
  end
end
