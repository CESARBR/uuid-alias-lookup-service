_ = require 'lodash'
mongojs = require 'mongojs'
Datastore = require 'meshblu-core-datastore'
http = require 'http'

class AliasService
  constructor: ({mongoDbUri, mongoDbOptions}) ->
    @datastore = new Datastore
      database: mongojs mongoDbUri, null, mongoDbOptions
      collection: 'aliases'

  find: ({name}, callback) =>
    @datastore.findOne {name}, (error, alias) =>
      return callback @userError 404, http.STATUS_CODES[404] if _.isEmpty alias
      return callback error if error?
      callback null, alias

  userError: (status, message) =>
    error = new Error message
    error.status = status
    error

module.exports = AliasService
