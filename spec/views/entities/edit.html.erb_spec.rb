require 'rails_helper'

RSpec.describe 'entities/edit', type: :view do
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
    assign(:groups, Group.all)
    sign_in user
    render
  end

  it 'renders the edit entity form' do
    render

    assert_select 'form[action=?][method=?]', entity_path(entity), 'post' do
      assert_select 'input[name=?]', 'entity[name]'

      assert_select 'input[name=?]', 'entity[amount]'
    end
  end
end
