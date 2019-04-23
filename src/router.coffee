SearchController = require './controllers/search-controller'

class Router
  constructor: ({mongoDbUri, mongoDbOptions}) ->
    @searchController = new SearchController {mongoDbUri, mongoDbOptions}

  route: (app) =>
    app.get '/', @searchController.find
    app.get '/aliases/:uuid', @searchController.reverseLookup

module.exports = Router
