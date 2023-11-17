require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'routes root to gigs#index' do
    expect(get: '/').to route_to('gigs#index')
  end

  it 'routes GET /signup to users#new' do
    expect(get: '/signup').to route_to('users#new')
  end

  it 'routes GET /login to sessions#new' do
    expect(get: '/login').to route_to('sessions#new')
  end

  it 'routes POST /login to sessions#create' do
    expect(post: '/login').to route_to('sessions#create')
  end

  it 'routes DELETE /logout to sessions#destroy' do
    expect(delete: '/logout').to route_to('sessions#destroy')
  end

  it 'routes GET /change_language to application#change_language' do
    expect(get: '/change_language').to route_to('application#change_language')
  end

  it 'routes GET /gigs/1/complete to gigs#complete' do
    expect(post: '/gigs/1/complete').to route_to('gigs#complete', id: '1')
  end

  it 'routes GET /gigs/1/accept to gigs#accept' do
    expect(post: '/gigs/1/accept').to route_to('gigs#accept', id: '1')
  end

  it 'routes resources :gigs' do
    expect(get: '/gigs').to route_to('gigs#index')
    expect(post: '/gigs').to route_to('gigs#create')
    expect(get: '/gigs/new').to route_to('gigs#new')
    expect(get: '/gigs/1').to route_to('gigs#show', id: '1')
    expect(get: '/gigs/1/edit').to route_to('gigs#edit', id: '1')
    expect(put: '/gigs/1').to route_to('gigs#update', id: '1')
    expect(patch: '/gigs/1').to route_to('gigs#update', id: '1')
    expect(delete: '/gigs/1').to route_to('gigs#destroy', id: '1')
  end

  it 'routes resources :users' do
    expect(get: '/users').to route_to('users#index')
    expect(post: '/users').to route_to('users#create')
    expect(get: '/users/new').to route_to('users#new')
    expect(get: '/users/1').to route_to('users#show', id: '1')
    expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
    expect(put: '/users/1').to route_to('users#update', id: '1')
    expect(patch: '/users/1').to route_to('users#update', id: '1')
    expect(delete: '/users/1').to route_to('users#destroy', id: '1')
  end
end
