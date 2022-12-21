require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create(
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
    )
  end

  it 'valid with all correct atributes' do
    expect(user).to be_valid
  end

  it 'invalid if name is nil' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'invalid if email is nil' do
    user.email = nil
    expect(user).to_not be_valid
  end
  it 'invalid if password is too short' do
    user.password = '1'
    expect(user).to_not be_valid
  end
end
