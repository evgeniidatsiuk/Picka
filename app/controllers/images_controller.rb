class ImagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_image, only: %i[show edit update destoy]

  def index
  @images = Image.all
  end

  def new
  @image = Image.new
  end

  def create
  @image = current_user.images.build(image_params)
  if @image.save
  redirect_to image_path(@image.id)
  else
  render 'new'
  end
  end

  def show
  end

  def edit
  end

  def update
   if @image.update(image_params)
    redirect_to image_path(@image.id)
    else render 'edit'
   end
  end

  def destroy
  if @image.present?
    @image.destroy
  end
    redirect_to root_path
   end

  private

  def find_image
  @image = Image.find_by(id: params[:id])
  end

  def image_params
  params.require(:image).permit(:user_id, :description, photos: [])
  end

end
