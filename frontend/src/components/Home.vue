<template>
  <h1>This is our home</h1>
</template>

<script>

export default {

  methods: {
    getProducts() {
      fetch('http://localhost:5000/get', {
        method:"GET",
        headers: {
          "Content-Type":"application/json"
        }
      })
      .then(resp => resp.json())
      .then(data => {
        console.log(data)
      })
      .catch(error => {
        console.log(error)
      })
    }
  },
  created() {
    this.getProducts()
  }
}
</script>

<style>
  
</style>
