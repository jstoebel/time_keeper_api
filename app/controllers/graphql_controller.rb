require 'json_web_token'
class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session
  def execute
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # we need to provide session and current user
      session:      session,
      current_user: current_user,
    }
    result = TimeKeeperApiSchema.execute(query, context: context, operation_name: operation_name)
    render json: result
  end

  private

  # attempts to retrieve user based on a jwt. returns nil if none found.
  def current_user
    build_payload!
    return if !@payload || !JsonWebToken.valid_payload(@payload)
    User.find_by(id: @payload['user_id'])
  end

  # Deconstructs the Authorization header and decodes the JWT token.
  # Returns decoded token. Example structure: 
  # {"user_id"=>1, "exp"=>1536795537, "iss"=>"issuer_name", "aud"=>"client"}, {"alg"=>"HS256"}
  def build_payload!
    auth_header = request.headers['Authorization']
    return if auth_header.blank?
    token = auth_header.split(' ').last
    @payload = JsonWebToken.decode(token).first
  end
end
