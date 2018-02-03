class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # sessionsコントローラー以外でも、sessionhelperに定義したアクションを使用できるようにするため
  include SessionsHelper
end
