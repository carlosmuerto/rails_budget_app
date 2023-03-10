class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_entity, except: %i[index new create]
  before_action :find_entities, only: :index
  load_and_authorize_resource

  # GET /entities or /entities.json
  def index
    @header_title = 'TRANSACTIONS'
  end

  # GET /entities/1 or /entities/1.json
  def show
    @header_title = 'DETAILS'
  end

  # GET /entities/new
  def new
    @header_title = 'NEW TRANSACTION'
    @groups = Group.accessible_by(current_ability).all
    @entity = Entity.new
    @selected_group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  # GET /entities/1/edit
  def edit
    @groups = Group.accessible_by(current_ability).all
    @header_title = 'EDITING'
  end

  # POST /entities or /entities.json
  def create
    @entity.author = current_user
    @groups = Group.all

    @entity.groups = params.require(:entity).permit({ groups: [] })[:groups].map do |group_id|
      Group.find(group_id)
    end

    respond_to do |format|
      if @entity.save
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    @entity.groups = params.require(:entity).permit({ groups: [] })[:groups].map do |group_id|
      Group.find(group_id)
    end

    @groups = Group.all

    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_entity
    @entity = Entity.accessible_by(current_ability).includes([:groups]).find(params[:id])
  end

  def find_entities
    @entities = Entity.accessible_by(current_ability).order(created_at: :desc).includes([:groups]).page(params[:page])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
