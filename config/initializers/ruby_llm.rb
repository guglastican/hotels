RubyLLM.configure do |config|
  config.openai_api_key = Rails.application.credentials.dig(:openai, :api_key)
  # config.anthropic_api_key = ENV.fetch('ANTHROPIC_API_KEY', nil)
  # config.gemini_api_key = ENV.fetch('GEMINI_API_KEY', nil)
  # config.deepseek_api_key = ENV.fetch('DEEPSEEK_API_KEY', nil)
end
