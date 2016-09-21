require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'helpers/'
  add_filter 'channels/'
  add_filter 'mailers/'
  add_filter '/models/application_record.rb'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def setup_for_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    :provider => 'facebook',
    :info => { :uid => '123545',
               :name => 'Roberta Doyle',
               :email => 'roberta@example.com',
               :image => 'http://link_to_profile_image'
             },
    credentials: { :token => '123ABC'}
    })
end