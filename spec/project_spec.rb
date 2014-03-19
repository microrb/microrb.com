require "rspec"
require "pathname"
require "./lib/micro"

Project.database = Pathname("./spec/fixtures/db/json")

describe Project do
  describe ".get" do
    it "returns project identified by its name" do
      expect(Project.get("soveran/cuba").name).to eql("soveran/cuba")
    end
  end

  describe ".by_tag" do
    let(:cuba) { Project.get("soveran/cuba") }
    let(:hobbit) { Project.get("patriciomacadden/hobbit") }
    let(:sinatra) { Project.get("sinatra/sinatra") }

    it "returns projects with a given tag" do
      projects = Project.by_tag("web")

      expect(projects).to eql([cuba, hobbit, sinatra])
    end
  end

  describe "#short_name" do
    it "returns project name" do
      expect(Project.get("solnic/virtus").short_name).to eql("virtus")
    end
  end

  describe "#tag_list" do
    it "returns space-separated tag list" do
      expect(Project.get("whitequark/ast").tag_list).to eql("utils ast")
    end
  end

  describe "#stars_url" do
    it "returns the url to stargazers" do
      expect(Project.get("whitequark/ast").stars_url).to eql("https://github.com/whitequark/ast/stargazers")
    end
  end

  describe "#forks_url" do
    it "returns the url to forks" do
      expect(Project.get("whitequark/ast").forks_url).to eql("https://github.com/whitequark/ast/network")
    end
  end
end
