require "rspec"

describe Project do
  describe ".get" do
    it "returns project identified by its name" do
      expect(Project.get("cuba").name).to eql("cuba")
    end
  end

  describe ".by_tag" do
    let(:cuba) { Project.get("cuba") }
    let(:sinatra) { Project.get("sinatra") }

    it "returns projects with a given tag" do
      projects = Project.by_tag("web")

      expect(projects).to eql([cuba, sinatra])
    end
  end
end
