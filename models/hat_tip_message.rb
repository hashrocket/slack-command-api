class HatTipMessage
  def construct_message(text, user_name)
    ":boom: #{user_name} tips their hat to #{text}! :ok_hand:"
  end

  def bot_name
    'Hat Tipper'
  end

  def icon_emoji
    ':tophat:'
  end
end
