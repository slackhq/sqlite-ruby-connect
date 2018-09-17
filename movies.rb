require 'sequel'
require 'sqlite3'
require 'pry' # assumes you already have pry installed

#
#  this works after doing the following:
# 1. installing sqlite3 on your machine (e.g., on mac os, `brew install sqlite`)
# 2. type`sqlite3` in the terminal to start running sqlite locally
# 3. create the movies.db database in sqlite (`.open movies.db;`)
# 4. load the sql table you're interested in (e.g., `.read actors.sql`)
#
# this will create the movies.db for you to open & program against
#

# executing statements with just sqlite
db = SQLite3::Database.open "movies.db"

p db.execute('select count(*) from movies')
p db.execute('select count(*) from actors')

# executing statements using the sequel gem
db = Sequel.connect('sqlite://movies.db')
p db[:movies].count
p db[:actors].count