# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

User.create( login:'admin',     password:'admin', name:'Administrator',    admin: true )
User.create( login:'pba',       password:'pba',   name:'Pierre Bazonnard', admin: false )
User.create( login:'guest',     password:'',      name:'Guest',   admin: false )

Project.create( name: 'P1', description: 'first project', created_on: '2015-09-12', created_by: 'pba')
Project.create( name: 'P2', description: 'second project', created_on: '2015-09-15', created_by: 'pba')

Issue.create( description: 'sample issue', color: 'red', status: 'To do', project_id: 1, created_on: '2015-09-12', created_by: 'pba', updated_on: '2024-11-18' )
