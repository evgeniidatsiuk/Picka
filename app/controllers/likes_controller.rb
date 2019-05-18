class LikesController < ApplicationController
before_action :find_image
before_action :find_like, only: [:destroy]

def create
 if liked?
 else
   @image.likes.create(user_id: current_user.id)
 end
 redirect_back(fallback_location: root_path)
end

def destroy
 if !(liked?)
   flash[:notice] = "Cannot unlike"
 else
   @like.destroy
 end
 redirect_back(fallback_location: root_path)
end

def find_like
  @like = @image.likes.find(params[:id])
end


private

def liked?
 Like.where(user_id: current_user.id, image_id:
 params[:image_id]).exists?
end

def find_image
 @image = Image.find(params[:image_id])
end

end
