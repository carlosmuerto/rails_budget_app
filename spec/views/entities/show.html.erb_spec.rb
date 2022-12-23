require 'rails_helper'

RSpec.describe 'entities/show', type: :view do
  let!(:user) do
    test_user
  end

  let!(:groups) do
    [
      test_group(user, 'A'),
      test_group(user, 'B')
    ]
  end

  let!(:entity) do
    test_entity(user, 'A', groups)
  end

  before(:each) do
    assign(:entity, entity)
    sign_in user
    render
  end

  describe 'renders transaction info' do
    it 'render transaction name' do
      expect(rendered).to match(/#{entity.name}/)
    end

    it 'render transaction amount' do
      expect(rendered).to match(/#{entity.amount}/)
    end

    it 'render transaction amount' do
      expect(rendered).to match(/#{entity.amount}/)
    end

    it 'render transaction create at' do
      expect(rendered).to match(/#{entity.created_at.to_fs(:short)}/)
    end
  end
end
