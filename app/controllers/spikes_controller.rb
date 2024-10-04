class SpikesController < ApplicationController
    before_action :require_login
    before_action :set_spike, only: %i[edit update destroy]
  
    def index
      @spikes = current_user.spikes.order(created_at: :desc).page(params[:page]).per(8)
    end
  
    def show
      @spike = current_user.spikes.find(params[:id])
    end
  
    def new
      @spike = Spike.new
    end
  
    def create
      @spike = current_user.spikes.build(spike_params)
      if @spike.save
        redirect_to spikes_path, notice: t('spikes.create.success')
      else
        flash.now[:alert] = t('spikes.create.failure')
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit; end
  
    def update
      if @spike.update(spike_params)
        redirect_to spikes_path, notice: t('spikes.update.success')
      else
        flash.now[:alert] = t('spikes.update.failure')
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @spike.destroy
      redirect_to spikes_path, notice: t('spikes.destroy.success'), status: :see_other
    end
  
    private
  
    def set_spike
      @spike = current_user.spikes.find(params[:id])
    end
  
    def spike_params
      params.require(:spike).permit(:name, :image, :memory)
    end
  end