<template>
      <main>
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-4 col-md-4 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Anzahl der Datensicherungen</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">{{ seps.length }}</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-laptop-medical fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

          <br/>
          <div class="row">
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">

                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Backups</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" @click="fetchData">Neu laden</a>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <div class="loader" v-if="sepLoader"></div>
                      <table class="table table-striped table-bordered table-responsive" id="myTabledum" style="width: 100%;">
                      <thead>
                        <tr>
                          <th>Kunde</th>
                          <th>Gruppe</th>
                          <th>Job</th>
                          <th>Sicherungsergebnis</th>
                        </tr>
                      </thead>
                      <tbody>
                      <tr v-for="u in seps" :key="u.date">
                        <th>{{u.customer}}</th>
                        <th>{{u.taskgroup}}</th>
                        <th>{{u.task}}</th>
                        <th>{{u.resultname}}</th>
                      </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
</template>

<script>
export default {
  data() {
    return {
      sep: {
        date: '',
        customer: '',
        taskgroup: '',
        task: '',
        state: '',
        resultname: ''
      },
      seps: [],
      sepLoader: true
    };
  },
  created() {
    this.reload();
  },
  destroyed() {
    
  },
  methods: {
    submit() {
      console.log(this.user);
    },
    reload() {
      this.fetchData();
    },
      fetchData() {
      this.$http.get('http://api.brandmauer.de/sep/backuplist/GetBackupList')
          .then(response => {
            return response.json();
          })
          .then(data => {
            const resultArray = [];
            for (let key in data) {
              resultArray.push(data[key]);
            }
            this.seps = resultArray;
            this.sepLoader = false;
            sleep(500).then(() => {
                $('#myTabledum').DataTable( {
                  "pageLength": 25,
                  "language": {
                      "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/German.json"
                  }
                });
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