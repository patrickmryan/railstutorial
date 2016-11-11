Rails.application.routes.draw do
  get 'users/new'

  self.root('static_pages#home')
  self.get('/help',    to: 'static_pages#help')
  self.get('/about',   to: 'static_pages#about')
  self.get('/contact', to: 'static_pages#contact')
end