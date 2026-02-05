class SentencesController < ApplicationController
  # GET /sentences or /sentences.json
  def index
    @sentences = Sentence.get(**sentence_params_parsed)

    respond_to do |format|
      format.html
      format.json { render json: @sentences.map { |p| p.join(" ") } }
      format.text { render body: @sentences.map { |p| p.join(" ") }.join("\n\n") }
    end
  end

  private
    def sentence_params
      params.permit(:paragraphs, :sentences, sentence: {})
    end

    def sentence_params_parsed
      # @todo: figure out why :sentence is being instantiated when requested
      # via fetch in the browser
      sentence_params.to_hash
        .except("sentence")
        .transform_keys(&:to_sym)
        .transform_values(&:to_i)
    end
end
