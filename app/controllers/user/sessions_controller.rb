class User::SessionsController < Devise::SessionsController
    layout 'non_user'
end
