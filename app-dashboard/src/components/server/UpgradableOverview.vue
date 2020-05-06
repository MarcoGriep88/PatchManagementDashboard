<template>
      <main class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="row">
        <h3>Third Party Updates - Verfügbar: {{ infos.length }}</h3>
        <hr>
        <table class="table table-striped table-bordered table-responsive" id="myTable" style="width: 100%;">
            <thead>
              <tr>
                <th>ID</th>
                <th>Hostname</th>
                <th>Software</th>
                <th>Installierte Version</th>
                <th>Verfügbare Version</th>
                <th>Gewichtung</th>
              </tr>
            </thead>
            <tbody>
            <tr v-for="u in infos">
              <th>{{u.id}}</th>
              <th>{{u.Hostname}}</th>
              <th>{{u.Software}}</th>
              <th>{{u.LocalVersion}}</th>
              <th>{{u.UpgradeVersion}}</th>
              <th v-bind:class="{ 'text-warning': u.Weight > 10, 'text-danger': u.Weight > 100 }">{{u.Weight}}</th>
            </tr>
            </tbody>
          </table>
      </div>
      <div class="row">
          <button class="btn btn-secondary" style="float: right; " @click="fetchData">Neu laden</button>
      </div>
          
      </main>
</template>

<script>
export default {
  data() {
    return {
      info: {
        id: '',
        Hostname: '',
        Software: '',
        LocalVersion: '',
        UpgradeVersion: '',
        Weight: ''
      },
      infos: []
    };
  },
  methods: {
    submit() {
      console.log(this.user);
    },
    fetchData() {
      this.$http.get('http://localhost:8090/upgrades')
          .then(response => {
            return response.json();
          })
          .then(data => {
            const resultArray = [];
            for (let key in data) {
              resultArray.push(data[key]);
            }
            this.infos = resultArray;
            sleep(500).then(() => {
                $('#myTable').DataTable();
            });
            
          });
    }
  }
}

function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
</script>

<style>
.dataTables_wrapper {
  width: 100%;
}
</style>