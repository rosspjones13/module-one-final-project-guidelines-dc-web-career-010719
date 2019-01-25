class AddDefaultImgValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :superheros, :img, from: nil, to: "https://d18k5839z5nnfr.cloudfront.net/uploads/blog_post/featured_image/764/superhero-costumes-for-men-1.jpg"
  end
end
