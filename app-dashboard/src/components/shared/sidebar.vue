<template>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Cockpit</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <router-link :to="{ path: '/patch'}">
        <a class="nav-link">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Patch Management</span>
        </a>
        </router-link>
      </li>

      <li class="nav-item active">
        <router-link :to="{ path: '/drivers'}">
        <a class="nav-link">
          <i class="far fa-id-badge"></i>
          <span>Driver Management</span>
        </a>
        </router-link>
      </li>

      <li class="nav-item active">
        <router-link :to="{ path: '/backups'}">
        <a class="nav-link">
          <i class="far fa-hdd"></i>
          <span>Managed Backup</span>
        </a>
        </router-link>
      </li>

      <li class="nav-item active">
        <router-link :to="{ path: '/about'}">
        <a class="nav-link">
          <i class="fas fa-info-circle"></i>
          <span>Info</span>
        </a>
        </router-link>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->
</template>