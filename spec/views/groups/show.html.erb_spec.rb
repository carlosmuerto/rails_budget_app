require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  let!(:user) do
    test_user
  end

  let!(:group) do
    test_group(user, 'B')
  end

  before(:each) do
    sign_in user
    assign(:group, Group.find(group.id))
    assign(:entities, Group.find(group.id).entities.page)
    render
  end



  describe 'render Category info' do
    it 'render Category icon' do
      expect(rendered).to match(/#{group.icon}/)
    end
  
    it 'render Category name' do
      expect(rendered).to match(/#{group.icon}/)
    end
  
    it 'render Category count entities' do
      expect(rendered).to match(/#{group.entities.count}/)
    end
  
    it 'render Category total amount' do
      expect(rendered).to match(/#{group.entities.sum(:amount)}/)
    end
  end
end