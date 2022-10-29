module PostsHelper
  def post_error_message_change(message)
    if message == 'Rewardを入力してください'
      return '報酬額を入力してください'
    end
    return message
  end

end
