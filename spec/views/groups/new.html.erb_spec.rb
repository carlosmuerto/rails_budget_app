require 'rails_helper'

RSpec.describe 'groups/new', type: :view do
  let!(:user) do
    test_user
  end

  before(:each) do
    assign(:group, Group.new)
    sign_in user
    render
  end

  it 'renders new group form' do
    assert_select 'form[action=?][method=?]', groups_path, 'post' do
      assert_select 'input[name=?]', 'group[name]'

      assert_select 'select[name=?]', 'group[icon]'
    end
  end

  it 'chech for print more'
end
