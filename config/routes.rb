Rails.application.routes.draw do
  match('adventures', {:via => :get, :to => 'adventures#index'})
  match('adventures/new', {:via => :get, :to => 'adventures#new'})
  match('adventures', {:via => :post, :to => 'adventures#create'})
  match('adventures/:id', {:via => :get, :to => 'adventures#show'})
  match('adventures/:id/edit', {via: :get, to: 'adventures#edit'})
  match('adventures/:id', {:via => [:patch, :put], :to => 'adventures#update'})
  match('adventures/:id', {:via => :delete, :to => 'adventures#destroy'})

  match('adventures/adventure_id/chapters', {:via => :get, :to => 'chapters#index'})
  match('adventures/adventure_id/chapters/new', {:via => :get, :to => 'chapters#new'})
  match('adventures/adventure_id/chapters', {:via => :post, :to => 'chapters#create'})
  match('adventures/adventure_id/chapters/:id', {:via => :get, :to => 'chapters#show'})
  match('adventures/adventure_id/chapters/:id/edit', {via: :get, to: 'chapters#edit'})
  match('adventures/adventure_id/chapters/:id', {:via => [:patch, :put], :to => 'chapters#update'})
  match('adventures/adventure_id/chapters/:id', {:via => :delete, :to => 'chapters#destroy'})
end
