import About from './components/server/About.vue'
import PatchOverview from './components/server/PatchOverview.vue'
import DriverOverview from './components/server/DriverOverview.vue'
import BackupOverview from './components/server/BackupOverview.vue'
import ChocolateyOverview from './components/server/ChocolateyOverview.vue'

export const routes = [
    { path: '/', component: PatchOverview},
    { path: '/patch', component: PatchOverview},
    { path: '/drivers', component: DriverOverview},
    { path: '/backups', component: BackupOverview},
    { path: '/choco', component: ChocolateyOverview},
    { path: '/about', component: About}
];