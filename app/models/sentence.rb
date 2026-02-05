require "json"

class Sentence
  @@sentences = JSON.load(File.read("./public/sentences.json"))

  def self.get(sentences: 6, paragraphs: 3)
    paragraphs.times.map do
      @@sentences.sample(sentences)
    end
  end
end
