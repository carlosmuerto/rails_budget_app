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

  describe 'render Categories info' do
    it 'render Category icon' do
      groups.each do |group|
        expect(rendered).to match(/#{group.icon}/)
      end
    end

    it 'render Category name' do
      groups.each do |group|
        expect(rendered).to match(/#{group.icon}/)
      end
    end

    it 'render Category count entities' do
      groups.each do |group|
        expect(rendered).to match(/#{group.entities.count}/)
      end
    end

    it 'render Category total amount' do
      groups.each do |group|
        expect(rendered).to match(/#{group.entities.sum(:amount)}/)
      end
    end
  end
end
