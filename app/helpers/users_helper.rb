module UsersHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    redirect_to '/' if !logged_in?
  end

  def error_message_change(email_input_flg, password_input_flg, message)
    if message == 'Emailは不正な値です' && email_input_flg
      return nil
    end
    if message == 'Passwordは8文字以上で入力してください' && password_input_flg
      return nil
    end
    if message == 'Passwordを入力してください' && password_input_flg
      return nil
    end
    if message == 'Password confirmationとPasswordの入力が一致しません'
      return 'Passwordの値が一致しません'
    end
    if message == 'Avatarを入力してください'
      return 'アイコン画像を選択してください'
    end
    return message
  end
end
