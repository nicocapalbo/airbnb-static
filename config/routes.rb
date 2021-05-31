Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #We are creating the base root access fot the users. When they type our website in their browser, its the first page that will be displayed
  #We can also customize what the ROOT path will be, so we can redicrect the user to a specific one (you guys wil see this in next lectures)
  root to: 'flats#index'

  #We are creating the /flats/:id path, were we are telling the router to redirect to the Flats Controller and to the SHOW method
  #The SHOW method is part of the CRUD (Create-Read-Update-Delete) methods you are going to use almost every time for a website
  # VERB - URL - Controller Action - Custom URL (not necesary)
  get 'flats/:id', to: 'flats#show', as: :flat
  #Our :ID here is the DYNAMIC part of the URL, so we will need to get this data from the params
end
