Rails.application.routes.draw do
#customer
  devise_for :customers,skip: [:password,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  #admin
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
end
