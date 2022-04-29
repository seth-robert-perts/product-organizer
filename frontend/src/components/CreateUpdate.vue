<!-- Create the Create/Update page to add and modify products using a form -->
<template>
  <div class="container mt-4">
    <form @submit.prevent="submitProduct">
      <input type="text" class="form-control" placeholder="Please enter the product name" v-model="name"/>
      
      <br/>
      <textarea rows="10" class="form-control" placeholder="Please enter the product's ingredients (comma separated list)" v-model="ingredients">
      </textarea>
      
      <button class="btn btn-success mt-4">
        Submit Product
      </button>
    </form>
    <div v-if="error" class="alert alert-warning alert-dismissible fade show mt-5" role="alert">
      <strong>{{error}}</strong>
    </div>
  </div>
</template>

<!-- Perform input validation and then call out to the backend server to post the new/modified product -->
<script>
export default {
  data() {
    return {
      name:null,
      ingredients:null,
      error:null
    }
  },
  methods: {
    submitProduct() {
      if(!this.name || !this.ingredients) {
        this.error = "Please enter all the above fields"
      }
      else {
        fetch('http://localhost:5000/post', {
          method:"POST",
          headers: {
            'Access-Control-Allow-Origin': '*',
            "Content-Type":"application/json"
          },
          body: JSON.stringify({name:this.name, ingredients:this.ingredients})
        })
        .then(resp => resp.json())
        .then(() => {
          this.$router.push({
            name:'home'
          })
        })
        .catch(error => {
          console.log(error)
        })
      }
    }
  }
}
</script>

<style>
  
</style>
