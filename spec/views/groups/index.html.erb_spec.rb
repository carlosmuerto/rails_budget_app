require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
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
    assign(:groups, Group.page)
    sign_in user
    render
  end

  it 'renders a list of Groups' do
    expect(rendered).to match(/Groups/)
  end

  it 'chech for print more'
end
