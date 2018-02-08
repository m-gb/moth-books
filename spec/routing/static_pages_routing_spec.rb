require 'rails_helper'

RSpec.describe "routing to static pages", type: :routing do
  it "routes root to static_pages#home" do
    expect(get: root_path).
      to route_to(controller: "static_pages", action: "home")
  end
  it "routes about to static_pages#about" do
  expect(get: about_path).
    to route_to(controller: "static_pages", action: "about")
  end
  it "routes contact to static_pages#contact" do
  expect(get: contact_path).
    to route_to(controller: "static_pages", action: "contact")
  end
  it "routes help to static_pages#help" do
  expect(get: help_path).
    to route_to(controller: "static_pages", action: "help")
  end
end
