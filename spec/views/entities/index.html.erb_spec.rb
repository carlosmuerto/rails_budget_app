require 'rails_helper'

RSpec.describe 'entities/index', type: :view do
  let!(:user) do
    test_user
  end

  let!(:groups) do
    [
      test_group(user, 'A'),
      test_group(user, 'B')
    ]
  end

  before(:each) do
    test_entity(user, 'A', groups)
    test_entity(user, 'B', groups)
    assign(:entities, Entity.page)
    sign_in user
    render
  end

  it 'renders a list of entities' do
    expect(rendered).to match(/Entities/)
  end

  it 'chech for print more'
end
