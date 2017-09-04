ActionDispatch::Http::Parameters::DEFAULT_PARSERS[:api_json] = lambda do |body|
  JSON.parse(body)
end
ActionDispatch::Request.parameter_parsers = ActionDispatch::Request::DEFAULT_PARSERS
