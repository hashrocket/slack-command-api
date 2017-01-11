class ParamsProcessor
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def text
    text_values[0].include?(',') ? timeoff_text : text_values[0]
  end

  def channel
    text_values[1] || ('#' + params[:channel_name])
  end

  def user_name
    params[:user_name]
  end

  private

  def text_values
    params[:text] ? params[:text].split(/(?=#)/).map(&:strip) : [""]
  end

  def timeoff_text
    text_values[0].gsub(' ', '').gsub(',', ' through ')
  end
end
