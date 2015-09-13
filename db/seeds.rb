# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.create( name:'To do' )
Status.create( name:'In progress' )
Status.create( name:'To check' )
Status.create( name:'Checking' )
Status.create( name:'Checked' )
Status.create( name:'Done' )

User.create( login:'admin',     password:'admin', name:'Administrator',    admin: true )
User.create( login:'pba',       password:'pba',   name:'Pierre Bazonnard', admin: false )
User.create( login:'anonymous', password:'',      name:'Anonymous user',   admin: false )

Project.create( name: 'project #1', description: 'first project')
Project.create( name: 'project #2', description: 'second project')

Issue.create( subject: 'one issue', description: 'sample issue', status: 'To do' )
Issue.create( subject: 'another issue', description: 'hummm !', status: 'To do' )
Issue.create( subject: 'question',  description: 'question', status: 'To do' )
