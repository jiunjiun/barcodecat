class Admin::EventsController < AdminController

  expose :events, -> { Event.all.order(created_at: :desc) }
  expose :event

  def index
  end

  def show
  end

  def new
  end

  def create
    if event.save
      redirect_to admin_event_path(event), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if event.update event_params
      redirect_to admin_event_path(event), notice: t('helpers.successfully_updated')
    else
      render :new
    end
  end

  def destroy
    event.destroy
    redirect_to admin_events_path, notice: t('helpers.successfully_destroy')
  end

  private
  def event_params
    params.require(:event).permit(:title, :desc, :link_name, :enable)
  end
end
