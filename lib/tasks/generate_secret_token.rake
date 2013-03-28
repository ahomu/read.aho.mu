namespace :secret do
  secret_token_file = Rails.root.join('config', 'initializers', 'secret_token.rb')

  file secret_token_file do
    require 'securerandom'
    token = SecureRandom.hex(64)

    require 'active_support/core_ext/string/strip'
    application_name = Rails.application.class.name
    content = <<-EOS.strip_heredoc
#{application_name}.config.secret_token = '#{token}'
    EOS

    secret_token_file.open('w') do |f|
      f.write(content)
    end

    puts "Generated secret token and write it to #{secret_token_file.relative_path_from(Rails.root)}"
  end

  desc 'Generate secret token'
  task generate: secret_token_file
end