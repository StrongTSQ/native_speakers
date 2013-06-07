class ProfilesController < ApplicationController

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
