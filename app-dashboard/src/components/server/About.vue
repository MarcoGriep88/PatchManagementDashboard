<template>
      <main>
        <div class="row">
            <div class="col-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Information</h6>
                </div>
                <div class="card-body">
                  <p></p>
                  <p class="mb-0"></p>
                </div>
              </div>

            </div>
            <div class="col-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Systemstatus</h6>
                </div>
                <div class="card-body">
                  <p>Fujitsu DeskUpdate Manager API Version: {{ dum_version }}</p>
                  <p>Chocolatey API Version: {{ choco_version }}</p>
                  <p>WSUS API Version: {{ wsus_version }}</p>
                  <p class="mb-0"></p>
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
      dum_version: '',
      wsus_version: '',
      choco_version: ''
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
      this.fetchChocoData();
      this.fetchWSUSData();
      this.fetchDUMData();
    },
    fetchChocoData() {
      this.$http.get('http://api.brandmauer.de/choco/version')
          .then(response => {
            return response;
          })
          .then(data => {
            this.choco_version = data;
            this.chocoLoader = false;
          });
      },
      fetchWSUSData() {
      this.$http.get('http://api.brandmauer.de/wsus/version')
          .then(response => {
            return response
          })
          .then(data => {
            this.wsus_version = data;
            this.wsusLoader = false;
          });
      },
      fetchDUMData() {
      this.$http.get('http://api.brandmauer.de/dum/version')
          .then(response => {
            return response
          })
          .then(data => {
            this.dum_version = data;
            this.dumLoader = false;
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