<template>
  <div class="container mt-5">
    <div v-for="product in products" :key="product.id">
      <h3>{{product.name}}</h3>
      <p>{{product.ingredients}}</p>
    </div>
  </div>
</template>

<script>

export default {

  data() {
    return {
      products:[]
    }
  },
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
        this.products.push(...data)
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
