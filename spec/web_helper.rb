def add_tag(tag)
  fill_in "Tags", with: tag
  click_button "Add"
end

def set_omniauth(opts = {})
  default = {:provider => :github,
             :uuid     => "1234",
             :github => {
                            :email => "example@example.com"
                        }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
      "user_hash" => {
        "email" => user_hash[:email]
      }
    }
  }

end

def set_invalid_omniauth(opts = {})

  credentials = { :provider => :github,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end
