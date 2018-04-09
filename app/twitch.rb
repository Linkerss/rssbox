# frozen_string_literal: true
# https://dev.twitch.tv/docs/api/

class TwitchError < HTTPError; end

class Twitch < HTTP
  BASE_URL = "https://api.twitch.tv"
  HEADERS = {
    "Client-ID" => ENV["TWITCH_CLIENT_ID"],
  }
  ERROR_CLASS = TwitchError
end

error TwitchError do |e|
  status 503
  "There was a problem talking to Twitch. Please try again in a moment."
end
