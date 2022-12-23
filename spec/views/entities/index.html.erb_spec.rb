require 'rails_helper'

RSpec.describe 'entities/index', type: :view do
  let!(:user) do
    test_user
  end

  let!(:groups) do
    [
      test_group(user, 'A group'),
      test_group(user, 'B group')
    ]
  end

  let!(:entities) do
    [
      test_entity(user, 'A entity', groups),
      test_entity(user, 'B entity', groups)
    ]
  end

  before(:each) do
    assign(:entities, Entity.page)
    sign_in user
    render
  end

  it 'renders a list of Transactions' do
    expect(rendered).to match(/Transactions/)
  end

  describe 'Transactions info' do
    it 'render Transactions name' do
      entities.each do |entity|
        expect(rendered).to match(/#{entity.name}/)
      end
    end

    it 'render Transactions amount' do
      entities.each do |entity|
        expect(rendered).to match(/#{entity.amount}/)
      end
    end

    it 'render Transactions create at' do
      entities.each do |entity|
        expect(rendered).to match(/#{entity.created_at.to_fs(:short)}/)
      end
    end
  end
end
