Rails.application.routes.draw do
  self.root('static_pages#home')
  self.get('static_pages/help')
  self.get('static_pages/about')
  self.get('static_pages/contact')
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
