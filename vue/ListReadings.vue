<template>
<div>
<h1>Readings ()</h1>
<table class="table table-bordered table-hover">
<thead>
<tr>
<th>#</th>
<th>GearId</th>
<th>Temperature</th>
<th>Reading</th>
</tr>
</thead>
<tbody>

<tr v-for="reading in readings">
<td>{{ reading.id }}</td>
<td>{{ reading.gearId }}</td>
<td>{{ reading.temperature }}</td>
<td>{{ reading.reading }}</td>

</tr>
</tbody>
</table>
</div>
</template>
<script>
import apiService from '@/api'
import axios from 'axios'

export default {

  name: 'ListReadings',

  components: {
  },

  data (){

    return {
      readings: [],
      numberOfReadings:0
    };

  },
  methods: {
    getReadings () {
      apiService.getReading().then((data) => {
        this.readings = data.data
        this.numberOfReadings = data.count
      })
    }

  },
  mounted(){
    axios.get('<<APPURL>>').then(response => (this.readings = response.data))
    //this.getReadings();
  }
}

</script>

<style scoped>

.list-horizontal li {

display:inline-block;

}

.list-horizontal li:before {

content: '\00a0\2022\00a0\00a0';

color:#999;

color:rgba(0,0,0,0.5);

font-size:11px;

}

.list-horizontal li:first-child:before {

content: '';

}

</style>