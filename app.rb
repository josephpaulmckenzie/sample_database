require 'rubygems'
#require 'data_mapper'
#require 'dm-is-reflective'
require 'sequel'
require 'sinatra'

#DataMapper.setup(:default, 'sqlite:C:/Users/Daniel/ruby/code_samples/database/db/hotels.db')
DB = Sequel.sqlite('./db/hotels.db')

dataset = DB[:Hotels]

#class Hotels
#  
#  include DataMapper::Resource
#  
#  is :reflective
#  
#  reflect
#
##  property :ID, Serial, :key => true
##  property :Name, Text
##  property :PhysicalAddress, Text
##  property :Type, Text
#  
#end
#
#DataMapper.finalize

#Hotels.auto_migrate!

get '/data' do
#  erb :database, :locals => {:data => Hotels.all}
  erb :database, :locals => {:data => dataset}
end

post '/data' do
  name = params[:name]
  address = params[:address]
  type = params[:type]
  
#  new = Hotels.create(:Name => name, :Address => address, :Type => type)
  dataset.insert(:Name => name, :Address => address, :Type => type)
  erb :database, :locals => {:data => dataset}
end

# Lines 15 - 18 and line 23 are used when setting up a new database
# Reflective - lines 3, 11, and 13 - are for using the schema of an existing database