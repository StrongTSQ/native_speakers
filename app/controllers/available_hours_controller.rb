class AvailableHoursController < ApplicationController
  # GET /available_hours
  # GET /available_hours.json
  def index
    @available_hours = AvailableHour.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @available_hours }
    end
  end

  # GET /available_hours/1
  # GET /available_hours/1.json
  def show
    @available_hour = AvailableHour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @available_hour }
    end
  end

  # GET /available_hours/new
  # GET /available_hours/new.json
  def new
    @available_hour = AvailableHour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @available_hour }
    end
  end

  # GET /available_hours/1/edit
  def edit
    @available_hour = AvailableHour.find(params[:id])
  end

  # POST /available_hours
  # POST /available_hours.json
  def create
    @available_hour = AvailableHour.new(params[:available_hour])

    respond_to do |format|
      if @available_hour.save
        format.html { redirect_to @available_hour, notice: 'Available hour was successfully created.' }
        format.json { render json: @available_hour, status: :created, location: @available_hour }
      else
        format.html { render action: "new" }
        format.json { render json: @available_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /available_hours/1
  # PUT /available_hours/1.json
  def update
    @available_hour = AvailableHour.find(params[:id])

    respond_to do |format|
      if @available_hour.update_attributes(params[:available_hour])
        format.html { redirect_to @available_hour, notice: 'Available hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @available_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_hours/1
  # DELETE /available_hours/1.json
  def destroy
    @available_hour = AvailableHour.find(params[:id])
    @available_hour.destroy

    respond_to do |format|
      format.html { redirect_to available_hours_url }
      format.json { head :no_content }
    end
  end
end
