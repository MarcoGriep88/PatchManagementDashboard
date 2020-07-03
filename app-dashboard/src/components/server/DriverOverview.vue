<template>
      <main>
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-12 col-md-4 mb-12">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Treiber Updates</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">{{ dums.length }}</div>
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
                  <h6 class="m-0 font-weight-bold text-primary">Treiber Updates</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" @click="fetchDUMData">Neu laden</a>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <div class="loader" v-if="dumLoader"></div>
                      <table class="table table-striped table-bordered table-responsive" id="myTabledum" style="width: 100%;">
                      <thead>
                        <tr>
                          <th>Hostname</th>
                          <th>Treiber</th>
                          <th>Verfügbare Version</th>
                        </tr>
                      </thead>
                      <tbody>
                      <tr v-for="u in dums" :key="u.id">
                        <th>{{u.Hostname}}</th>
                        <th>{{u.Driver}}</th>
                        <th>{{u.UpgradeVersion}}</th>
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
      dum: {
        id: '',
        Hostname: '',
        Driver: '',
        UpgradeVersion: ''
      },
      dums: [],
      dumLoader: true
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
      this.fetchDUMData();
    },
      fetchDUMData() {
      this.$http.get('http://api.brandmauer.de/dum/')
          .then(response => {
            return response.json();
          })
          .then(data => {
            const resultArray = [];
            for (let key in data) {
              resultArray.push(data[key]);
            }
            this.dums = resultArray;
            this.dumLoader = false;
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