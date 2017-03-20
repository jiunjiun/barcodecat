class Admin::EventsController < AdminController
  expose :events, -> { Event.all.order(created_at: :desc).paginate(page: params[:page], per_page: 30) }
  expose :event

  def index; end

  def show; end

  def new
    event.build_meta
  end

  def create
    if event.save
      redirect_to admin_event_path(event), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if event.update event_params
      redirect_to admin_event_path(event), notice: t('helpers.successfully_updated')
    else
      render :new
    end
  end

  def destroy
    if event.enable
      redirect_to admin_events_path, alert: t('helpers.destroy_fail')
    else
      event.hidden!
      redirect_to admin_events_path, notice: t('helpers.successfully_destroy')
    end
  end

  private

  def event_params
    params.require(:event)
          .permit(:title, :desc, :link_name, :enable,
                  meta_attributes: [:id, :event_id, :desc, :keywords, :image])
  end
end
