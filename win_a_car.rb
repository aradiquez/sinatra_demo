require 'sinatra'

set(:probability) { |value| condition { rand <= value } }

get '/', probability: 0.1 do
  "You won!"
end

get '/' do
  "Sorry, you lost."
end

# Privider
# get '/', provides: ['rss', 'atom', 'xml'] do
#   builder :feed
# end

# ===========================================================

# set(:auth) do |*roles|   # <- notice the splat here
#   condition do
#     unless logged_in? && roles.any? {|role| current_user.in_role? role }
#       redirect "/login/", 303 # redirect
#     end
#   end
# end
#
# get "/my/account/", auth: [:user, :admin] do
#   "Your Account Details"
# end
#
# get "/only/admin/", auth: :admin do
#   "Only admins are allowed here!"
# end
