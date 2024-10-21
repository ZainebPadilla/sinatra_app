require 'csv'


class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv| #ab = en mode écriture
      csv << [@author, @content] 
    end
  end

  def self.all
    all_gossip = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossip << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossip
  end

  def self.find(id) 
   all_gossip = self.all #récup les gossip
    return all_gossip[id] 
  end
end

