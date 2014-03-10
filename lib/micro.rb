require "virtus"
require "json"
require "open-uri"
require "pathname"

DATA_PATH = Pathname(__FILE__).join('../../data').expand_path
PROJECTS  = DATA_PATH.join('projects.json')
DATABASE  = DATA_PATH.join('db.json')

class Tag
  def self.all
    @all ||= Project.all.flat_map(&:tags).uniq.sort
  end
end

class GithubProject
  URL = "https://api.github.com/repos/%s".freeze

  MAPPING = {
    "html_url" => "website",
    "url" => "github_url",
    "stargazers_count" => "stars",
    "description" => "description",
    "forks" => "forks"
  }.freeze

  attr_reader :data

  def initialize(id)
    @id = id
    @url = URL % id
    @data = JSON.parse(open(@url).read)
  end

  def attributes
    @attributes ||= MAPPING.each_with_object({}) { |(k,v), h| h[v] = data[k] }
  end
end

class Project
  include Virtus.model

  attribute :name, String
  attribute :description, String
  attribute :github_url, String
  attribute :website, String
  attribute :stars, Integer
  attribute :tags, Array[String]

  class << self
    attr_accessor :database
  end

  self.database = DATABASE

  def self.update_data
    base = JSON.load(File.read(PROJECTS))

    full = base.map do |json|
      puts "updating #{json["name"]}..."
      GithubProject.new(json["name"]).attributes.update(json)
    end

    File.open(DATABASE, "w") { |f| f << full.to_json }
  end

  def self.get(name)
    all.detect { |project| project.name == name }
  end

  def self.all
    @all ||= data.map { |json| new(json) }.sort_by(&:short_name)
  end

  def self.by_tag(tag)
    all.select { |project| project.tags.include?(tag) }
  end

  def self.data
    @data ||= JSON.load(File.read(DATABASE))
  end

  def short_name
    name.split("/").last
  end

  def tag_list
    tags.join(" ")
  end
end
