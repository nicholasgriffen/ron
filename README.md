# ron
see and rate quotes from Ron Swanson, courtesy of the [Ron Swanson Quotes API](https://github.com/jamesseanwright/ron-swanson-quotes)
## live 
http://ron-ng.herokuapp.com    
## local
System requirements: Unix-like OS, npm, mix, running postgresql service     
first time here? Try this:     
`git clone git@github.com:nicholasgriffen/ron`            
`cd ron`     
`./setup.sh`    
Then point your browser to localhost:4000

## development 

### client 
The client is a React application, stored in /client. The application was not bootstrapped with any existing tools, e.g., Create React App. It uses Babel (`npm run transpile`) and Webpack (`npm run bundle`) with simple configuration. It is meant to be built with `npm run build`, and served from the server (Phoenix) application at server/priv/static. You only need to start the server once during client dev (`npm run start`). As you develop the client application, you can run `npm run build`, then refresh your browser pointed at localhost:4000 to see changes. 

### server 
The server is a Phoenix application, stored in /server. The application was bootstrapped with `mix phx.new --no-webpack --no-html`. It is meant to interact with a Postgresql database, serving quotes and their associated ratings. It is also meant to serve the client application from server/priv/static. Here are some useful commands to run from the server directory: 
`mix ecto.setup` will create and migrate the database    
`mix run priv/repo/seeds.exs` will fetch all 57 quotes from the Ron Swanson Quotes API, and store them in the database.    
`mix phx.server` will compile the application and run a server listening to localhost:4000    

## deployment strategy

The server application with client bundle is deployed to Heroku using the buildpack at: https://github.com/HashNuke/heroku-buildpack-elixir.git    
Note that it is unnecessary to deploy the client application, and Heroku has difficulty if the deployment is attempted from the top level of this repo. I built the client application and copied the server application (with client at priv/static) to a new repo. Then I deployed that new repo following instructions at https://hexdocs.pm/phoenix/heroku.html. 
