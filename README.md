

HTTP             || ROUTE             || Action            || Used For
get                 '/'                  index                homepage w/ signup and login
get                 '/signup'            users/create_user    user signup form
post                '/signup'                                 creates user and logs user in

get                 '/users/login'       show                 user login
post                '/login'             X                    logs user in and shows home page 
