require 'rails_helper'

RSpec.describe 'groups/edit', type: :view do
  let!(:user) do
    test_user
  end

  let!(:group) do
    test_group(user, 'B')
  end

  before(:each) do
    assign(:group, group)
    sign_in user
    render
  end

  it 'renders the edit group form' do
    assert_select 'form[action=?][method=?]', group_path(group), 'post' do
      assert_select 'input[name=?]', 'group[name]'

      assert_select 'input[name=?]', 'group[icon]'
    end
  end

  it 'chech for print more'
end
