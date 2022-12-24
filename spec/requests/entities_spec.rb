require 'rails_helper'

RSpec.describe '/entities', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    test_user
  end

  let!(:groups) do
    [
      test_group(user, 'A'),
      test_group(user, 'B')
    ]
  end

  let!(:valid_attributes) do
    {
      name: 'test_entity_name',
      amount: '9.99',
      author: user,
      groups:
    }
  end

  let!(:valid_attributes_params) do
    params = valid_attributes.clone
    params[:groups] = groups.map(&:id)
    params
  end

  let!(:valid_new_attributes_params) do
    {
      name: 'test_new_entity_name',
      amount: '11.11',
      groups: [groups.map(&:id)[0]]
    }
  end

  let!(:invalid_attributes) do
    invalid = valid_attributes.clone
    invalid[:name] = ''
    invalid
  end

  let!(:invalid_attributes_params) do
    invalid = valid_attributes_params.clone
    invalid[:name] = ''
    invalid
  end

  before(:each) do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Entity.create! valid_attributes
      get entities_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      entity = Entity.create! valid_attributes
      get entity_url(entity)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_entity_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      entity = Entity.create! valid_attributes
      get edit_entity_url(entity)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Entity' do
        expect do
          post entities_url, params: { entity: valid_attributes_params }
        end.to change(Entity, :count).by(1)
      end

      it 'redirects to the created entity' do
        post entities_url, params: { entity: valid_attributes_params }
        expect(response).to redirect_to(entity_url(Entity.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Entity' do
        expect do
          post entities_url, params: { entity: invalid_attributes_params }
        end.to change(Entity, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post entities_url, params: { entity: invalid_attributes_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested entity' do
        entity = Entity.create! valid_attributes
        patch entity_url(entity), params: { entity: valid_new_attributes_params }
        entity.reload
        expect(entity.name).to eq(valid_new_attributes_params[:name])
        expect(entity.amount.to_s).to eq(valid_new_attributes_params[:amount])
        expect(entity.groups.map(&:id)).to eq(valid_new_attributes_params[:groups])
      end

      it 'redirects to the entity' do
        entity = Entity.create! valid_attributes
        patch entity_url(entity), params: { entity: valid_new_attributes_params }
        entity.reload
        expect(response).to redirect_to(entity_url(entity))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        entity = Entity.create! valid_attributes
        patch entity_url(entity), params: { entity: invalid_attributes_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested entity' do
      entity = Entity.create! valid_attributes
      expect do
        delete entity_url(entity)
      end.to change(Entity, :count).by(-1)
    end

    it 'redirects to the entities list' do
      entity = Entity.create! valid_attributes
      delete entity_url(entity)
      expect(response).to redirect_to(entities_url)
    end
  end
end
