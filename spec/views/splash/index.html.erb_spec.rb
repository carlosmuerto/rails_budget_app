require 'rails_helper'

RSpec.describe 'splash/index.html.erb', type: :view do

  before(:each) do
    render
  end

  it 'render Sign up' do
    expect(rendered).to match(/Sign up/)
  end

  it 'render Log in' do
    expect(rendered).to match(/Log in/)
  end

  it 'render notification bar' do
    expect(rendered).to match(/notification-bar/)
  end

  it 'dues not render header' do
    expect(rendered).to_not match(/<header>/)
  end
   
end
