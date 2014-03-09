require "rspec"
require "./micro"

describe Project do
  describe ".get" do
    it "returns project identified by its name" do
      expect(Project.get("soveran/cuba").name).to eql("soveran/cuba")
    end
  end

  describe ".by_tag" do
    let(:cuba) { Project.get("soveran/cuba") }
    let(:sinatra) { Project.get("sinatra/sinatra") }

    it "returns projects with a given tag" do
      projects = Project.by_tag("web")

      expect(projects).to eql([sinatra, cuba])
    end
  end

  describe "#short_name" do
    it "returns project name" do
      expect(Project.get("solnic/virtus").short_name).to eql("virtus")
    end
  end
end
