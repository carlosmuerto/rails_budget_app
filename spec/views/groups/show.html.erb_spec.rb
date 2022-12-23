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

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{group.name}/)
    expect(rendered).to match(/#{group.icon}/)
  end

  it 'chech for print more'
end
