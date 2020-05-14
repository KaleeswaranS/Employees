Rails.application.routes.draw do

 devise_for :customers,
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

resources :employees

post "/dashboard", to: "dashboard#dashboard"
get "dashboard", to: "dashboard#index"
get "employees", to: 'employees#index' 

get "dashboard/profiles", to: "employees#profiles"
post "dashboard", to:"dashboard#create"
# get "dashboard", to: "dashboard#show" 
get "update", to: "employees#update"
get "create", to: "dashboard#employees_create"
post "dashboard/create", to:"employees#create"
get "employee_view", to:"employees#employee_view"
# post "signup_user_create", to: "employees#signup_user_create"
get "signup", to: "employees#signup", as: "signup" 
# post "dashboard", to: "employees#dashboard"
get "dashboard/edit", to: "employees#edit"
# put "dashboard/profiles", to:"employees#update"
get "dashboard/update", to:"dashboard#update"


get "project", to:"employees#project"

resources :employees, only: [] do
  collection do
    get 'employees_by_project', to: "dashboard#project"
    get 'employees_by_name', to: "dashboard#chart"
  end
end


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
