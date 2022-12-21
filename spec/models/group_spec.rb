require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:author) do
    test_user
  end

  let!(:group) do
    Group.new(
      name: 'test_group_name',
      icon: 'test_group_Icon',
      author:
    )
  end

  it 'valid with all correct atributes' do
    expect(group).to be_valid
  end

  it 'invalid if name nil' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'invalid if icon nil' do
    group.icon = nil
    expect(group).to_not be_valid
  end

  it 'invalid if author nil' do
    group.author = nil
    expect(group).to_not be_valid
  end
end
