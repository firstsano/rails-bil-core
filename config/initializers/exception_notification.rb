if Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
    :email => {
      :email_prefix => "[RCORE ERROR] ",
      :sender_address => %{"notifier" <dev@vgg.ru>},
      :exception_recipients => %w{dev@vgg.ru}
    }
end
