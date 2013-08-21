require 'will_paginate/array'
class ProfilesController < ApplicationController


  def select_appointment_date
    @profile = Profile.find(params[:id])
    @date = Date.parse(params[:date])
  end
  # Make a appointment
  def make_appointment
    @profile = Profile.find(params[:id])
  end
  #send out a request
  def send_request
    @profile = Profile.find(params[:id])
    @date = Date.parse(params[:alternate])
    topic = params[:topic]
    proficiency = params[:proficiency]
    if params[:slot]
      params[:slot].each do |slot|
        from = @profile.available_slots(@date)[slot.to_i].first
        from = Time.mktime(@date.year, @date.month, @date.day, from.hour, from.min)
        to = @profile.available_slots(@date)[slot.to_i].second
        to = Time.mktime(@date.year, @date.month, @date.day, to.hour, to.min)
        @appointment = Appointment.new(requester_id: current_user.id, tutor_id: @profile.user.id, from: from, to: to, topic: topic, proficiency: proficiency)
        if @appointment.save
          UserMailer.appointment_email(@appointment).deliver
        else
          flash[:error] = "Errors prevented the appointment from sending"
        end
      end
    end
    redirect_to root_path, notice: "Appointment sent to #{@profile.user.username} for Approval"
  end

  #overview my calendar
  def calendar
    @profile = Profile.find(params[:id])
  end
  
  #review the incoming appointments
  def appointments
    @profile = Profile.find(params[:id])
    @appointments = Appointment.find_all_by_tutor_id(current_user.id)
    
  end
  #review the outgoing requests
  def requests
    @profile = Profile.find(params[:id])
    @requests = Appointment.find_all_by_requester_id(current_user.id)
  end

  def search 
    @native_language = params[:search_field]
    @profiles = Profile.by_native_language(@native_language).paginate(page: params[:page], per_page: 5)
  end

  #user's dashboard
  def dashboard
    if current_user.profile.blank?
      redirect_to new_profile_path
    else
      redirect_to current_user.profile
    end
  end

  # add language skill to profile
  def add_language_skill
    @profile = Profile.find(params[:id])
    user = @profile.user
    LanguageSkill.destroy_all(["user_id = ?", user.id])
    params[:language].keys.each do |language_id|
      if params[:language]["#{language_id}"][:check]=='1'
        language = Language.find(language_id).name
        skill = LanguageSkill.new
        skill.language = language
        skill.user_id = user.id
        skill.degree = params[:language]["#{language_id}"][:efficiency]
        skill.save
        flash[:success] = 'Language Skills Updated'
      end
    end
  end

  # remove language skill from profile
  def remove_language_skill
    @profile = Profile.find(params[:id])
    LanguageSkill.destroy_all(['id=?', params[:skill_id]])
  end
  # GET /profiles
  # GET /profiles.json
  
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
