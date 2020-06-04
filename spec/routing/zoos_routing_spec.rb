require "rails_helper"

RSpec.describe ZoosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/zoos").to route_to("zoos#index")
    end

    it "routes to #new" do
      expect(get: "/zoos/new").to route_to("zoos#new")
    end

    it "routes to #show" do
      expect(get: "/zoos/1").to route_to("zoos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/zoos/1/edit").to route_to("zoos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/zoos").to route_to("zoos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/zoos/1").to route_to("zoos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/zoos/1").to route_to("zoos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/zoos/1").to route_to("zoos#destroy", id: "1")
    end
  end
end
