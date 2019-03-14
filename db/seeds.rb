# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Status.create( name:'To do' )
Status.create( name:'Work in progress' )
Status.create( name:'To check' )
Status.create( name:'Check in progress' )
Status.create( name:'Checked' )
Status.create( name:'Done' )

User.create( login:'admin',     password:'admin', name:'Administrator',    admin: true )
User.create( login:'pba',       password:'pba',   name:'Pierre Bazonnard', admin: false )
User.create( login:'anonymous', password:'',      name:'Anonymous user',   admin: false )

Project.create( name: 'P1', description: 'first project', created_on: '2015-09-12', created_by: 'pba')
Project.create( name: 'P2', description: 'second project', created_on: '2015-09-15', created_by: 'pba')

Issue.create( description: 'sample issue', status: 'To do', project_id: 1, created_on: '2015-09-12', created_by: 'pba' )
