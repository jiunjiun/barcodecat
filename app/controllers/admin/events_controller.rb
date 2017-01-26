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
      redirect_to admin_event_path event
    else
      render :new
    end
  end

  def edit
  end

  def update
    if event.update event_params
      redirect_to admin_event_path event
    else
      render :new
    end
  end

  def destroy
    event.destroy
    redirect_to admin_events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :desc, :url_name, :enable)
  end
end
