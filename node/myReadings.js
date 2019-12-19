const Readings = require("../models/readings");

class myReadings {
  constructor(readings){
    this.readings = readings;
  }
  async showReadings(req, res){
    const querySpec = {
      query: "SELECT r.id, r.gearId, r.temperature, r.reading FROM root r",
      parameters: [
        {
          name: "@gears",
          value: false
        }
      ]
    };

    const items = await this.readings.find(querySpec);
    if(items.length){
        res.status(200).json(items)
    }else{
        res.status(200).send("No items!")
    }
    /*res.render("index", {
      title: "Readings from gears",
      readings: items
    }); */
  }
}
module.exports = myReadings