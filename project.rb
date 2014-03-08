require "virtus"
require "json"

class Project
  include Virtus.model

  attribute :name, String
  attribute :repo, String
  attribute :tags, Array[String]

  def self.get(name)
    all.detect { |project| project.name == name }
  end

  def self.all
    @all ||= data.map { |json| new(json) }.sort_by(&:name)
  end

  def self.by_tag(tag)
    all.select { |project| project.tags.include?(tag) }
  end

  def self.data
    @data ||= JSON.load(File.read("./index.json"))
  end
end
