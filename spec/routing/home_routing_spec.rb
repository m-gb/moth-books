require 'rails_helper'

RSpec.describe "routing to static pages", type: :routing do
  it "routes root to static_pages#home" do
    expect(get: root_path).
      to route_to(controller: "static_pages", action: "home")
  end
end
