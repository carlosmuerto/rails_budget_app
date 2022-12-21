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

  it 'renders attributes in <p>' do
    expect(rendered).to match(/#{entity.name}/)
    expect(rendered).to match(/#{entity.amount}/)
  end

  it 'chech for print more'
end
