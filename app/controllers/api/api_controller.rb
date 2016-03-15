class Api::ApiController < ApplicationController

   skip_before_action :verify_authenticity_token

   rescue_from ActiveRecord::RecordNotFound, with: :not_found
   rescue_from ActionController::ParameterMissing, with: :malformed_request

   private
   def authenticated?
     authenticate_or_request_with_http_basic do |email, password|
       User.where( email: email).first.valid_password?(password)
     end
   end

   def malformed_request
     render json: {error: "The request could not be understood by the server due to malformed syntax. The client SHOULD NOT repeat the request without modifications.", status: 400}, status: 400
   end

   def not_found
     render json: {error: "Record not found", status: 404}, status: 404
   end
 end
