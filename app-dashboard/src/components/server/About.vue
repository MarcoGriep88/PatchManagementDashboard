<template>
      <main>
        <div class="container-fluid">
        <div class="row">
            <div class="col-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Systeminfo</h6>
                </div>
                <div class="card-body">
                  <p v-bind:class="{ 'text-danger': dum_error }">Fujitsu DeskUpdate Manager API Version: {{ dum_version }}</p>
                  <p v-bind:class="{ 'text-danger': choco_error }">Chocolatey API Version: {{ choco_version }}</p>
                  <p v-bind:class="{ 'text-danger': wsus_error }">WSUS API Version: {{ wsus_version }}</p>
                </div>
              </div>

            </div>
            <div class="col-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Systemstatus</h6>
                </div>
                <div class="card-body">
                  <p v-bind:class="{ 'text-danger': dum_error }">Fujitsu DeskUpdate Manager: {{ dum_status }}</p>
                  <p v-bind:class="{ 'text-danger': choco_error }">Chocolatey: {{ choco_status }}</p>
                  <p v-bind:class="{ 'text-danger': wsus_error }">WSUS: {{ wsus_status }}</p>
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
      dum_version: '',
      wsus_version: '',
      choco_version: '',
      dum_status: '',
      wsus_status: '',
      choco_status: '',
      wsus_error: true,
      dum_error: true,
      choco_error: true
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
      this.fetchChocoPing();
      this.fetchWSUSPing();
      this.fetchDUMPing();
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
            this.choco_version = data.bodyText;
            this.chocoLoader = false;
          });
      },
      fetchWSUSData() {
      this.$http.get('http://api.brandmauer.de/wsus/version')
          .then(response => {
            return response
          })
          .then(data => {
            this.wsus_version = data.bodyText;;
            this.wsusLoader = false;
          });
      },
      fetchDUMData() {
      this.$http.get('http://api.brandmauer.de/dum/version')
          .then(response => {
            return response
          })
          .then(data => {
            this.dum_version = data.bodyText;;
            this.dumLoader = false;
          });
      },
    fetchChocoPing() {
      this.$http.get('http://api.brandmauer.de/choco/ping')
          .then(response => {
            return response;
          })
          .then(data => {
            this.choco_status = data.statusText;
            this.choco_error = false;
          });
      },
      fetchWSUSPing() {
      this.$http.get('http://api.brandmauer.de/wsus/ping')
          .then(response => {
            return response
          })
          .then(data => {
            this.wsus_status = data.statusText;
            this.wsus_error = false;
          });
      },
      fetchDUMPing() {
      this.$http.get('http://api.brandmauer.de/dum/ping')
          .then(response => {
            return response
          })
          .then(data => {
            this.dum_status = data.statusText;
            this.dum_error = false;
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