require 'rails_helper'

RSpec.describe 'entities/new', type: :view do
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
    assign(:entity, Entity.new)
    assign(:groups, Group.all)
    render
  end

  it 'renders new entity form' do
    assert_select 'form[action=?][method=?]', entities_path, 'post' do
      assert_select 'input[name=?]', 'entity[name]'

      assert_select 'input[name=?]', 'entity[amount]'
    end
  end

  it 'chech for print more'
end
