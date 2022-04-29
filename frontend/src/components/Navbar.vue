<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <router-link class="navbar-brand" to="/">Flask and VueJS</router-link>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <router-link class="btn btn-primary" aria-current="page" to="/">Home</router-link>
        </li>
        <li class="nav-item">
          <router-link class="btn btn-success" to="/create">Create</router-link>
        </li>
      </ul>
    </div>
  </div>
  </nav>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<style>

</style>
