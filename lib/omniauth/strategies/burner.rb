#--
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Burner < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site           => 'https://app.burnerapp.com',
        :authorize_url  => 'https://app.burnerapp.com/oauth/authorize',
        :token_url      => 'https://api.burnerapp.com/oauth/access'
      }

      option :name, 'burner'

      option :authorize_options, [:scope]

      uid { raw_info['id'] }

      info do
        prune!(raw_info)
      end

      def raw_info
        pp access_token.params
        @raw_info ||= {connected_burners: access_token.params['connected_burners']}
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

    end
  end
end

OmniAuth.config.add_camelization 'burner', 'Burner'
