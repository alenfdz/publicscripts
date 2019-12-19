// @ts-check
const CosmosClient = require('@azure/cosmos').CosmosClient
const debug = require('debug')('readings:readings')

// For simplicity we'll set a constant partition key
const partitionKey = undefined
class Readings {
  constructor(cosmosClient, databaseId, containerId){
    this.client = cosmosClient
    this.databaseId = databaseId
    this.collectionId = containerId

    this.database = null
    this.container = null
  }

  async init(){
    debug('Setting up the database...')
    const dbResponse = await this.client.databases.createIfNotExists({
      id: this.databaseId
    })
    this.database = dbResponse.database
    debug('Setting up teh database...done!')
    debug('Setting up the container...')
    const coResponse = await this.database.containers.createIfNotExists({
      id: this.collectionId
    })
    this.container = coResponse.container
    debug('Setting up the container... done!')
  }

  async find(querySpec){
    debug('Querying for items in the database')
    if(!this.container){
      throw new Error('Collection is not initialized.')
    }
    const { resources } = await this.container.items.query(querySpec).fetchAll()
    return resources
  }
}

module.exports = Readings