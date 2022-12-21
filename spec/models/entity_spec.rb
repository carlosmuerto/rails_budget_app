require 'rails_helper'

RSpec.describe Entity, type: :model do
  let!(:author) do
    test_user
  end

  let!(:groups) do
    [
      test_group(author, 'A'),
      test_group(author, 'B')
    ]
  end

  let!(:entity) do
    Entity.new(
      name: 'test_entity_name',
      amount: '9.99',
      author:,
      groups:
    )
  end

  it 'valid with all correct atributes' do
    expect(entity).to be_valid
  end

  it 'invalid if name nil' do
    entity.name = nil
    expect(entity).to_not be_valid
  end

  it 'invalid if amount nil' do
    entity.amount = nil
    expect(entity).to_not be_valid
  end

  it 'invalid if author nil' do
    entity.author = nil
    expect(entity).to_not be_valid
  end

  it 'invalid if groups is lest that 1' do
    entity.groups = []
    expect(entity).to_not be_valid
  end

  context 'once save' do
    before do
      entity.save
    end

    it 'each entity group should have the entity in its entities' do
      entity.groups.each do |group|
        expect(group.entities).to include(entity)
      end
    end

    it 'on destroy each entity group should not have the entity in its entities' do
      groups = entity.groups

      groups.each do |group|
        expect(group.entities).to include(entity)
      end

      entity.destroy

      groups.each do |group|
        expect(group.entities).to_not include(entity)
      end
    end
  end
end
