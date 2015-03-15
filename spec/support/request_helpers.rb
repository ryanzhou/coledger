module RequestHelpers

  def auth
    @session = create(:session)
    @user = @session.user
    header("Authorization", ActionController::HttpAuthentication::Token.encode_credentials(@session.token))
  end

  def get_json(uri)
    get(uri, @headers)
  end

  def post_json(uri, hash = {})
    add_json_headers
    post(uri, hash.to_json)
  end

  def patch_json(uri, hash = {})
    add_json_headers
    patch(uri, hash.to_json)
  end

  def delete_json(uri, hash = {})
    add_json_headers
    delete(uri, hash.to_json)
  end

  def json
    JSON.parse(last_response.body)
  end

  def add_json_headers
    header("Accept", "application/json")
    header("Content-Type", "application/json")
  end
end
