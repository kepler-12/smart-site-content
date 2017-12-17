--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: smartsiterole
--

INSERT INTO content VALUES (1, 1, 'items', 1, 1, 'path', '/admin', '2017-11-20 12:22:53.945-05', '2017-11-20 12:22:53.945-05');
INSERT INTO content VALUES (2, 1, 'items', 1, 2, 'template', 'adminHome', '2017-11-20 12:22:53.945-05', '2017-11-20 12:22:53.945-05');
INSERT INTO content VALUES (3953, 29, 'templates', 1322, 55, 'vue', '<template>
  <h1>Hello World</h1></template>
<script>
  module.exports = {
    name: ''adminAlert''
  }</script>
<style> </style>', '2017-11-28 16:21:16.247-05', '2017-11-28 16:21:16.247-05');
INSERT INTO content VALUES (3957, 14, 'templates', 1323, 55, 'vue', '<template>
  <div class="bg-blue hover:bg-green-dark text-white font-bold py-2 px-4 rounded no-underline">
      <router-link :to="path" class="no-underline text-center">{{title}}</router-link>
    </div>
</template>
<script>
  module.exports = {
    name: ''adminButton'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-11-28 16:21:16.303-05', '2017-11-28 16:21:16.303-05');
INSERT INTO content VALUES (3961, 12, 'templates', 1324, 55, 'vue', '<template>
  <div class="max-w-sm rounded overflow-hidden shadow-lg p-4">
    <slot></slot>
  </div>
</template>
<script>
  module.exports = {
    name: ''card''
  }
</script>
<style> .template-12 .template-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 n</style>', '2017-11-28 16:21:16.321-05', '2017-11-28 16:21:16.321-05');
INSERT INTO content VALUES (3965, 26, 'templates', 1325, 55, 'vue', '<template>
  <select v-model="value" :change="changed">
    <option v-for="template in templates">
      {{template.name}}
    </option>
  </select>  
</template>
<script>
  module.exports = {
    name: ''adminInputPageSelect'',
    props: [ ''placeholder'', ''name'', ''form''],
    data() {
      return {
        value: ''''
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    },
    asyncComputed: {
      templates: async function () {
        const query = await this.$apolloClient.query({
          query: this.$gql`
          {
            allTemplates(condition:{
              resourceId: 1
            }){
                nodes{
                  name
                }
              }
            }`
        })
        console.log(''query'', query)
        return query.data.allTemplates.nodes
      }
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.338-05', '2017-11-28 16:21:16.338-05');
INSERT INTO content VALUES (3969, 16, 'templates', 1326, 55, 'vue', '<template>
  <div class="w-3/4">
      <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="grid-first-name">
        {{label}}
      </label>
      <component :is="componentName(type)" v-bind="inputProps" class="">
      <p class="text-red text-xs italic">Please fill out this field.</p>
    </component>
  </div>
</template>
<script>
  module.exports = {
    name: ''adminInputField'',
    props: [
      ''type'', ''name'', ''placeholder'', ''label'', ''value''
    ],
    methods: {
      componentName(type){
        return `adminInput${type.charAt(0).toUpperCase() + type.slice(1)}`
      },
    },
    computed: {
      inputProps() {
        console.log(this.value)
        return {
          name: this.name,
          initValue: this.value,
          value: this.value,
          placeholder: this.placeholder,
          form: this.$parent 
        }
      }
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.366-05', '2017-11-28 16:21:16.366-05');
INSERT INTO content VALUES (3973, 18, 'templates', 1327, 55, 'vue', '<template>
  <input type="submit" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3"> 
</template>
<script>
  module.exports = {
    name: ''adminInputSubmit'',
    props: [''value'', ''placeholder'', ''name'', ''form'']
  }
</script>
<style> </style>', '2017-11-28 16:21:16.385-05', '2017-11-28 16:21:16.385-05');
INSERT INTO content VALUES (3977, 25, 'templates', 1328, 55, 'vue', '<template>
  <select v-model="value" :value="initValue" :change="changed">
    <option v-for="template in templates">
      {{template.name}}
    </option>
  </select>  
</template>
<script>
module.exports = {
    name: ''adminInputTemplateSelect'',
    props: [ ''placeholder'', ''name'', ''form'', ''initValue''],
    data() {
      return {
        value: ''''
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    },
    asyncComputed: {
      templates: async function () {
        const query = await this.$apolloClient.query({
          query: this.$gql`
          {
              allTemplates{
                nodes{
                  name
                }
              }
            }`
        })
        console.log(''query'', query)
        return query.data.allTemplates.nodes
      }
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.405-05', '2017-11-28 16:21:16.405-05');
INSERT INTO content VALUES (3981, 17, 'templates', 1329, 55, 'vue', '<template>
  <input type="text" v-model="value" :name="name" :placeholder="placeholder" @change="changed" class="template-17 appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3"> 
</template>
<script>
  module.exports = {
    name: ''adminInputText'',
    props: [ ''placeholder'', ''name'', ''form'', ''initValue''],
    data() {
      return {
        value: this.initValue
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.419-05', '2017-11-28 16:21:16.419-05');
INSERT INTO content VALUES (3985, 24, 'templates', 1330, 55, 'vue', '<template>
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b">
    <wysiwyg-preview>  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.438-05', '2017-11-28 16:21:16.438-05');
INSERT INTO content VALUES (3989, 3, 'templates', 1331, 55, 'vue', '<template>
  <nav :class="classList">
    <p class="p-4">Smart Site Admin</p>
      <ul v-for="item in resources" class="list-reset">
       <admin-menu-item :path="path(item)" :title="item"></admin-menu-item>
     </ul>
  </nav>
</template>
<script>
  module.exports = {
    name: "admin-menu",
    data() {
      return {
        resources: [],
        classList: [
          ''flex'',
          ''flex-col'',
          ''items-center'',
          ''justify-start'',
          ''h-screen''
        ]
      }
    },
    methods: {
      path(resource_name) { return `/admin/resource/${resource_name}`}
    },
    beforeMount () {
      this.$apolloClient.query({
        query: this.$gql`
          {
            allResources{
              nodes {
                name
              }
            }
          }
        `
      })
      .then(r => {
        resources = r.data.allResources.nodes.map(resource => this.$camelCase(resource.name))
        console.log(''resources'', resources)
        this.resources = resources
      })
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.455-05', '2017-11-28 16:21:16.455-05');
INSERT INTO content VALUES (4080, 37, 'items', 1363, 6, 'path', '/about-us', '2017-11-29 12:06:06.353-05', '2017-11-29 12:06:06.353-05');
INSERT INTO content VALUES (4345, 44, 'items', 1512, 19, 'title', 'About Section 2', '2017-12-05 14:31:01.683-05', '2017-12-05 14:31:01.683-05');
INSERT INTO content VALUES (3993, 6, 'templates', 1332, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-11-28 16:21:16.47-05', '2017-11-28 16:21:16.47-05');
INSERT INTO content VALUES (3997, 20, 'templates', 1333, 55, 'vue', '<template>
  <h1>Hello World</h1>
</template>
<script>  
  module.exports = {
    name: ''wysiwyg-preview''
  }
</script>
<style> </style>', '2017-11-28 16:21:16.486-05', '2017-11-28 16:21:16.486-05');
INSERT INTO content VALUES (4026, 11, 'templates', 1339, 54, 'vue', '<template>
  <div>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: ''''
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.578-05', '2017-11-28 16:21:16.578-05');
INSERT INTO content VALUES (4030, 10, 'templates', 1340, 54, 'vue', '<template>
  <h1></h1>
</template>
<script>
  module.exports={"name": ''homePage''}
</script>
<style> </style>', '2017-11-28 16:21:16.598-05', '2017-11-28 16:21:16.598-05');
INSERT INTO content VALUES (4034, 22, 'templates', 1341, 52, 'vue', '<template>
  <h1>This is not the template you are looking for!</h1>
</template>
<script>
  module.exports = {
    name: ''defaultWysiwyg''
  }</script>
<style> </style>', '2017-11-28 16:21:16.616-05', '2017-11-28 16:21:16.616-05');
INSERT INTO content VALUES (4038, 23, 'templates', 1342, 52, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''wysiwyg'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            wysiwygItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wysiwyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.wysiwygItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-11-28 16:21:16.636-05', '2017-11-28 16:21:16.636-05');
INSERT INTO content VALUES (4062, 15, 'templates', 1353, 58, 'vue', '<template>
  <div>
      <h1>Create New {{$route.params.resource_name}}</h1>
      <form v-on:submit.prevent="submitForm">
        <div v-for="field in fields"> 
          <admin-input-field :type="field.inputTemplate || &apos;text&apos;" :name="field.name" :placholder="field.name" :label="field.name" :value="inputValues[field.name]">
          </admin-input-field>
        </div>
        <admin-input-field type="submit" name="submit" label="Save your data!"></admin-input-field>
      </form>   
  </div>
</template>
<script>
  module.exports = {
    name: ''adminCreateResource'',
    data() {
      return {
        inputValues: {}
      }
    },
    methods: {
      submitForm() {
          console.log(''submiting Form'', this.inputValues)
          const name = this.$route.params.resource_name.charAt(0).toUpperCase() + this.$route.params.resource_name.slice(1);
          const mutate = `
              mutation {
                create${name}Items(input:{${Object.keys(this.inputValues).map(key => key+'':''+''"''+this.$graphqlString(this.inputValues[key])+''"'')}}) {
                  clientMutationId
                } 
              }
            `
          console.log(mutate)
          this.$apolloClient.mutate({
            mutation: this.$gql`${mutate}`
        }).then()
        .catch(console.error)
      }
    },
    mounted() {
      this.$on(''inputEvent'', (data) => {
        this.inputValues[data.name] = data.value
      })
    },
    asyncComputed: {
      resourceId: async function() {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const resource = await this.$apolloClient.query({
          query: this.$gql`
          {
            resourceByName(name: "${resource_name}"){
              name
              id
            }
          }`
        })
        return resource.data.resourceByName.id
      },
      fields: async function () {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const field_set = this.$decamelize(this.$route.params.field_set)
        if (!this.resourceId) return []
        const fields = await this.$apolloClient.query({
          query: this.$gql`{
            fieldSetAsArray(fieldSetTable: "${field_set}", resourceIdValue: ${this.resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            } 
          }`
        })
        console.log(''fields'', fields.data.fieldSetAsArray.nodes)
        return [{name: "name", type: "text"}, ...fields.data.fieldSetAsArray.nodes]
      },
    }
  }
</script>
<style> </style>', '2017-11-28 16:58:36.175-05', '2017-11-28 16:58:36.175-05');
INSERT INTO content VALUES (4063, 27, 'templates', 1354, 58, 'vue', '<template>
 <div>
      <h1>Edit {{$route.params.resource_name}}</h1>
      <form v-on:submit.prevent="submitForm">
        <div v-for="field in fields">
          <admin-input-field :type="field.inputTemplate || &apos;text&apos;" :name="field.name" :placholder="field.name" :label="field.name" :value="values[field.name]">
          </admin-input-field>
        </div>
        <admin-input-field type="submit" name="submit" label="Save your data!"></admin-input-field>
      </form>   
  </div>
</template>
<script>
  module.exports = {
    name: ''adminCreateResource'',
    data() {
      return {
        inputValues: {}
      }
    }, 
    methods: {
      submitForm() {
          console.log(''submiting Form'', this.inputValues)
          const resource_name = this.$route.params.resource_name
          const field_set = this.$route.params.field_set
          const name = this.$camelCase(`update_${resource_name}_${field_set}`)
          delete this.inputValues.name
          const mutate = `
              mutation {
                ${name}(input:{id: ${this.$route.params.item_id}, ${Object.keys(this.inputValues).map(key => key+'':''+''"''+this.$graphqlString(this.inputValues[key])+''"'')}}) {
                  clientMutationId
                } 
              }
            `
          console.log(mutate)
          this.$apolloClient.mutate({
            mutation: this.$gql`${mutate}`
        }).then()
        .catch(console.error)
      }
    },
    mounted() {
      this.$on(''inputEvent'', (data) => {
        this.inputValues[data.name] = data.value
      })
    },
    asyncComputed: {
      resourceId: async function() {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const resource = await this.$apolloClient.query({
          query: this.$gql`
          {
            resourceByName(name: "${resource_name}"){
              name
              id
            }
          }`
        })
        return resource.data.resourceByName.id
      },
      fields: async function () {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const field_set = this.$decamelize(this.$route.params.field_set)
        if (!this.resourceId) return []
        const fields = await this.$apolloClient.query({
          query: this.$gql`{
            fieldSetAsArray(fieldSetTable: "${field_set}", resourceIdValue: ${this.resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            } 
          }`
        })
        console.log(''fields'', fields.data.fieldSetAsArray.nodes)
        return [{name: "name", type: "text"}, ...fields.data.fieldSetAsArray.nodes]
      },
      values: async function() {
        if (this.fields && this.fields.length > 0 &&  this.resourceId) {
          console.log(this.fields)
          const resource_name = this.$route.params.resource_name
          const field_set = this.$route.params.field_set
          const name = this.$camelCase(`${resource_name}_${field_set}`)
          const query = `
                {
                  ${name}ById(searchvalue: ${this.$route.params.item_id}) {
                    nodes {
                      ${this.fields.map(v => v.name).join('' '')}
                    }
                  }
                }
              `
          console.log(query)
          const values = await this.$apolloClient.query({
            query: this.$gql`${query}`
          })
          const valuesByField = {};
          console.log(values.data[name+''ById''].nodes[0])
          return values.data[name+''ById''].nodes[0]
        }
      }
    }
  }
</script>
<style> </style>', '2017-11-28 16:58:51.194-05', '2017-11-28 16:58:51.194-05');
INSERT INTO content VALUES (4064, 1, 'templates', 1355, 58, 'vue', '<template>
  <div class="w-full">
    <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
<style> 
</style>
<template>
  <div class="w-full">
    <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
<style> 
</style>
', '2017-11-28 16:58:56.193-05', '2017-11-28 16:58:56.193-05');
INSERT INTO content VALUES (4081, 37, 'items', 1363, 7, 'template', '<template>
  <div class="flex justify-around">
  	<admin-card class="w-1/2 text-center">
      <h1>Hello</h1>
    </admin-card>
    <admin-card class="w-1/2 text-center">
      <h1>world</h1>
    </admin-card>
    <admin-card class="w-full text-center">
      <h1>world</h1>
    </admin-card>
    <wysiwyg title="simple name"></<wysiwyg>
  <div>
</template>', '2017-11-29 12:06:06.353-05', '2017-11-29 12:06:06.353-05');
INSERT INTO content VALUES (4082, 36, 'items', 1364, 6, 'path', '/', '2017-11-29 12:06:15.274-05', '2017-11-29 12:06:15.274-05');
INSERT INTO content VALUES (4267, 37, 'items', 1470, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-8 pb-8"></wysiwyg>
    <wysiwyg title="About Section 3"></wysiwyg> 
  <div>
</template>', '2017-12-04 12:29:28.918-05', '2017-12-04 12:29:28.918-05');
INSERT INTO content VALUES (4065, 13, 'templates', 1356, 58, 'vue', '<template>
<div>
    <h1>{{$route.params.resource_name}}</h1>
    <div v-for="(data, field_set) in resource" v-if="field_set !== ''__typename''"> 
      <h3>{{field_set}}</h3>
      <ul v-for="item in data.nodes">
        <router-link :to="editLink(item, field_set)">
          <li class="text-black">{{item.id}} - {{item.name}} </li>
        </router-link>
      </ul>
      <admin-button :path="''/admin/create/resource/''+$route.params.resource_name+''/''+field_set" :title="&apos;New &apos;+$route.params.resource_name + '' '' + field_set">
      </admin-button>
    </div>
  </div>
</template>
<script>
  module.exports = {
    name: ''adminResourceList'',
    methods: {
      editLink(item, field_set) {
        return ''/admin/edit/resource/''+this.$route.params.resource_name+''/''+field_set+''/''+item.id
      }
    },
    data () {
      return {
      } 
    }, 
    asyncComputed: {
      resource() {
        return this.$apolloClient.query({
          query: this.$gql`{
              ${this.$route.params.resource_name} {
                nodes{
                  items{
                    nodes {
                      name
                      id
                    }
                  }
                  templates{
                    nodes{
                      name
                      id
                    }
                  }
                }
              }
            }
          `
        }).then(r => {
          console.log(r.data[this.$route.params.resource_name].nodes[0])
          return r.data[this.$route.params.resource_name].nodes[0]
        })
       }
    },
  }
</script>
<style> </style>', '2017-11-28 16:59:01.206-05', '2017-11-28 16:59:01.206-05');
INSERT INTO content VALUES (4066, 2, 'templates', 1357, 58, 'vue', '<template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style><template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>  
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style>', '2017-11-28 16:59:06.212-05', '2017-11-28 16:59:06.212-05');
INSERT INTO content VALUES (389, 6, 'items', 134, 6, 'path', '/admin/page', '2017-11-20 16:35:38.51-05', '2017-11-20 16:35:38.51-05');
INSERT INTO content VALUES (390, 6, 'items', 134, 7, 'template', 'adminPageList', '2017-11-20 16:35:38.51-05', '2017-11-20 16:35:38.51-05');
INSERT INTO content VALUES (1077, 11, 'items', 365, 1, 'path', '/admin/create/resource/:resource_name/:field_set', '2017-11-28 12:25:06.299-05', '2017-11-28 12:25:06.299-05');
INSERT INTO content VALUES (1078, 11, 'items', 365, 2, 'template', 'adminCreateResource', '2017-11-21 13:23:54.207-05', '2017-11-21 13:23:54.207-05');
INSERT INTO content VALUES (622, 10, 'items', 213, 1, 'path', '/admin/resource/:resource_name', '2017-11-21 11:28:45.421-05', '2017-11-21 11:28:45.421-05');
INSERT INTO content VALUES (623, 10, 'items', 213, 2, 'template', 'adminResourceList', '2017-11-21 11:28:45.421-05', '2017-11-21 11:28:45.421-05');
INSERT INTO content VALUES (2969, 24, 'items', 998, 1, 'path', '/admin/edit/resource/:resource_name/:field_set/:item_id', '2017-11-28 12:24:25.189-05', '2017-11-28 12:24:25.189-05');
INSERT INTO content VALUES (2970, 24, 'items', 998, 2, 'template', 'adminEditResource', '2017-11-26 20:46:03.926-05', '2017-11-26 20:46:03.926-05');
INSERT INTO content VALUES (4067, 35, 'items', 1358, 20, 'keywords', 'Keywod', '2017-11-29 11:54:54.36-05', '2017-11-29 11:54:54.36-05');
INSERT INTO content VALUES (4068, 35, 'items', 1358, 19, 'title', 'TheColdestSunset', '2017-11-29 11:54:54.36-05', '2017-11-29 11:54:54.36-05');
INSERT INTO content VALUES (4069, 35, 'items', 1358, 17, 'wysiwyg', '<template>
<div class="max-w-sm rounded overflow-hidden shadow-lg">
  <img class="w-full" src="https://tailwindcss.com/img/card-top.jpg" alt="Sunset in the mountains">
  <div class="px-6 py-4">
    <div class="font-bold text-xl mb-2">The Coldest Sunset</div>
    <p class="text-grey-darker text-base">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus quia, nulla! Maiores et perferendis eaque, exercitationem praesentium nihil.
    </p>
  </div>
  <div class="px-6 py-4">
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#photography</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#travel</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker">#winter</span>
  </div>
</div>
</template>', '2017-11-29 11:54:54.36-05', '2017-11-29 11:54:54.36-05');
INSERT INTO content VALUES (4070, 35, 'items', 1359, 20, 'keywords', 'Keywod', '2017-11-29 11:56:11.177-05', '2017-11-29 11:56:11.177-05');
INSERT INTO content VALUES (4071, 35, 'items', 1359, 19, 'title', 'The Coldest Sunset', '2017-11-29 11:56:11.177-05', '2017-11-29 11:56:11.177-05');
INSERT INTO content VALUES (4072, 35, 'items', 1359, 17, 'wysiwyg', '<template>
<div class="max-w-sm rounded overflow-hidden shadow-lg">
  <img class="w-full" src="https://tailwindcss.com/img/card-top.jpg" alt="Sunset in the mountains">
  <div class="px-6 py-4">
    <div class="font-bold text-xl mb-2">The Coldest Sunset</div>
    <p class="text-grey-darker text-base">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus quia, nulla! Maiores et perferendis eaque, exercitationem praesentium nihil.
    </p>
  </div>
  <div class="px-6 py-4">
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#photography</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#travel</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker">#winter</span>
  </div>
</div>
</template>
<script>
  module.exports = {
  	name: "TheColdestSunset"
  }
</script>', '2017-11-29 11:56:11.177-05', '2017-11-29 11:56:11.177-05');
INSERT INTO content VALUES (4073, 35, 'items', 1360, 20, 'keywords', 'Keywod', '2017-11-29 11:57:16.234-05', '2017-11-29 11:57:16.234-05');
INSERT INTO content VALUES (4074, 35, 'items', 1360, 19, 'title', 'simple name', '2017-11-29 11:57:16.234-05', '2017-11-29 11:57:16.234-05');
INSERT INTO content VALUES (4075, 35, 'items', 1360, 17, 'wysiwyg', '<template>
<div class="max-w-sm rounded overflow-hidden shadow-lg">
  <img class="w-full" src="https://tailwindcss.com/img/card-top.jpg" alt="Sunset in the mountains">
  <div class="px-6 py-4">
    <div class="font-bold text-xl mb-2">The Coldest Sunset</div>
    <p class="text-grey-darker text-base">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus quia, nulla! Maiores et perferendis eaque, exercitationem praesentium nihil.
    </p>
  </div>
  <div class="px-6 py-4">
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#photography</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker mr-2">#travel</span>
    <span class="inline-block bg-grey-lighter rounded-full px-3 py-1 text-sm font-semibold text-grey-darker">#winter</span>
  </div>
</div>
</template>
<script>
  module.exports = {
  	name: "simple name"
  }
</script>', '2017-11-29 11:57:16.234-05', '2017-11-29 11:57:16.234-05');
INSERT INTO content VALUES (4076, 36, 'items', 1361, 6, 'path', '/', '2017-11-29 12:03:10.064-05', '2017-11-29 12:03:10.064-05');
INSERT INTO content VALUES (4077, 36, 'items', 1361, 7, 'template', '<template>
  <div class="flex justify-around">
  	<admin-card class="w-1/2 text-center">
      <h1>Hello</h1>
    </admin-card>
    <admin-card class="w-1/2 text-center">
      <h1>world</h1>
    </admin-card>
    <admin-card class="w-full text-center">
      <h1>world</h1>
    </admin-card>
    <wysiwyg title="simple name"></<wysiwyg>
  <div>
</template>', '2017-11-29 12:03:10.064-05', '2017-11-29 12:03:10.064-05');
INSERT INTO content VALUES (4078, 37, 'items', 1362, 6, 'path', '/', '2017-11-29 12:03:45.717-05', '2017-11-29 12:03:45.717-05');
INSERT INTO content VALUES (4079, 37, 'items', 1362, 7, 'template', '<template>
  <div class="flex justify-around">
  	<admin-card class="w-1/2 text-center">
      <h1>Hello</h1>
    </admin-card>
    <admin-card class="w-1/2 text-center">
      <h1>world</h1>
    </admin-card>
    <admin-card class="w-full text-center">
      <h1>world</h1>
    </admin-card>
    <wysiwyg title="simple name"></<wysiwyg>
  <div>
</template>', '2017-11-29 12:03:45.717-05', '2017-11-29 12:03:45.717-05');
INSERT INTO content VALUES (4083, 36, 'items', 1364, 7, 'template', '<template>
  <div>
    <div class="flex justify-around">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-full text-center">
        <h1>world</h1>
      </admin-card>
      <wysiwyg title="simple name"></<wysiwyg>
    <div>
    <div class="flex justify-between">
			<wysiwyg title="simple name"></<wysiwyg>
      <wysiwyg title="simple name"></<wysiwyg>
      <wysiwyg title="simple name"></<wysiwyg>
    </div>
  </div>
</template>', '2017-11-29 12:06:15.274-05', '2017-11-29 12:06:15.274-05');
INSERT INTO content VALUES (4084, 36, 'items', 1365, 6, 'path', '/', '2017-11-29 12:06:34.182-05', '2017-11-29 12:06:34.182-05');
INSERT INTO content VALUES (4085, 36, 'items', 1365, 7, 'template', '<template>
  <div>
    <div class="flex justify-around">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-full text-center">
        <h1>worldddd</h1>
      </admin-card>
      <wysiwyg title="simple name"></<wysiwyg>
    <div>
  </div>
</template>', '2017-11-29 12:06:34.182-05', '2017-11-29 12:06:34.182-05');
INSERT INTO content VALUES (4086, 36, 'items', 1366, 6, 'path', '/', '2017-11-29 12:07:40.484-05', '2017-11-29 12:07:40.484-05');
INSERT INTO content VALUES (4087, 36, 'items', 1366, 7, 'template', '<template>
  <div class="">
    <div class="flex justify-around">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-1 text-center">
        <h1>worldddd</h1>
      </admin-card>
    <div>
    <div class="flex justify-around">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-1 text-center">
        <h1>worldddd</h1>
      </admin-card>
    <div>  
  </div>
</template>', '2017-11-29 12:07:40.484-05', '2017-11-29 12:07:40.484-05');
INSERT INTO content VALUES (4088, 36, 'items', 1367, 6, 'path', '/', '2017-11-29 12:08:15.16-05', '2017-11-29 12:08:15.16-05');
INSERT INTO content VALUES (4089, 36, 'items', 1367, 7, 'template', '<template>
  <div class="flex">
    <div class="flex justify-around w-full">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-1 text-center">
        <h1>worldddd</h1>
      </admin-card>
    <div>
    <div class="flex justify-around w-full">
      <admin-card class="w-1/2 text-center">
        <h1>Hello</h1>
      </admin-card>
      <admin-card class="w-1/2 text-center">
        <h1>world</h1>
      </admin-card>
      <admin-card class="w-1 text-center">
        <h1>worldddd</h1>
      </admin-card>
    <div>  
  </div>
</template>', '2017-11-29 12:08:15.16-05', '2017-11-29 12:08:15.16-05');
INSERT INTO content VALUES (4118, 2, 'templates', 1382, 58, 'vue', '<template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style><template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style>', '2017-11-29 16:07:30.192-05', '2017-11-29 16:07:30.192-05');
INSERT INTO content VALUES (4127, 37, 'items', 1387, 6, 'path', '/about-us', '2017-11-29 16:09:47.343-05', '2017-11-29 16:09:47.343-05');
INSERT INTO content VALUES (4128, 37, 'items', 1387, 7, 'template', '<template>
  <div class="flex justify-around">
  	<admin-card class="w-1/2 text-center">
      <h1>Hello</h1>
    </admin-card>
    <admin-card class="w-1/2 text-center">
      <h1>world</h1>
    </admin-card>
    <admin-card class="w-full text-center">
      <h1>world</h1>
    </admin-card>
    <wysiwyg title="simple name"></<wysiwyg>
  <div>
</template>', '2017-11-29 16:09:47.343-05', '2017-11-29 16:09:47.343-05');
INSERT INTO content VALUES (4129, 1, 'templates', 1388, 58, 'vue', '<template>
  <div class="w-full">
    <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
<style> 
</style>
<template>
  <div class="w-full">
    <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
        <wysiwyg title="First Wysiwyg2" class="bg-green"></wysiwyg>
    <wysiwyg title="First Wysiwyg2" class="bg-blue"></wysiwyg>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
<style> 
</style>
', '2017-11-29 16:09:51.862-05', '2017-11-29 16:09:51.862-05');
INSERT INTO content VALUES (4132, 30, 'templates', 1390, 59, 'vue', '<template>
 <div>
 <h1>First Template
 </div>
</template>', '2017-11-29 16:15:32.28-05', '2017-11-29 16:15:32.28-05');
INSERT INTO content VALUES (4135, 10, 'templates', 1392, 54, 'vue', '<template>
 <h1></h1>
</template>
<script>
 module.exports={"name": ''homePage''}
</script>
<style>
</style>', '2017-11-29 16:33:08.386-05', '2017-11-29 16:33:08.386-05');
INSERT INTO content VALUES (4136, 6, 'templates', 1393, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-11-30 15:31:52.754-05', '2017-11-30 15:31:52.754-05');
INSERT INTO content VALUES (4137, 3, 'templates', 1394, 55, 'vue', '<template>
  <nav :class="classList">
    <p class="p-4">Smart Site Admin</p>
    	<h1>Settings</h1>
    		<ul>
          <admin-menu-item title="Create Resource" path="/create/resource"></admin-menu-item>
    		</ul>
    	<h1>Resources</h1>
      <ul v-for="item in resources" class="list-reset">
       <admin-menu-item :path="path(item)" :title="item"></admin-menu-item>
     </ul>
  </nav>
</template>
<script>
  module.exports = {
    name: "admin-menu",
    data() {
      return {
        resources: [],
        classList: [
          ''flex'',
          ''flex-col'',
          ''items-center'',
          ''justify-start'',
          ''h-screen'',
          ''bg-grey-darkest''
        ]
      }
    },
    methods: {
      path(resource_name) { return `/admin/resource/${resource_name}`}
    },
    beforeMount () {
      this.$apolloClient.query({
        query: this.$gql`
          {
            allResources{
              nodes {
                name
              }
            }
          }
        `
      })
      .then(r => {
        resources = r.data.allResources.nodes.map(resource => this.$camelCase(resource.name))
        console.log(''resources'', resources)
        this.resources = resources
      })
    }
  }
</script>
<style> </style>', '2017-11-30 16:10:45.688-05', '2017-11-30 16:10:45.688-05');
INSERT INTO content VALUES (4403, 44, 'items', 1545, 20, 'keywords', 'About Section 2', '2017-12-05 15:55:47.016-05', '2017-12-05 15:55:47.016-05');
INSERT INTO content VALUES (4404, 44, 'items', 1545, 19, 'title', 'About Section 2', '2017-12-05 15:55:47.016-05', '2017-12-05 15:55:47.016-05');
INSERT INTO content VALUES (4138, 3, 'templates', 1395, 55, 'vue', '<template>
  <nav :class="classList">
    <p class="p-4">Smart Site Admin</p>
    	<h1>Settings</h1>
    		<ul>
          <admin-menu-item title="Create Resource" path="/admin/create/resource"></admin-menu-item>
    		</ul>
    	<h1>Resources</h1>
      <ul v-for="item in resources" class="list-reset">
       <admin-menu-item :path="path(item)" :title="item"></admin-menu-item>
     </ul>
  </nav>
</template>
<script>
  module.exports = {
    name: "admin-menu",
    data() {
      return {
        resources: [],
        classList: [
          ''flex'',
          ''flex-col'',
          ''items-center'',
          ''justify-start'',
          ''h-screen'',
          ''bg-grey-darkest''
        ]
      }
    },
    methods: {
      path(resource_name) { return `/admin/resource/${resource_name}`}
    },
    beforeMount () {
      this.$apolloClient.query({
        query: this.$gql`
          {
            allResources{
              nodes {
                name
              }
            }
          }
        `
      })
      .then(r => {
        resources = r.data.allResources.nodes.map(resource => this.$camelCase(resource.name))
        console.log(''resources'', resources)
        this.resources = resources
      })
    }
  }
</script>
<style> </style>', '2017-11-30 16:11:21.552-05', '2017-11-30 16:11:21.552-05');
INSERT INTO content VALUES (4139, 15, 'templates', 1396, 58, 'vue', '<template>
  <div>
      <h1>Create New {{$route.params.resource_name}}</h1>
      <form v-on:submit.prevent="submitForm">
        <div v-for="field in fields"> 
          <admin-input-field :type="field.inputTemplate || &apos;text&apos;" :name="field.name" :placholder="field.name" :label="field.name" :value="inputValues[field.name]">
          </admin-input-field>
        </div>
        <admin-input-field type="submit" name="submit" label="Save your data!"></admin-input-field>
      </form>   
  </div>
</template>
<script>
  module.exports = {
    name: ''adminCreateResource'',
    data() {
      return {
        inputValues: {}
      }
    },
    methods: {
      submitForm() {
          console.log(''submiting Form'', this.inputValues)
          const resource_name = this.$route.params.resource_name;
          const field_set = this.$route.params.field_set;
          const name = this.$camelCase(`create_${resource_name}_${field_set}`)
          const mutate = `
              mutation {
                ${name}(input:{${Object.keys(this.inputValues).map(key => key+'':''+''"''+this.$graphqlString(this.inputValues[key])+''"'')}}) {
                  clientMutationId
                } 
              }
            `
          console.log(mutate)
          this.$apolloClient.mutate({
            mutation: this.$gql`${mutate}`
        }).then()
        .catch(console.error)
      }
    },
    mounted() {
      this.$on(''inputEvent'', (data) => {
        this.inputValues[data.name] = data.value
      })
    },
    asyncComputed: {
      resourceId: async function() {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const resource = await this.$apolloClient.query({
          query: this.$gql`
          {
            resourceByName(name: "${resource_name}"){
              name
              id
            }
          }`
        })
        return resource.data.resourceByName.id
      },
      fields: async function () {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const field_set = this.$decamelize(this.$route.params.field_set)
        if (!this.resourceId) return []
        const fields = await this.$apolloClient.query({
          query: this.$gql`{
            fieldSetAsArray(fieldSetTable: "${field_set}", resourceIdValue: ${this.resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            } 
          }`
        })
        console.log(''fields'', fields.data.fieldSetAsArray.nodes)
        return [{name: "name", type: "text"}, ...fields.data.fieldSetAsArray.nodes]
      },
    }
  }
</script>
<style> </style>', '2017-11-30 16:26:26.886-05', '2017-11-30 16:26:26.886-05');
INSERT INTO content VALUES (4140, 31, 'templates', 1397, 58, 'vue', '<template>
  <h1>HELlO WoLRD?</h1>
</template>
<script>
  module.exports = {
  	name = "adminCreateResource"
  }
</script>', '2017-11-30 16:26:55.219-05', '2017-11-30 16:26:55.219-05');
INSERT INTO content VALUES (4141, 38, 'items', 1398, 1, 'path', '/create/resource', '2017-11-30 16:27:34.282-05', '2017-11-30 16:27:34.282-05');
INSERT INTO content VALUES (4142, 38, 'items', 1398, 2, 'template', NULL, '2017-11-30 16:27:34.282-05', '2017-11-30 16:27:34.282-05');
INSERT INTO content VALUES (4143, 31, 'templates', 1399, 58, 'vue', '<template>
  <h1>HELlO WoLRD?</h1>
</template>
<script>
  module.exports = {
  	name = "adminACreateResource"
  }
</script>', '2017-11-30 16:31:04.531-05', '2017-11-30 16:31:04.531-05');
INSERT INTO content VALUES (4144, 38, 'items', 1400, 1, 'path', '/create/a/resource', '2017-11-30 16:31:24.573-05', '2017-11-30 16:31:24.573-05');
INSERT INTO content VALUES (4145, 38, 'items', 1400, 2, 'template', NULL, '2017-11-30 16:31:24.573-05', '2017-11-30 16:31:24.573-05');
INSERT INTO content VALUES (4146, 32, 'templates', 1401, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-01 12:27:17.611-05', '2017-12-01 12:27:17.611-05');
INSERT INTO content VALUES (4147, 33, 'templates', 1402, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wysiwyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.wysiwygItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:13:45.784-05', '2017-12-01 13:13:45.784-05');
INSERT INTO content VALUES (4148, 34, 'templates', 1403, 61, 'vue', '<template>
  <nav v-for="">
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-01 13:32:45.352-05', '2017-12-01 13:32:45.352-05');
INSERT INTO content VALUES (4149, 35, 'templates', 1404, 61, 'vue', '<template>
  <nav v-for="item in items">
    <menu-item path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-01 13:33:29.269-05', '2017-12-01 13:33:29.269-05');
INSERT INTO content VALUES (4150, 39, 'items', 1405, 63, 'title', 'Main Header', '2017-12-01 13:33:38.063-05', '2017-12-01 13:33:38.063-05');
INSERT INTO content VALUES (4151, 39, 'items', 1405, 62, 'wyiswyg', '<template>
  <img src="">
  <page-menu :items="menuItems" />
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
        	
        ]
      }
    }
  }
</script>', '2017-12-01 13:33:38.063-05', '2017-12-01 13:33:38.063-05');
INSERT INTO content VALUES (4152, 36, 'templates', 1406, 61, 'vue', '<template>
  <nav >
    <menu-item v-for="item in items" path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-01 13:35:25.884-05', '2017-12-01 13:35:25.884-05');
INSERT INTO content VALUES (4153, 37, 'templates', 1407, 61, 'vue', '<template>
  <nav>
    <menu-item v-for="item in items" path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-01 13:35:29.265-05', '2017-12-01 13:35:29.265-05');
INSERT INTO content VALUES (4154, 39, 'items', 1408, 63, 'title', 'Main Header', '2017-12-01 13:35:37.411-05', '2017-12-01 13:35:37.411-05');
INSERT INTO content VALUES (4155, 39, 'items', 1408, 62, 'wyiswyg', '<template>
  <div>
    <img src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          
        ]
      }
    }
  }
</script>', '2017-12-01 13:35:37.411-05', '2017-12-01 13:35:37.411-05');
INSERT INTO content VALUES (4156, 38, 'templates', 1409, 61, 'vue', '<template>
  <nav>
    <menu-item v-for="item in items" :path="item.path" :title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-01 13:36:03.198-05', '2017-12-01 13:36:03.198-05');
INSERT INTO content VALUES (4157, 39, 'items', 1410, 63, 'title', 'Main Header', '2017-12-01 13:41:58.155-05', '2017-12-01 13:41:58.155-05');
INSERT INTO content VALUES (4158, 39, 'items', 1410, 62, 'wyiswyg', '<template>
  <div>
    <img src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          
        ]
      }
    }
  }
</script>', '2017-12-01 13:41:58.155-05', '2017-12-01 13:41:58.155-05');
INSERT INTO content VALUES (4159, 39, 'items', 1411, 63, 'title', 'Main Header', '2017-12-01 13:43:02.516-05', '2017-12-01 13:43:02.516-05');
INSERT INTO content VALUES (4160, 39, 'items', 1411, 62, 'wyiswyg', '<template>
  <div>
    <img src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          
        ]
      }
    }
  }
</script>', '2017-12-01 13:43:02.516-05', '2017-12-01 13:43:02.516-05');
INSERT INTO content VALUES (4611, 50, 'items', 1664, 20, 'keywords', NULL, '2017-12-07 16:41:26.769-05', '2017-12-07 16:41:26.769-05');
INSERT INTO content VALUES (4161, 33, 'templates', 1412, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.wysiwygItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:44:06.474-05', '2017-12-01 13:44:06.474-05');
INSERT INTO content VALUES (4162, 33, 'templates', 1413, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.wysiwygItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:46:08.885-05', '2017-12-01 13:46:08.885-05');
INSERT INTO content VALUES (4163, 33, 'templates', 1414, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:47:11.233-05', '2017-12-01 13:47:11.233-05');
INSERT INTO content VALUES (4164, 36, 'items', 1415, 6, 'path', '/', '2017-12-01 13:47:16.526-05', '2017-12-01 13:47:16.526-05');
INSERT INTO content VALUES (4165, 36, 'items', 1415, 7, 'template', '<template>
  <div class="flex">
    <page-component title="Main Header"></page-component>
    <div>  
  </div>
</template>', '2017-12-01 13:47:16.526-05', '2017-12-01 13:47:16.526-05');
INSERT INTO content VALUES (4166, 33, 'templates', 1416, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:47:21.169-05', '2017-12-01 13:47:21.169-05');
INSERT INTO content VALUES (4167, 33, 'templates', 1417, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:47:41.977-05', '2017-12-01 13:47:41.977-05');
INSERT INTO content VALUES (4168, 33, 'templates', 1418, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 13:47:59.853-05', '2017-12-01 13:47:59.853-05');
INSERT INTO content VALUES (4169, 36, 'items', 1419, 6, 'path', '/', '2017-12-01 13:48:47.853-05', '2017-12-01 13:48:47.853-05');
INSERT INTO content VALUES (4170, 36, 'items', 1419, 7, 'template', '<template>
  <div class="flex">
    <page-component title="Main Header"></page-component>
    <div>  
  </div>
</template>', '2017-12-01 13:48:47.853-05', '2017-12-01 13:48:47.853-05');
INSERT INTO content VALUES (4171, 39, 'items', 1420, 63, 'title', 'Main Header', '2017-12-01 14:01:34.792-05', '2017-12-01 14:01:34.792-05');
INSERT INTO content VALUES (4172, 39, 'items', 1420, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center">
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:01:34.792-05', '2017-12-01 14:01:34.792-05');
INSERT INTO content VALUES (4173, 32, 'templates', 1421, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-01 14:02:02.213-05', '2017-12-01 14:02:02.213-05');
INSERT INTO content VALUES (4174, 39, 'items', 1422, 63, 'title', 'Main Header', '2017-12-01 14:13:39.769-05', '2017-12-01 14:13:39.769-05');
INSERT INTO content VALUES (4269, 37, 'items', 1471, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg> 
  <div>
</template>', '2017-12-04 12:33:50.924-05', '2017-12-04 12:33:50.924-05');
INSERT INTO content VALUES (4175, 39, 'items', 1422, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center justify-center">
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:13:39.769-05', '2017-12-01 14:13:39.769-05');
INSERT INTO content VALUES (4176, 11, 'templates', 1423, 54, 'vue', '<template>
  <div>
    	<page-component title="Main Header"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: ''''
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 14:15:21.575-05', '2017-12-01 14:15:21.575-05');
INSERT INTO content VALUES (4177, 36, 'items', 1424, 6, 'path', '/', '2017-12-01 14:15:38.632-05', '2017-12-01 14:15:38.632-05');
INSERT INTO content VALUES (4178, 36, 'items', 1424, 7, 'template', '<template>
  <div class="flex">
    <h1>Hello WOrld!</h1>
    <div>  
  </div>
</template>', '2017-12-01 14:15:38.632-05', '2017-12-01 14:15:38.632-05');
INSERT INTO content VALUES (4179, 36, 'items', 1425, 6, 'path', '/', '2017-12-01 14:16:09.941-05', '2017-12-01 14:16:09.941-05');
INSERT INTO content VALUES (4180, 36, 'items', 1425, 7, 'template', '<template>
  <div class="flex">
    <h1>Hello WOrld!</h1>
    <div>  
  </div>
</template>', '2017-12-01 14:16:09.941-05', '2017-12-01 14:16:09.941-05');
INSERT INTO content VALUES (4181, 11, 'templates', 1426, 54, 'vue', '<template>
  <div class="w-screen">
    	<page-component title="Main Header"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: ''''
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-01 14:16:34.211-05', '2017-12-01 14:16:34.211-05');
INSERT INTO content VALUES (4182, 39, 'items', 1427, 63, 'title', 'Main Header', '2017-12-01 14:36:42.83-05', '2017-12-01 14:36:42.83-05');
INSERT INTO content VALUES (4183, 39, 'items', 1427, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center justify-center h-64 overflow-hidden"
       style="background-image: url(''/static/headerImg.jpg''"
       >
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:36:42.83-05', '2017-12-01 14:36:42.83-05');
INSERT INTO content VALUES (4184, 39, 'items', 1428, 63, 'title', 'Main Header', '2017-12-01 14:40:07.564-05', '2017-12-01 14:40:07.564-05');
INSERT INTO content VALUES (4185, 39, 'items', 1428, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden"
       style="background-image: url(''/static/headerImg.jpg''"
       >
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:40:07.564-05', '2017-12-01 14:40:07.564-05');
INSERT INTO content VALUES (4186, 39, 'items', 1429, 63, 'title', 'Main Header', '2017-12-01 14:41:47.366-05', '2017-12-01 14:41:47.366-05');
INSERT INTO content VALUES (4187, 39, 'items', 1429, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden"
       style="background-image: url(''/static/headerImg.jpg''"
       >
    <img src="/static/headerImg.jpg" 
         class="w-full absolute z-0"
         />
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:41:47.366-05', '2017-12-01 14:41:47.366-05');
INSERT INTO content VALUES (4188, 39, 'items', 1430, 63, 'title', 'Main Header', '2017-12-01 14:43:35.435-05', '2017-12-01 14:43:35.435-05');
INSERT INTO content VALUES (4189, 39, 'items', 1430, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden"
       style="background-image: url(''/static/headerImg.jpg''"
       >
    <img src="/static/headerImg.jpg" 
         class="w-full absolute z-0 pin-l pin-t"
         />
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:43:35.435-05', '2017-12-01 14:43:35.435-05');
INSERT INTO content VALUES (4190, 39, 'items', 1431, 63, 'title', 'Main Header', '2017-12-01 14:43:58.211-05', '2017-12-01 14:43:58.211-05');
INSERT INTO content VALUES (4191, 39, 'items', 1431, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden"
       style="background-image: url(''/static/headerImg.jpg''"
       >
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute z-0 pin-l pin-t"
         />
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:43:58.211-05', '2017-12-01 14:43:58.211-05');
INSERT INTO content VALUES (4192, 39, 'items', 1432, 63, 'title', 'Main Header', '2017-12-01 14:44:34.114-05', '2017-12-01 14:44:34.114-05');
INSERT INTO content VALUES (4270, 39, 'items', 1472, 63, 'title', 'Main Header', '2017-12-04 12:34:22.249-05', '2017-12-04 12:34:22.249-05');
INSERT INTO content VALUES (4612, 50, 'items', 1664, 19, 'title', 'History Rewards Experience', '2017-12-07 16:41:26.769-05', '2017-12-07 16:41:26.769-05');
INSERT INTO content VALUES (4193, 39, 'items', 1432, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden"
       >
    <img 
      class="w-64 self-center"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute z-0 pin-l pin-t"
         />
  </div>
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-01 14:44:34.114-05', '2017-12-01 14:44:34.114-05');
INSERT INTO content VALUES (4194, 24, 'templates', 1433, 55, 'vue', '<template>
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b">
    <wysiwyg-preview >  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }
</script>
<style> </style>', '2017-12-01 14:46:34.911-05', '2017-12-01 14:46:34.911-05');
INSERT INTO content VALUES (4195, 24, 'templates', 1434, 55, 'vue', '<template>
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b ">
    <wysiwyg-preview >  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }
</script>
<style> </style>', '2017-12-01 14:47:41.489-05', '2017-12-01 14:47:41.489-05');
INSERT INTO content VALUES (4196, 24, 'templates', 1435, 55, 'vue', '<template>
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b r">
    <wysiwyg-preview >  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }
</script>
<style> </style>', '2017-12-01 14:49:16.991-05', '2017-12-01 14:49:16.991-05');
INSERT INTO content VALUES (4197, 24, 'templates', 1436, 55, 'vue', '<template>
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b re">
    <wysiwyg-preview >  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }
</script>
<style> </style>', '2017-12-01 14:50:11.883-05', '2017-12-01 14:50:11.883-05');
INSERT INTO content VALUES (4213, 39, 'items', 1445, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 11:11:48.837-05', '2017-12-04 11:11:48.837-05');
INSERT INTO content VALUES (4525, 36, 'items', 1603, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:07:26.539-05', '2017-12-07 11:07:26.539-05');
INSERT INTO content VALUES (4198, 24, 'templates', 1437, 55, 'vue', '<template>
  
  
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b relative">
    <wysiwyg-preview>  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template>
<script>
  
  
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }

</script>
<style> </style>', '2017-12-01 14:51:41.896-05', '2017-12-01 14:51:41.896-05');
INSERT INTO content VALUES (4199, 39, 'items', 1438, 63, 'title', 'Main Header', '2017-12-04 10:46:42.745-05', '2017-12-04 10:46:42.745-05');
INSERT INTO content VALUES (4200, 39, 'items', 1438, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 10:46:42.745-05', '2017-12-04 10:46:42.745-05');
INSERT INTO content VALUES (4201, 39, 'items', 1439, 63, 'title', 'Main Header', '2017-12-04 10:56:02.669-05', '2017-12-04 10:56:02.669-05');
INSERT INTO content VALUES (4202, 39, 'items', 1439, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 10:56:02.669-05', '2017-12-04 10:56:02.669-05');
INSERT INTO content VALUES (4203, 39, 'items', 1440, 63, 'title', 'Main Header', '2017-12-04 10:56:03.511-05', '2017-12-04 10:56:03.511-05');
INSERT INTO content VALUES (4204, 39, 'items', 1440, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "home", path: "/"},
          {title: "home", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 10:56:03.511-05', '2017-12-04 10:56:03.511-05');
INSERT INTO content VALUES (4205, 39, 'items', 1441, 63, 'title', 'Main Header', '2017-12-04 10:57:45.102-05', '2017-12-04 10:57:45.102-05');
INSERT INTO content VALUES (4206, 39, 'items', 1441, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 10:57:45.102-05', '2017-12-04 10:57:45.102-05');
INSERT INTO content VALUES (4207, 32, 'templates', 1442, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 text-center block capitalize">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-04 10:58:36.555-05', '2017-12-04 10:58:36.555-05');
INSERT INTO content VALUES (4208, 39, 'items', 1443, 63, 'title', 'Main Header', '2017-12-04 10:58:50.082-05', '2017-12-04 10:58:50.082-05');
INSERT INTO content VALUES (4209, 39, 'items', 1443, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 10:58:50.082-05', '2017-12-04 10:58:50.082-05');
INSERT INTO content VALUES (4210, 39, 'items', 1444, 63, 'title', 'Main Header', '2017-12-04 11:11:48.121-05', '2017-12-04 11:11:48.121-05');
INSERT INTO content VALUES (4211, 39, 'items', 1444, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center p-8 h-64 overflow-hidden z-10"
       >
    <img 
      class="w-64 self-center z-10"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 11:11:48.121-05', '2017-12-04 11:11:48.121-05');
INSERT INTO content VALUES (4212, 39, 'items', 1445, 63, 'title', 'Main Header', '2017-12-04 11:11:48.837-05', '2017-12-04 11:11:48.837-05');
INSERT INTO content VALUES (4214, 39, 'items', 1446, 63, 'title', 'Main Header', '2017-12-04 11:23:19.635-05', '2017-12-04 11:23:19.635-05');
INSERT INTO content VALUES (4527, 36, 'items', 1604, 66, 'props', '{"Main Header": {"backgroundImage": "/static/diamonds_bg.jpg"}}', '2017-12-07 11:07:27.658-05', '2017-12-07 11:07:27.658-05');
INSERT INTO content VALUES (4215, 39, 'items', 1446, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 h-64 overflow-hidden z-10 relative">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 11:23:19.635-05', '2017-12-04 11:23:19.635-05');
INSERT INTO content VALUES (4216, 40, 'items', 1447, 20, 'keywords', 'Header', '2017-12-04 11:30:33.572-05', '2017-12-04 11:30:33.572-05');
INSERT INTO content VALUES (4217, 40, 'items', 1447, 19, 'title', 'About Header', '2017-12-04 11:30:33.572-05', '2017-12-04 11:30:33.572-05');
INSERT INTO content VALUES (4218, 40, 'items', 1447, 17, 'wysiwyg', '<template>
  <div class="w-full text-center flex flex-col justify-center content-center">
  	<h1 class="capitalize text-green text-center">ABOUT UNDERWOOD JEWELERY</h1>
    <p class="w-2/3 self-center">We have earned this reputation through our dedication to a long term “Quality Philosophy.” 
      That being, fine quality will bring customers back and create new customers through the endorsements
      given to Underwood’s by our satisfied customers. 
      However, we define quality differently than most stores; because with us, quality is not just materials and craftsmanship, 
      it also includes design, presentation, service, integrity, and your experience in our store. 
      <br/>
      <br/>
      <br/>
      <strong>
        The result of this philosophy is the satisfaction a customer feels when they have chosen that special gift from Underwood’s.
      </strong>
		</p>
  </div>
</template>
', '2017-12-04 11:30:33.572-05', '2017-12-04 11:30:33.572-05');
INSERT INTO content VALUES (4219, 39, 'items', 1448, 63, 'title', 'Main Header', '2017-12-04 11:30:45.939-05', '2017-12-04 11:30:45.939-05');
INSERT INTO content VALUES (4220, 39, 'items', 1448, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 h-64 overflow-hidden z-10 relative">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 11:30:45.939-05', '2017-12-04 11:30:45.939-05');
INSERT INTO content VALUES (4221, 37, 'items', 1449, 6, 'path', '/about-us', '2017-12-04 11:31:14.224-05', '2017-12-04 11:31:14.224-05');
INSERT INTO content VALUES (4222, 37, 'items', 1449, 7, 'template', '<template>
  <div class="flex justify-around">
    <wysiwyg title="About Header"></wysiwyg>
  <div>
</template>', '2017-12-04 11:31:14.224-05', '2017-12-04 11:31:14.224-05');
INSERT INTO content VALUES (4223, 39, 'templates', 1450, 52, 'vue', '<template>
	<div class="relative">
    <slot clsas="realitve z-1">
    </slot>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: ''img''
  }
</script>
', '2017-12-04 11:49:38.401-05', '2017-12-04 11:49:38.401-05');
INSERT INTO content VALUES (4224, 41, 'items', 1451, 20, 'keywords', 'about', '2017-12-04 11:51:49.901-05', '2017-12-04 11:51:49.901-05');
INSERT INTO content VALUES (4225, 41, 'items', 1451, 19, 'title', 'About Second', '2017-12-04 11:51:49.901-05', '2017-12-04 11:51:49.901-05');
INSERT INTO content VALUES (4226, 41, 'items', 1451, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb">
    <h1>Hello World</h1>
  </image-text>
</template>', '2017-12-04 11:51:49.901-05', '2017-12-04 11:51:49.901-05');
INSERT INTO content VALUES (4227, 40, 'templates', 1452, 52, 'vue', '<template>
	<div class="relative">
    <slot clsas="realitve z-1">
    </slot>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: ''img''
  }
</script>
', '2017-12-04 11:52:11.349-05', '2017-12-04 11:52:11.349-05');
INSERT INTO content VALUES (4228, 41, 'templates', 1453, 52, 'vue', '<template>
	<div class="relative">
    <slot clsas="realitve z-1">
    </slot>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-04 11:52:15.976-05', '2017-12-04 11:52:15.976-05');
INSERT INTO content VALUES (4229, 42, 'templates', 1454, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div clsas="realitve z-1">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-04 11:54:21.657-05', '2017-12-04 11:54:21.657-05');
INSERT INTO content VALUES (4230, 43, 'templates', 1455, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div clsas="realitve z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-04 11:55:07.123-05', '2017-12-04 11:55:07.123-05');
INSERT INTO content VALUES (4231, 44, 'templates', 1456, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="realitve z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-04 11:55:29.139-05', '2017-12-04 11:55:29.139-05');
INSERT INTO content VALUES (4232, 45, 'templates', 1457, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-04 11:55:51.016-05', '2017-12-04 11:55:51.016-05');
INSERT INTO content VALUES (4233, 41, 'items', 1458, 20, 'keywords', 'about', '2017-12-04 11:56:06.671-05', '2017-12-04 11:56:06.671-05');
INSERT INTO content VALUES (4234, 41, 'items', 1458, 19, 'title', 'About Second', '2017-12-04 11:56:06.671-05', '2017-12-04 11:56:06.671-05');
INSERT INTO content VALUES (4235, 41, 'items', 1458, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb">
    
    <h1>Hello World</h1>
  
  </image-text>
</template>', '2017-12-04 11:56:06.671-05', '2017-12-04 11:56:06.671-05');
INSERT INTO content VALUES (4236, 42, 'items', 1459, 20, 'keywords', 'Header', '2017-12-04 11:56:15.07-05', '2017-12-04 11:56:15.07-05');
INSERT INTO content VALUES (4237, 42, 'items', 1459, 19, 'title', 'About Header', '2017-12-04 11:56:15.07-05', '2017-12-04 11:56:15.07-05');
INSERT INTO content VALUES (4261, 45, 'items', 1467, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:23:30.176-05', '2017-12-04 12:23:30.176-05');
INSERT INTO content VALUES (4238, 42, 'items', 1459, 17, 'wysiwyg', '<template>
  <div class="w-full text-center flex flex-col justify-center content-center">
  	<h1 class="capitalize text-green text-center">ABOUT UNDERWOOD JEWELERY</h1>
    <p class="w-2/3 self-center">We have earned this reputation through our dedication to a long term “Quality Philosophy.” 
      That being, fine quality will bring customers back and create new customers through the endorsements
      given to Underwood’s by our satisfied customers. 
      However, we define quality differently than most stores; because with us, quality is not just materials and craftsmanship, 
      it also includes design, presentation, service, integrity, and your experience in our store. 
      <br/>
      <br/>
      <br/>
      <strong>
        The result of this philosophy is the satisfaction a customer feels when they have chosen that special gift from Underwood’s.
      </strong>
		</p>
  </div>
</template>
', '2017-12-04 11:56:15.07-05', '2017-12-04 11:56:15.07-05');
INSERT INTO content VALUES (4239, 41, 'items', 1460, 20, 'keywords', 'about', '2017-12-04 11:57:10.52-05', '2017-12-04 11:57:10.52-05');
INSERT INTO content VALUES (4240, 41, 'items', 1460, 19, 'title', 'About Second', '2017-12-04 11:57:10.52-05', '2017-12-04 11:57:10.52-05');
INSERT INTO content VALUES (4241, 41, 'items', 1460, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb">
    
    <h1>Hello World</h1>
  
  </image-text>
</template>', '2017-12-04 11:57:10.52-05', '2017-12-04 11:57:10.52-05');
INSERT INTO content VALUES (4242, 37, 'items', 1461, 6, 'path', '/about-us', '2017-12-04 11:57:20.37-05', '2017-12-04 11:57:20.37-05');
INSERT INTO content VALUES (4243, 37, 'items', 1461, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header"></wysiwyg>
    <wysiwyg title="About Second"></wysiwyg>
  <div>
</template>', '2017-12-04 11:57:20.37-05', '2017-12-04 11:57:20.37-05');
INSERT INTO content VALUES (4244, 43, 'items', 1462, 20, 'keywords', NULL, '2017-12-04 12:20:43.23-05', '2017-12-04 12:20:43.23-05');
INSERT INTO content VALUES (4245, 43, 'items', 1462, 19, 'title', NULL, '2017-12-04 12:20:43.23-05', '2017-12-04 12:20:43.23-05');
INSERT INTO content VALUES (4246, 43, 'items', 1462, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:20:43.23-05', '2017-12-04 12:20:43.23-05');
INSERT INTO content VALUES (4247, 44, 'items', 1463, 20, 'keywords', NULL, '2017-12-04 12:20:56.029-05', '2017-12-04 12:20:56.029-05');
INSERT INTO content VALUES (4248, 44, 'items', 1463, 19, 'title', NULL, '2017-12-04 12:20:56.029-05', '2017-12-04 12:20:56.029-05');
INSERT INTO content VALUES (4249, 44, 'items', 1463, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:20:56.029-05', '2017-12-04 12:20:56.029-05');
INSERT INTO content VALUES (4250, 45, 'items', 1464, 20, 'keywords', NULL, '2017-12-04 12:20:57.34-05', '2017-12-04 12:20:57.34-05');
INSERT INTO content VALUES (4251, 45, 'items', 1464, 19, 'title', NULL, '2017-12-04 12:20:57.34-05', '2017-12-04 12:20:57.34-05');
INSERT INTO content VALUES (4252, 45, 'items', 1464, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:20:57.34-05', '2017-12-04 12:20:57.34-05');
INSERT INTO content VALUES (4253, 43, 'items', 1465, 20, 'keywords', 'Keywords', '2017-12-04 12:21:30.89-05', '2017-12-04 12:21:30.89-05');
INSERT INTO content VALUES (4254, 43, 'items', 1465, 19, 'title', 'About Second', '2017-12-04 12:21:30.89-05', '2017-12-04 12:21:30.89-05');
INSERT INTO content VALUES (4255, 43, 'items', 1465, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:21:30.89-05', '2017-12-04 12:21:30.89-05');
INSERT INTO content VALUES (4256, 43, 'items', 1466, 20, 'keywords', 'Keywords', '2017-12-04 12:22:05.119-05', '2017-12-04 12:22:05.119-05');
INSERT INTO content VALUES (4257, 43, 'items', 1466, 19, 'title', 'About Third', '2017-12-04 12:22:05.119-05', '2017-12-04 12:22:05.119-05');
INSERT INTO content VALUES (4258, 43, 'items', 1466, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>Hello World</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:22:05.119-05', '2017-12-04 12:22:05.119-05');
INSERT INTO content VALUES (4259, 45, 'items', 1467, 20, 'keywords', 'Keywords', '2017-12-04 12:23:30.176-05', '2017-12-04 12:23:30.176-05');
INSERT INTO content VALUES (4260, 45, 'items', 1467, 19, 'title', 'About Section 3', '2017-12-04 12:23:30.176-05', '2017-12-04 12:23:30.176-05');
INSERT INTO content VALUES (4262, 37, 'items', 1468, 6, 'path', '/about-us', '2017-12-04 12:23:55.394-05', '2017-12-04 12:23:55.394-05');
INSERT INTO content VALUES (4263, 37, 'items', 1468, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header"></wysiwyg>
    <wysiwyg title="About Section 3"></wysiwyg> 
  <div>
</template>', '2017-12-04 12:23:55.394-05', '2017-12-04 12:23:55.394-05');
INSERT INTO content VALUES (4264, 37, 'items', 1469, 6, 'path', '/about-us', '2017-12-04 12:29:04.588-05', '2017-12-04 12:29:04.588-05');
INSERT INTO content VALUES (4265, 37, 'items', 1469, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-8 pb-8"></wysiwyg>
    <wysiwyg title="About Section 3"></wysiwyg> 
  <div>
</template>', '2017-12-04 12:29:04.588-05', '2017-12-04 12:29:04.588-05');
INSERT INTO content VALUES (4266, 37, 'items', 1470, 6, 'path', '/about-us', '2017-12-04 12:29:28.918-05', '2017-12-04 12:29:28.918-05');
INSERT INTO content VALUES (4268, 37, 'items', 1471, 6, 'path', '/about-us', '2017-12-04 12:33:50.924-05', '2017-12-04 12:33:50.924-05');
INSERT INTO content VALUES (4271, 39, 'items', 1472, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 h-128 overflow-hidden z-10 relative">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 12:34:22.249-05', '2017-12-04 12:34:22.249-05');
INSERT INTO content VALUES (4272, 39, 'items', 1473, 63, 'title', 'Main Header', '2017-12-04 12:34:53.753-05', '2017-12-04 12:34:53.753-05');
INSERT INTO content VALUES (4273, 39, 'items', 1473, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 h-128 overflow-hidden z-10 relative pt-16">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 12:34:53.753-05', '2017-12-04 12:34:53.753-05');
INSERT INTO content VALUES (4274, 39, 'items', 1474, 63, 'title', 'Main Header', '2017-12-04 12:36:07.688-05', '2017-12-04 12:36:07.688-05');
INSERT INTO content VALUES (4275, 39, 'items', 1474, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-32">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 12:36:07.688-05', '2017-12-04 12:36:07.688-05');
INSERT INTO content VALUES (4276, 39, 'items', 1475, 63, 'title', 'Main Header', '2017-12-04 12:36:45.879-05', '2017-12-04 12:36:45.879-05');
INSERT INTO content VALUES (4277, 39, 'items', 1475, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-04 12:36:45.879-05', '2017-12-04 12:36:45.879-05');
INSERT INTO content VALUES (4278, 37, 'items', 1476, 6, 'path', '/about-us', '2017-12-04 12:40:07.773-05', '2017-12-04 12:40:07.773-05');
INSERT INTO content VALUES (4279, 37, 'items', 1476, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg> 
  <div>
</template>', '2017-12-04 12:40:07.773-05', '2017-12-04 12:40:07.773-05');
INSERT INTO content VALUES (4280, 11, 'templates', 1477, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: ''''
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-04 12:40:30.748-05', '2017-12-04 12:40:30.748-05');
INSERT INTO content VALUES (4281, 45, 'items', 1478, 20, 'keywords', 'Keywords', '2017-12-04 12:45:35.28-05', '2017-12-04 12:45:35.28-05');
INSERT INTO content VALUES (4282, 45, 'items', 1478, 19, 'title', 'About Section 3', '2017-12-04 12:45:35.28-05', '2017-12-04 12:45:35.28-05');
INSERT INTO content VALUES (4283, 45, 'items', 1478, 17, 'wysiwyg', '<template>
  <image-text img="https://images.pexels.com/photos/413195/pexels-photo-413195.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:45:35.28-05', '2017-12-04 12:45:35.28-05');
INSERT INTO content VALUES (4284, 45, 'items', 1479, 20, 'keywords', 'Keywords', '2017-12-04 12:48:47.736-05', '2017-12-04 12:48:47.736-05');
INSERT INTO content VALUES (4285, 45, 'items', 1479, 19, 'title', 'About Section 3', '2017-12-04 12:48:47.736-05', '2017-12-04 12:48:47.736-05');
INSERT INTO content VALUES (4286, 45, 'items', 1479, 17, 'wysiwyg', '<template>
  <image-text img="/static/gems.png" class="p-8 h-64">
    <div class="text-center w-1/2 float-right p-8 text-white">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 12:48:47.736-05', '2017-12-04 12:48:47.736-05');
INSERT INTO content VALUES (4287, 44, 'items', 1480, 20, 'keywords', NULL, '2017-12-04 14:10:28.918-05', '2017-12-04 14:10:28.918-05');
INSERT INTO content VALUES (4288, 44, 'items', 1480, 19, 'title', NULL, '2017-12-04 14:10:28.918-05', '2017-12-04 14:10:28.918-05');
INSERT INTO content VALUES (4289, 44, 'items', 1480, 17, 'wysiwyg', '<template>
	<div class="w-full p-8">
  	<div class="w-1/2  sm:w-full text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
    </div>
    <img class="w-1/2 sm:w-full" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 14:10:28.918-05', '2017-12-04 14:10:28.918-05');
INSERT INTO content VALUES (4290, 44, 'items', 1481, 20, 'keywords', 'About Section 2', '2017-12-04 14:10:47.706-05', '2017-12-04 14:10:47.706-05');
INSERT INTO content VALUES (4291, 44, 'items', 1481, 19, 'title', 'About Section 2', '2017-12-04 14:10:47.706-05', '2017-12-04 14:10:47.706-05');
INSERT INTO content VALUES (4292, 44, 'items', 1481, 17, 'wysiwyg', '<template>
	<div class="w-full p-8">
  	<div class="w-1/2  sm:w-full text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
    </div>
    <img class="w-1/2 sm:w-full" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 14:10:47.706-05', '2017-12-04 14:10:47.706-05');
INSERT INTO content VALUES (4293, 37, 'items', 1482, 6, 'path', '/about-us', '2017-12-04 14:11:23.043-05', '2017-12-04 14:11:23.043-05');
INSERT INTO content VALUES (4294, 37, 'items', 1482, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2" class="pt-32 pb-32"></wysiwyg> 
  <div>
</template>', '2017-12-04 14:11:23.043-05', '2017-12-04 14:11:23.043-05');
INSERT INTO content VALUES (4295, 44, 'items', 1483, 20, 'keywords', 'About Section 2', '2017-12-04 14:13:09.896-05', '2017-12-04 14:13:09.896-05');
INSERT INTO content VALUES (4296, 44, 'items', 1483, 19, 'title', 'About Section 2', '2017-12-04 14:13:09.896-05', '2017-12-04 14:13:09.896-05');
INSERT INTO content VALUES (4297, 44, 'items', 1483, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex">
  	<div class="w-1/2 text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
    </div>
    <img class="w-1/2 h-auto" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 14:13:09.896-05', '2017-12-04 14:13:09.896-05');
INSERT INTO content VALUES (4298, 44, 'items', 1484, 20, 'keywords', 'About Section 2', '2017-12-04 14:14:31.608-05', '2017-12-04 14:14:31.608-05');
INSERT INTO content VALUES (4299, 44, 'items', 1484, 19, 'title', 'About Section 2', '2017-12-04 14:14:31.608-05', '2017-12-04 14:14:31.608-05');
INSERT INTO content VALUES (4300, 44, 'items', 1484, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-light">
  	<div class="w-1/2 text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
    </div>
    <img class="w-1/2 h-auto" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 14:14:31.608-05', '2017-12-04 14:14:31.608-05');
INSERT INTO content VALUES (4301, 44, 'items', 1485, 20, 'keywords', 'About Section 2', '2017-12-04 14:17:55.101-05', '2017-12-04 14:17:55.101-05');
INSERT INTO content VALUES (4302, 44, 'items', 1485, 19, 'title', 'About Section 2', '2017-12-04 14:17:55.101-05', '2017-12-04 14:17:55.101-05');
INSERT INTO content VALUES (4303, 44, 'items', 1485, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-light">
  	<div class="w-1/2 text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
    </div>
    <img class="w-1/2 h-auto" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 14:17:55.101-05', '2017-12-04 14:17:55.101-05');
INSERT INTO content VALUES (4304, 45, 'items', 1486, 20, 'keywords', 'Keywords', '2017-12-04 14:19:07.534-05', '2017-12-04 14:19:07.534-05');
INSERT INTO content VALUES (4305, 45, 'items', 1486, 19, 'title', 'About Section 3', '2017-12-04 14:19:07.534-05', '2017-12-04 14:19:07.534-05');
INSERT INTO content VALUES (4306, 45, 'items', 1486, 17, 'wysiwyg', '<template>
  <image-text img="/static/gems.png" class="p-64 h-64">
    <div class="text-center w-1/2 float-right p-8 text-white">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text>
</template>', '2017-12-04 14:19:07.534-05', '2017-12-04 14:19:07.534-05');
INSERT INTO content VALUES (4307, 44, 'items', 1487, 20, 'keywords', 'About Section 2', '2017-12-04 16:25:27.027-05', '2017-12-04 16:25:27.027-05');
INSERT INTO content VALUES (4308, 44, 'items', 1487, 19, 'title', 'About Section 2', '2017-12-04 16:25:27.027-05', '2017-12-04 16:25:27.027-05');
INSERT INTO content VALUES (4309, 44, 'items', 1487, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-light items-center">
  	<div class="w-1/2 text-center">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
    </div>
    <img class="w-1/2 h-auto" src="/static/gems.png" />
  </div>
</template>', '2017-12-04 16:25:27.027-05', '2017-12-04 16:25:27.027-05');
INSERT INTO content VALUES (4310, 37, 'items', 1488, 6, 'path', '/about-us', '2017-12-04 16:25:46.254-05', '2017-12-04 16:25:46.254-05');
INSERT INTO content VALUES (4311, 37, 'items', 1488, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2" class="pt-32 pb-32"></wysiwyg> 
  <div>
</template>', '2017-12-04 16:25:46.254-05', '2017-12-04 16:25:46.254-05');
INSERT INTO content VALUES (4312, 37, 'items', 1489, 6, 'path', '/about-us', '2017-12-04 16:28:01.005-05', '2017-12-04 16:28:01.005-05');
INSERT INTO content VALUES (4313, 37, 'items', 1489, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2" class="pt-32 pb-32"></wysiwyg> 
  <div>
</template>', '2017-12-04 16:28:01.005-05', '2017-12-04 16:28:01.005-05');
INSERT INTO content VALUES (4314, 44, 'items', 1490, 20, 'keywords', 'About Section 2', '2017-12-04 16:34:50.586-05', '2017-12-04 16:34:50.586-05');
INSERT INTO content VALUES (4315, 44, 'items', 1490, 19, 'title', 'About Section 2', '2017-12-04 16:34:50.586-05', '2017-12-04 16:34:50.586-05');
INSERT INTO content VALUES (4316, 44, 'items', 1490, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-light items-center">
  	<div class="w-1/2 text-center p-4">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="w-1/2 h-auto" src="/static/GemWithTongs.png" />
  </div>
</template>', '2017-12-04 16:34:50.586-05', '2017-12-04 16:34:50.586-05');
INSERT INTO content VALUES (4317, 45, 'items', 1491, 20, 'keywords', 'Keywords', '2017-12-04 16:41:26.646-05', '2017-12-04 16:41:26.646-05');
INSERT INTO content VALUES (4318, 45, 'items', 1491, 19, 'title', 'About Section 3', '2017-12-04 16:41:26.646-05', '2017-12-04 16:41:26.646-05');
INSERT INTO content VALUES (4319, 45, 'items', 1491, 17, 'wysiwyg', '<template>
  <image-text img="/static/gems.png" class="p-64 h-64" overlay="green">
    <div class="text-center w-2/3 float-right p-4 text-white">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text> 
</template>', '2017-12-04 16:41:26.646-05', '2017-12-04 16:41:26.646-05');
INSERT INTO content VALUES (4320, 44, 'items', 1492, 20, 'keywords', 'About Section 2', '2017-12-05 13:42:44.211-05', '2017-12-05 13:42:44.211-05');
INSERT INTO content VALUES (4321, 44, 'items', 1492, 19, 'title', 'About Section 2', '2017-12-05 13:42:44.211-05', '2017-12-05 13:42:44.211-05');
INSERT INTO content VALUES (4322, 44, 'items', 1492, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-green items-center">
  	<div class="w-1/2 text-center p-4">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="w-1/2 h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 13:42:44.211-05', '2017-12-05 13:42:44.211-05');
INSERT INTO content VALUES (4323, 44, 'items', 1493, 20, 'keywords', 'About Section 2', '2017-12-05 14:02:10.639-05', '2017-12-05 14:02:10.639-05');
INSERT INTO content VALUES (4324, 44, 'items', 1493, 19, 'title', 'About Section 2', '2017-12-05 14:02:10.639-05', '2017-12-05 14:02:10.639-05');
INSERT INTO content VALUES (4343, 6, 'templates', 1511, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block ">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
  		decamel: function (text) {
  			return this.decamelize(text, '' '');
  		}
  	}
  }
</script>
<style> </style>', '2017-12-05 14:29:54.928-05', '2017-12-05 14:29:54.928-05');
INSERT INTO content VALUES (4325, 44, 'items', 1493, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-green items-center">
  	<div class="w-1/2 text-center p-4">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="w-1/2 h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 14:02:10.639-05', '2017-12-05 14:02:10.639-05');
INSERT INTO content VALUES (4326, 32, 'templates', 1494, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 text-center block uppercase">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-05 14:02:34.482-05', '2017-12-05 14:02:34.482-05');
INSERT INTO content VALUES (4327, 32, 'templates', 1495, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 text-center block uppercase tracking-wide">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-05 14:03:13.516-05', '2017-12-05 14:03:13.516-05');
INSERT INTO content VALUES (4328, 6, 'templates', 1496, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.$decamelcase(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:07:43.207-05', '2017-12-05 14:07:43.207-05');
INSERT INTO content VALUES (4329, 6, 'templates', 1497, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle(text)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.$decamelcase(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:07:59.728-05', '2017-12-05 14:07:59.728-05');
INSERT INTO content VALUES (4330, 6, 'templates', 1498, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle(text)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.$decamelcase(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:08:07.405-05', '2017-12-05 14:08:07.405-05');
INSERT INTO content VALUES (4331, 6, 'templates', 1499, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle( text )}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.$decamelcase(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:08:25.46-05', '2017-12-05 14:08:25.46-05');
INSERT INTO content VALUES (4332, 6, 'templates', 1500, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle( text )}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.decamelize(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:09:07.533-05', '2017-12-05 14:09:07.533-05');
INSERT INTO content VALUES (4333, 6, 'templates', 1501, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle( text )}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
      	return this.decamelize(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:09:21.735-05', '2017-12-05 14:09:21.735-05');
INSERT INTO content VALUES (4334, 6, 'templates', 1502, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{displayTitle( text )}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
    	displayTitle(text) {
        console.log(this.decamelize(text);
      	return this.decamelize(text, '' '')
      }
    }
  }
</script>
<style> </style>', '2017-12-05 14:09:56.456-05', '2017-12-05 14:09:56.456-05');
INSERT INTO content VALUES (4335, 6, 'templates', 1503, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{decamelize( text )}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-12-05 14:10:28.512-05', '2017-12-05 14:10:28.512-05');
INSERT INTO content VALUES (4336, 6, 'templates', 1504, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{text}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-12-05 14:10:48.169-05', '2017-12-05 14:10:48.169-05');
INSERT INTO content VALUES (4337, 6, 'templates', 1505, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{decamelize(title)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-12-05 14:11:16.437-05', '2017-12-05 14:11:16.437-05');
INSERT INTO content VALUES (4338, 6, 'templates', 1506, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-12-05 14:11:25.723-05', '2017-12-05 14:11:25.723-05');
INSERT INTO content VALUES (4339, 6, 'templates', 1507, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{decamel(title)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods{
  		decamel(text) {
  			return text
  		}
  	}
  }
</script>
<style> </style>', '2017-12-05 14:12:01.688-05', '2017-12-05 14:12:01.688-05');
INSERT INTO content VALUES (4340, 6, 'templates', 1508, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{decamel(title)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
  		decamel: function (text) {
  			return text
  		}
  	}
  }
</script>
<style> </style>', '2017-12-05 14:12:23.455-05', '2017-12-05 14:12:23.455-05');
INSERT INTO content VALUES (4341, 6, 'templates', 1509, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block">{{decamel(title)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
  		decamel: function (text) {
  			return this.decamelize(text, '' '');
  		}
  	}
  }
</script>
<style> </style>', '2017-12-05 14:12:36.912-05', '2017-12-05 14:12:36.912-05');
INSERT INTO content VALUES (4342, 6, 'templates', 1510, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block ">{{decamel(title)}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
  		decamel: function (text) {
  			return this.decamelize(text, '' '');
  		}
  	}
  }
</script>
<style> </style>', '2017-12-05 14:29:45.29-05', '2017-12-05 14:29:45.29-05');
INSERT INTO content VALUES (4344, 44, 'items', 1512, 20, 'keywords', 'About Section 2', '2017-12-05 14:31:01.683-05', '2017-12-05 14:31:01.683-05');
INSERT INTO content VALUES (4346, 44, 'items', 1512, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-grey-green items-center">
  	<div class="w-1/2 text-center p-4">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="w-1/2 h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 14:31:01.683-05', '2017-12-05 14:31:01.683-05');
INSERT INTO content VALUES (4347, 44, 'items', 1513, 20, 'keywords', 'About Section 2', '2017-12-05 14:36:27.809-05', '2017-12-05 14:36:27.809-05');
INSERT INTO content VALUES (4348, 44, 'items', 1513, 19, 'title', 'About Section 2', '2017-12-05 14:36:27.809-05', '2017-12-05 14:36:27.809-05');
INSERT INTO content VALUES (4349, 44, 'items', 1513, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-green-lightest items-center">
  	<div class="w-1/2 text-center p-4">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="w-1/2 h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 14:36:27.809-05', '2017-12-05 14:36:27.809-05');
INSERT INTO content VALUES (4350, 45, 'templates', 1514, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">Hello
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-05 14:41:29.406-05', '2017-12-05 14:41:29.406-05');
INSERT INTO content VALUES (4351, 45, 'items', 1515, 20, 'keywords', 'Keywords', '2017-12-05 14:42:31.568-05', '2017-12-05 14:42:31.568-05');
INSERT INTO content VALUES (4352, 45, 'items', 1515, 19, 'title', 'About Section 3', '2017-12-05 14:42:31.568-05', '2017-12-05 14:42:31.568-05');
INSERT INTO content VALUES (4353, 45, 'items', 1515, 17, 'wysiwyg', '<template>
  <image-text img="/static/diamonds_bg.jpg" class="p-32 h-32" overlay="green">
    <div class="text-center w-2/3 float-right p-4 text-white">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text> 
</template>', '2017-12-05 14:42:31.568-05', '2017-12-05 14:42:31.568-05');
INSERT INTO content VALUES (4354, 45, 'templates', 1516, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">Hello
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-05 14:43:00.205-05', '2017-12-05 14:43:00.205-05');
INSERT INTO content VALUES (4355, 43, 'templates', 1517, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div clsas="realitve z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-05 14:45:06.357-05', '2017-12-05 14:45:06.357-05');
INSERT INTO content VALUES (4356, 45, 'templates', 1518, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-05 14:45:20.806-05', '2017-12-05 14:45:20.806-05');
INSERT INTO content VALUES (4357, 45, 'items', 1519, 20, 'keywords', 'Keywords', '2017-12-05 14:46:55.421-05', '2017-12-05 14:46:55.421-05');
INSERT INTO content VALUES (4358, 45, 'items', 1519, 19, 'title', 'About Section 3', '2017-12-05 14:46:55.421-05', '2017-12-05 14:46:55.421-05');
INSERT INTO content VALUES (4359, 45, 'items', 1519, 17, 'wysiwyg', '<template>
  <image-text img="/static/diamonds_bg.jpg" class="p-32" overlay="green">
    <div class="text-center w-2/3 float-right p-4 text-white">
    <h1>The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text> 
</template>', '2017-12-05 14:46:55.421-05', '2017-12-05 14:46:55.421-05');
INSERT INTO content VALUES (4360, 45, 'items', 1520, 20, 'keywords', 'Keywords', '2017-12-05 14:49:50.88-05', '2017-12-05 14:49:50.88-05');
INSERT INTO content VALUES (4361, 45, 'items', 1520, 19, 'title', 'About Section 3', '2017-12-05 14:49:50.88-05', '2017-12-05 14:49:50.88-05');
INSERT INTO content VALUES (4362, 45, 'items', 1520, 17, 'wysiwyg', '<template>
  <image-text img="/static/diamonds_bg.jpg" class="p-32" overlay="green">
    <div class="text-center lg:w-1/3 md:w-1/2 sm:w-full float-right p-4 text-white">
    <h1 class="uppercase">The Underwood''s Philosophy</h1>
      <p>
        At Underwood''s we are devoted to being the best Jeweler in the South. We accomplish this through our long-term philosophy that quality in merchandise, presentation, personal service, and our integrity will bring the customer back to shop with us.
  			<br/><br/>
        This same “Underwood Experience” will create new customers through the endorsements from our satisfied customers. It is up to each of us to take care of our customer because if we don’t someone else will and the returning customer sets our future.
      </p>
    </div>
  </image-text> 
</template>', '2017-12-05 14:49:50.88-05', '2017-12-05 14:49:50.88-05');
INSERT INTO content VALUES (4363, 45, 'templates', 1521, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" class="w-full md:absolute sm:relative pin-l pin-t z-0"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'']
  }
</script>
', '2017-12-05 14:52:10.393-05', '2017-12-05 14:52:10.393-05');
INSERT INTO content VALUES (4364, 45, 'templates', 1522, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">Hello
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const class = this.imageClasses ? this.imageClasses.split('' '') : [];
        class.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	class.push(''sm:w-full'', ''sm:relative'')
        }
        return class.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 14:58:05.477-05', '2017-12-05 14:58:05.477-05');
INSERT INTO content VALUES (4365, 45, 'templates', 1523, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">Hello
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const class = this.imageClasses ? this.imageClasses.split('' '') : [];
        class.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	class.push(''sm:w-full'', ''sm:relative'')
        }
        return class.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 14:58:24.111-05', '2017-12-05 14:58:24.111-05');
INSERT INTO content VALUES (4366, 45, 'templates', 1524, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const class = this.imageClasses ? this.imageClasses.split('' '') : [];
        class.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	class.push(''sm:w-full'', ''sm:relative'')
        }
        return class.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 14:58:33.82-05', '2017-12-05 14:58:33.82-05');
INSERT INTO content VALUES (4367, 45, 'templates', 1525, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 14:59:23.823-05', '2017-12-05 14:59:23.823-05');
INSERT INTO content VALUES (4368, 45, 'templates', 1526, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 14:59:53.577-05', '2017-12-05 14:59:53.577-05');
INSERT INTO content VALUES (4369, 45, 'templates', 1527, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''sm:relative'' ''pin-l'' ''pin-t'' ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:00:14.142-05', '2017-12-05 15:00:14.142-05');
INSERT INTO content VALUES (4370, 39, 'templates', 1528, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''sm:relative'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:01:14.637-05', '2017-12-05 15:01:14.637-05');
INSERT INTO content VALUES (4371, 39, 'templates', 1529, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''lg:absolute'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:04:27.403-05', '2017-12-05 15:04:27.403-05');
INSERT INTO content VALUES (4372, 39, 'templates', 1530, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:04:48.144-05', '2017-12-05 15:04:48.144-05');
INSERT INTO content VALUES (4373, 39, 'templates', 1531, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" style="object-fit: cover; object-position: center"/>
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:08:55.723-05', '2017-12-05 15:08:55.723-05');
INSERT INTO content VALUES (4528, 36, 'items', 1604, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:07:27.658-05', '2017-12-07 11:07:27.658-05');
INSERT INTO content VALUES (4374, 39, 'templates', 1532, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" />
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:18:50.17-05', '2017-12-05 15:18:50.17-05');
INSERT INTO content VALUES (4375, 39, 'templates', 1533, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" />
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:21:11.323-05', '2017-12-05 15:21:11.323-05');
INSERT INTO content VALUES (4376, 37, 'items', 1534, 6, 'path', '/about-us', '2017-12-05 15:24:07.55-05', '2017-12-05 15:24:07.55-05');
INSERT INTO content VALUES (4377, 37, 'items', 1534, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2"></wysiwyg> 
  <div>
</template>', '2017-12-05 15:24:07.55-05', '2017-12-05 15:24:07.55-05');
INSERT INTO content VALUES (4378, 44, 'items', 1535, 20, 'keywords', 'About Section 2', '2017-12-05 15:29:43.576-05', '2017-12-05 15:29:43.576-05');
INSERT INTO content VALUES (4379, 44, 'items', 1535, 19, 'title', 'About Section 2', '2017-12-05 15:29:43.576-05', '2017-12-05 15:29:43.576-05');
INSERT INTO content VALUES (4380, 44, 'items', 1535, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-green-lightest items-center">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:29:43.576-05', '2017-12-05 15:29:43.576-05');
INSERT INTO content VALUES (4381, 39, 'templates', 1536, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" />
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0 fit-cover fit-center'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:32:06.536-05', '2017-12-05 15:32:06.536-05');
INSERT INTO content VALUES (4382, 39, 'templates', 1537, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" />
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'', ''min-h-full'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-05 15:37:51.62-05', '2017-12-05 15:37:51.62-05');
INSERT INTO content VALUES (4383, 39, 'items', 1538, 63, 'title', 'Main Header', '2017-12-05 15:39:31.269-05', '2017-12-05 15:39:31.269-05');
INSERT INTO content VALUES (4384, 39, 'items', 1538, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-05 15:39:31.269-05', '2017-12-05 15:39:31.269-05');
INSERT INTO content VALUES (4385, 44, 'items', 1539, 20, 'keywords', 'About Section 2', '2017-12-05 15:39:58.671-05', '2017-12-05 15:39:58.671-05');
INSERT INTO content VALUES (4386, 44, 'items', 1539, 19, 'title', 'About Section 2', '2017-12-05 15:39:58.671-05', '2017-12-05 15:39:58.671-05');
INSERT INTO content VALUES (4387, 44, 'items', 1539, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-green-lightest items-center">
  	<div class="lg:w-1/2 text-center p-4 md:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 md:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:39:58.671-05', '2017-12-05 15:39:58.671-05');
INSERT INTO content VALUES (4388, 44, 'items', 1540, 20, 'keywords', 'About Section 2', '2017-12-05 15:40:50.78-05', '2017-12-05 15:40:50.78-05');
INSERT INTO content VALUES (4389, 44, 'items', 1540, 19, 'title', 'About Section 2', '2017-12-05 15:40:50.78-05', '2017-12-05 15:40:50.78-05');
INSERT INTO content VALUES (4390, 44, 'items', 1540, 17, 'wysiwyg', '<template>
	<div class="w-full p-8 flex bg-green-lightest items-center flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 md:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 md:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:40:50.78-05', '2017-12-05 15:40:50.78-05');
INSERT INTO content VALUES (4391, 44, 'items', 1541, 20, 'keywords', 'About Section 2', '2017-12-05 15:41:25.424-05', '2017-12-05 15:41:25.424-05');
INSERT INTO content VALUES (4392, 44, 'items', 1541, 19, 'title', 'About Section 2', '2017-12-05 15:41:25.424-05', '2017-12-05 15:41:25.424-05');
INSERT INTO content VALUES (4393, 44, 'items', 1541, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 md:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 md:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:41:25.424-05', '2017-12-05 15:41:25.424-05');
INSERT INTO content VALUES (4394, 44, 'items', 1542, 20, 'keywords', 'About Section 2', '2017-12-05 15:41:58.736-05', '2017-12-05 15:41:58.736-05');
INSERT INTO content VALUES (4395, 44, 'items', 1542, 19, 'title', 'About Section 2', '2017-12-05 15:41:58.736-05', '2017-12-05 15:41:58.736-05');
INSERT INTO content VALUES (4396, 44, 'items', 1542, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:41:58.736-05', '2017-12-05 15:41:58.736-05');
INSERT INTO content VALUES (4397, 44, 'items', 1543, 20, 'keywords', 'About Section 2', '2017-12-05 15:42:54.674-05', '2017-12-05 15:42:54.674-05');
INSERT INTO content VALUES (4398, 44, 'items', 1543, 19, 'title', 'About Section 2', '2017-12-05 15:42:54.674-05', '2017-12-05 15:42:54.674-05');
INSERT INTO content VALUES (4399, 44, 'items', 1543, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:42:54.674-05', '2017-12-05 15:42:54.674-05');
INSERT INTO content VALUES (4400, 44, 'items', 1544, 20, 'keywords', 'About Section 2', '2017-12-05 15:44:59.411-05', '2017-12-05 15:44:59.411-05');
INSERT INTO content VALUES (4401, 44, 'items', 1544, 19, 'title', 'About Section 2', '2017-12-05 15:44:59.411-05', '2017-12-05 15:44:59.411-05');
INSERT INTO content VALUES (4402, 44, 'items', 1544, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center lg:flex-no-wrap sm:flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:44:59.411-05', '2017-12-05 15:44:59.411-05');
INSERT INTO content VALUES (4405, 44, 'items', 1545, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center lg:flex-no-wrap sm:flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h1 class="text-green">THE UNDERWOOD DIAMOND</h1>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 15:55:47.016-05', '2017-12-05 15:55:47.016-05');
INSERT INTO content VALUES (4406, 44, 'items', 1546, 20, 'keywords', 'About Section 2', '2017-12-05 16:08:21.066-05', '2017-12-05 16:08:21.066-05');
INSERT INTO content VALUES (4407, 44, 'items', 1546, 19, 'title', 'About Section 2', '2017-12-05 16:08:21.066-05', '2017-12-05 16:08:21.066-05');
INSERT INTO content VALUES (4408, 44, 'items', 1546, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center lg:flex-no-wrap sm:flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h1 class="text-green">THE UNDERWOOD DIAMOND</h1>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 16:08:21.066-05', '2017-12-05 16:08:21.066-05');
INSERT INTO content VALUES (4409, 44, 'items', 1547, 20, 'keywords', 'About Section 2', '2017-12-05 16:08:22.755-05', '2017-12-05 16:08:22.755-05');
INSERT INTO content VALUES (4410, 44, 'items', 1547, 19, 'title', 'About Section 2', '2017-12-05 16:08:22.755-05', '2017-12-05 16:08:22.755-05');
INSERT INTO content VALUES (4411, 44, 'items', 1547, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center lg:flex-no-wrap sm:flex-wrap">
  	<div class="lg:w-1/2 text-center p-4 sm:w-full">
      <h1 class="text-green">THE UNDERWOOD DIAMOND</h1>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p>
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 16:08:22.755-05', '2017-12-05 16:08:22.755-05');
INSERT INTO content VALUES (4412, 44, 'items', 1548, 20, 'keywords', 'About Section 2', '2017-12-05 16:17:30.133-05', '2017-12-05 16:17:30.133-05');
INSERT INTO content VALUES (4413, 44, 'items', 1548, 19, 'title', 'About Section 2', '2017-12-05 16:17:30.133-05', '2017-12-05 16:17:30.133-05');
INSERT INTO content VALUES (4414, 44, 'items', 1548, 17, 'wysiwyg', '<template>
	<div class="w-full pt-8 pb-8 flex bg-green-lightest items-center lg:flex-no-wrap sm:flex-wrap">
  	<div class="lg:w-1/2 text-center pb-8 pl-8 pr-8 sm:w-full">
      <h3 class="text-green">THE UNDERWOOD DIAMOND</h3>
      <p>
        <strong>This journey begins in a diamond cutter’s office with our inspection of rough diamonds, 
partially faceted diamonds and fully finished cut diamonds.</strong>
        <br/><br/>
First and foremost, diamonds are inspected for the quality of how they are cut.  Underwood’s
Certified Gemologists, C. Clayton Bromberg and R. Michael Richards, are the only 
diamond buyers known by the diamond-cutting community to use the Angular Spectral Evaluation Tool 
(ASET) which allows the viewer to evaluate a diamond’s light performance.  Once diamonds are selected for their quality of light 
performance they are sorted two more times:  first for color and second for clarity.  Underwood’s exacting standards are then verified by one of two diamond grading laboratories:  
The Gemological Institute of American (GIA) or the American Gem Society Laboratory (AGSL).  
At this point these diamonds are sent to Jacksonville for final examination in our own American
Gem Society (AGS) Accredited Gem Lab.
      </p> 
      <img src="/static/AmericanSociety.png">
    </div>
    <img class="lg:w-1/2 sm:w-full h-auto" src="/static/diamonds.png" />
  </div>
</template>', '2017-12-05 16:17:30.133-05', '2017-12-05 16:17:30.133-05');
INSERT INTO content VALUES (4415, 39, 'items', 1549, 63, 'title', 'Main Header', '2017-12-05 16:19:37.673-05', '2017-12-05 16:19:37.673-05');
INSERT INTO content VALUES (4416, 39, 'items', 1549, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-05 16:19:37.673-05', '2017-12-05 16:19:37.673-05');
INSERT INTO content VALUES (4417, 39, 'items', 1550, 63, 'title', 'Main Header', '2017-12-05 16:19:38.275-05', '2017-12-05 16:19:38.275-05');
INSERT INTO content VALUES (4418, 39, 'items', 1550, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img src="/static/headerImg.jpg" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-05 16:19:38.275-05', '2017-12-05 16:19:38.275-05');
INSERT INTO content VALUES (4419, 3, 'templates', 1551, 55, 'vue', '<template>
  <nav :class="classList">
    <p class="p-4">Smart Site Admin</p>
    	<h1>Settings</h1>
    		<ul class="list-reset">
          <admin-menu-item title="Create Resource" path="/admin/create/resource"></admin-menu-item>
    		</ul>
    	<h1>Resources</h1>
      <ul v-for="item in resources" class="list-reset">
       <admin-menu-item :path="path(item)" :title="item"></admin-menu-item>
     </ul>
  </nav>
</template>
<script>
  module.exports = {
    name: "admin-menu",
    data() {
      return {
        resources: [],
        classList: [
          ''flex'',
          ''flex-col'',
          ''items-center'',
          ''justify-start'',
          ''h-screen'',
          ''bg-grey-darkest''
        ]
      }
    },
    methods: {
      path(resource_name) { return `/admin/resource/${resource_name}`}
    },
    beforeMount () {
      this.$apolloClient.query({
        query: this.$gql`
          {
            allResources{
              nodes {
                name
              }
            }
          }
        `
      })
      .then(r => {
        resources = r.data.allResources.nodes.map(resource => this.$camelCase(resource.name))
        console.log(''resources'', resources)
        this.resources = resources
      })
    }
  }
</script>
<style> </style>', '2017-12-06 12:37:14.427-05', '2017-12-06 12:37:14.427-05');
INSERT INTO content VALUES (4420, 46, 'templates', 1552, 52, 'vue', '<template>
  <div>
    <img src />
    <div :class="title_classes_constructed">
      <slot named="title">
      </slot>
    </div>
    <div :class="content_classes_constructed">
      <slot named="content">
      </slot>
    </div>
  <div>
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
    	title_classes: {
      	type: Array,
        default: 
      },
      content_classes: {
        type: Array,
      }
    }
  }
</script>', '2017-12-06 13:48:56.167-05', '2017-12-06 13:48:56.167-05');
INSERT INTO content VALUES (4421, 47, 'templates', 1553, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" c;/>
    <div :class="title_classes">
      <slot named="title">
        Test
      </slot>
    </div>
    <div :class="content_classes">
      <slot named="content">
        Test test test st. ateklaesfkj aektllakjet . aetklae
        adsklaketa.aflak esflfakdlfka dfa
        dsfasdf
         adsf
        a dsfadsf adlklkdjfl djslkvjladksj ls
      </slot>
    </div>
  <div>
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: [''text-yellow'']
      },
      card_classes: {
        type: Array,
        default: ["text-red"]
      },
      content_classes: {
        type: Array,
        default: ["text-blue", "lg:w-1/4 md:w-1/2 sm:w-full"]
      }
    },
  }
</script>', '2017-12-06 13:57:51.059-05', '2017-12-06 13:57:51.059-05');
INSERT INTO content VALUES (4422, 47, 'templates', 1554, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot named="title">
      </slot>
    </div>
    <div :class="content_classes">
      <slot named="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''text-yellow'', ''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["text-red bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:04:51.745-05', '2017-12-06 14:04:51.745-05');
INSERT INTO content VALUES (4423, 43, 'items', 1555, 20, 'keywords', 'Keywords', '2017-12-06 14:08:41.764-05', '2017-12-06 14:08:41.764-05');
INSERT INTO content VALUES (4424, 43, 'items', 1555, 19, 'title', 'About Third', '2017-12-06 14:08:41.764-05', '2017-12-06 14:08:41.764-05');
INSERT INTO content VALUES (4425, 43, 'items', 1555, 17, 'wysiwyg', '<template>
	<wysiwyg-image-card img_src="gems_on_white.jpg">
    
  </wysiwyg-card>
</template>', '2017-12-06 14:08:41.764-05', '2017-12-06 14:08:41.764-05');
INSERT INTO content VALUES (4426, 47, 'templates', 1556, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="title">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''text-yellow'', ''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["text-red bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:10:02.506-05', '2017-12-06 14:10:02.506-05');
INSERT INTO content VALUES (4427, 43, 'items', 1557, 20, 'keywords', 'Keywords', '2017-12-06 14:11:17.553-05', '2017-12-06 14:11:17.553-05');
INSERT INTO content VALUES (4428, 43, 'items', 1557, 19, 'title', 'About Third', '2017-12-06 14:11:17.553-05', '2017-12-06 14:11:17.553-05');
INSERT INTO content VALUES (4429, 43, 'items', 1557, 17, 'wysiwyg', '<template>
	<wysiwyg-image-card img_src="/static/gems_on_white.jpg">
    <h1 slot="header">
    	This is the title
    </h1>
    <p slot="content">
    	This is the content
    </p>
  </wysiwyg-image-card>
</template>', '2017-12-06 14:11:17.553-05', '2017-12-06 14:11:17.553-05');
INSERT INTO content VALUES (4430, 43, 'items', 1558, 20, 'keywords', 'Keywords', '2017-12-06 14:12:04.215-05', '2017-12-06 14:12:04.215-05');
INSERT INTO content VALUES (4431, 43, 'items', 1558, 19, 'title', 'About Third', '2017-12-06 14:12:04.215-05', '2017-12-06 14:12:04.215-05');
INSERT INTO content VALUES (4432, 43, 'items', 1558, 17, 'wysiwyg', '<template>
	<wysiwyg-image-card img_src="/static/gems_on_white.jpg">
    <h1 slot="header">
    	This is the title
    </h1>
    <p slot="content">
    	This is the content
    </p>
  </wysiwyg-image-card>
</template>', '2017-12-06 14:12:04.215-05', '2017-12-06 14:12:04.215-05');
INSERT INTO content VALUES (4581, 48, 'items', 1653, 62, 'wyiswyg', '<template>
  <div class="bg-green w-full p-4 text-center text-white">
    ©{{year}} UNDERWOODS JEWELERS. ALL RIGHTS RESERVED.
  </div>
</template>
<script>
  module.exports = {
  	name: ''pageFooter'',
    data() {
      return {
    		year: new Date().getFullYear()
      }
    }
  }
</script>', '2017-12-07 15:02:52.751-05', '2017-12-07 15:02:52.751-05');
INSERT INTO content VALUES (4433, 47, 'templates', 1559, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="title">
      </slot>
    </div>
    <div :class="content_classes">
      <slot>
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''text-yellow'', ''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["text-red bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:13:01.182-05', '2017-12-06 14:13:01.182-05');
INSERT INTO content VALUES (4434, 47, 'templates', 1560, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot>
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''text-yellow'', ''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["text-red bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:13:37.493-05', '2017-12-06 14:13:37.493-05');
INSERT INTO content VALUES (4435, 47, 'templates', 1561, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''text-yellow'', ''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["text-red bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:15:44.412-05', '2017-12-06 14:15:44.412-05');
INSERT INTO content VALUES (4436, 47, 'templates', 1562, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
          "text-blue",
        	"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:16:15.047-05', '2017-12-06 14:16:15.047-05');
INSERT INTO content VALUES (4437, 47, 'templates', 1563, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
					"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:16:27.269-05', '2017-12-06 14:16:27.269-05');
INSERT INTO content VALUES (4438, 43, 'items', 1564, 20, 'keywords', 'Keywords', '2017-12-06 14:18:47.537-05', '2017-12-06 14:18:47.537-05');
INSERT INTO content VALUES (4439, 43, 'items', 1564, 19, 'title', 'About Third', '2017-12-06 14:18:47.537-05', '2017-12-06 14:18:47.537-05');
INSERT INTO content VALUES (4440, 43, 'items', 1564, 17, 'wysiwyg', '<template>
	<wysiwyg-image-card img_src="/static/gems_on_white.jpg">
    <h1 slot="header">
    	the Underwood standard
    </h1>
    <p slot="content">
Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
  </wysiwyg-image-card>
</template>', '2017-12-06 14:18:47.537-05', '2017-12-06 14:18:47.537-05');
INSERT INTO content VALUES (4441, 43, 'items', 1565, 20, 'keywords', 'Keywords', '2017-12-06 14:25:09.502-05', '2017-12-06 14:25:09.502-05');
INSERT INTO content VALUES (4442, 43, 'items', 1565, 19, 'title', 'About Third', '2017-12-06 14:25:09.502-05', '2017-12-06 14:25:09.502-05');
INSERT INTO content VALUES (4443, 43, 'items', 1565, 17, 'wysiwyg', '<template>
  <div class="flex w-full">
	<wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
    <h1 slot="header">
    	the Underwood standard
    </h1>
    <p slot="content" class="text-grey">
Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
  </wysiwyg-image-card>
	  <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	Diamond Quality Certificate
    </h1>
    <p slot="content" class="text-grey">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:25:09.502-05', '2017-12-06 14:25:09.502-05');
INSERT INTO content VALUES (4444, 43, 'items', 1566, 20, 'keywords', 'Keywords', '2017-12-06 14:28:48.69-05', '2017-12-06 14:28:48.69-05');
INSERT INTO content VALUES (4445, 43, 'items', 1566, 19, 'title', 'About Third', '2017-12-06 14:28:48.69-05', '2017-12-06 14:28:48.69-05');
INSERT INTO content VALUES (4446, 43, 'items', 1566, 17, 'wysiwyg', '<template>
  <div class="flex w-full">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h1 slot="header">
        the Underwood standard
      </h1>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	Diamond Quality Certificate
    </h1>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	brighter and more beautiful
    </h1>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	The Underwood Distinction
    </h1>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:28:48.69-05', '2017-12-06 14:28:48.69-05');
INSERT INTO content VALUES (4447, 43, 'items', 1567, 20, 'keywords', 'Keywords', '2017-12-06 14:29:20.073-05', '2017-12-06 14:29:20.073-05');
INSERT INTO content VALUES (4448, 43, 'items', 1567, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:29:20.073-05', '2017-12-06 14:29:20.073-05');
INSERT INTO content VALUES (4449, 43, 'items', 1567, 17, 'wysiwyg', '<template>
  <div class="flex w-full">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h1 slot="header">
        the Underwood standard
      </h1>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	Diamond Quality Certificate
    </h1>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	brighter and more beautiful
    </h1>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	The Underwood Distinction
    </h1>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:29:20.073-05', '2017-12-06 14:29:20.073-05');
INSERT INTO content VALUES (4450, 43, 'items', 1568, 20, 'keywords', 'Keywords', '2017-12-06 14:33:50.002-05', '2017-12-06 14:33:50.002-05');
INSERT INTO content VALUES (4451, 43, 'items', 1568, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:33:50.002-05', '2017-12-06 14:33:50.002-05');
INSERT INTO content VALUES (4452, 43, 'items', 1568, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h1 slot="header">
        the Underwood standard
      </h1>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	Diamond Quality Certificate
    </h1>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	brighter and more beautiful
    </h1>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	The Underwood Distinction
    </h1>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:33:50.002-05', '2017-12-06 14:33:50.002-05');
INSERT INTO content VALUES (4453, 43, 'items', 1569, 20, 'keywords', 'Keywords', '2017-12-06 14:34:06.67-05', '2017-12-06 14:34:06.67-05');
INSERT INTO content VALUES (4454, 43, 'items', 1569, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:34:06.67-05', '2017-12-06 14:34:06.67-05');
INSERT INTO content VALUES (4455, 43, 'items', 1569, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h1 slot="header">
        the Underwood standard
      </h1>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	Diamond Quality Certificate
    </h1>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	brighter and more beautiful
    </h1>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h1 slot="header">
    	The Underwood Distinction
    </h1>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:34:06.67-05', '2017-12-06 14:34:06.67-05');
INSERT INTO content VALUES (4456, 37, 'items', 1570, 6, 'path', '/about-us', '2017-12-06 14:34:19.521-05', '2017-12-06 14:34:19.521-05');
INSERT INTO content VALUES (4457, 37, 'items', 1570, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2"></wysiwyg> 
    <wysiwyg title="About Us 4 Cards" class="bg-green-lightest"></wysiwyg> 
  <div>
</template>', '2017-12-06 14:34:19.521-05', '2017-12-06 14:34:19.521-05');
INSERT INTO content VALUES (4458, 43, 'items', 1571, 20, 'keywords', 'Keywords', '2017-12-06 14:40:54.871-05', '2017-12-06 14:40:54.871-05');
INSERT INTO content VALUES (4459, 43, 'items', 1571, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:40:54.871-05', '2017-12-06 14:40:54.871-05');
INSERT INTO content VALUES (4583, 46, 'items', 1654, 62, 'wyiswyg', '<template>
  <div class="text-center p-8 text-white bg-green">
    ©{{year}} UNDERWOOD JEWELERS. ALL RIGHTS RESERVED
  </div>
</template>
<script>
  module.exports = {
  	name: ''Page Footer'',
    data() {
    	return {
      	year: new Date().getFullYear()
      }
    }
  }
</script>', '2017-12-07 15:07:06.202-05', '2017-12-07 15:07:06.202-05');
INSERT INTO content VALUES (4460, 43, 'items', 1571, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:40:54.871-05', '2017-12-06 14:40:54.871-05');
INSERT INTO content VALUES (4461, 43, 'items', 1572, 20, 'keywords', 'Keywords', '2017-12-06 14:41:21.726-05', '2017-12-06 14:41:21.726-05');
INSERT INTO content VALUES (4462, 43, 'items', 1572, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:41:21.726-05', '2017-12-06 14:41:21.726-05');
INSERT INTO content VALUES (4463, 43, 'items', 1572, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-8">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/><br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-8">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:41:21.726-05', '2017-12-06 14:41:21.726-05');
INSERT INTO content VALUES (4464, 47, 'templates', 1573, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'', ''text-center'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-1/2 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
					"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 14:42:05.711-05', '2017-12-06 14:42:05.711-05');
INSERT INTO content VALUES (4465, 43, 'items', 1574, 20, 'keywords', 'Keywords', '2017-12-06 14:42:55.382-05', '2017-12-06 14:42:55.382-05');
INSERT INTO content VALUES (4466, 43, 'items', 1574, 19, 'title', 'About Us 4 Cards', '2017-12-06 14:42:55.382-05', '2017-12-06 14:42:55.382-05');
INSERT INTO content VALUES (4467, 43, 'items', 1574, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-4">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/><br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 14:42:55.382-05', '2017-12-06 14:42:55.382-05');
INSERT INTO content VALUES (4468, 43, 'items', 1575, 20, 'keywords', 'Keywords', '2017-12-06 16:41:36.395-05', '2017-12-06 16:41:36.395-05');
INSERT INTO content VALUES (4469, 43, 'items', 1575, 19, 'title', 'About Us 4 Cards', '2017-12-06 16:41:36.395-05', '2017-12-06 16:41:36.395-05');
INSERT INTO content VALUES (4470, 43, 'items', 1575, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap justify-center">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-4">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/><br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 16:41:36.395-05', '2017-12-06 16:41:36.395-05');
INSERT INTO content VALUES (4471, 47, 'templates', 1576, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'', ''text-center'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-5/6 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
					"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 16:42:14.369-05', '2017-12-06 16:42:14.369-05');
INSERT INTO content VALUES (4472, 47, 'templates', 1577, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'', ''text-center'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-5/6 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
					"p-4"
        ]
      }
    },
  }
</script>', '2017-12-06 16:44:43.984-05', '2017-12-06 16:44:43.984-05');
INSERT INTO content VALUES (4473, 43, 'items', 1578, 20, 'keywords', 'Keywords', '2017-12-06 16:45:18.811-05', '2017-12-06 16:45:18.811-05');
INSERT INTO content VALUES (4474, 43, 'items', 1578, 19, 'title', 'About Us 4 Cards', '2017-12-06 16:45:18.811-05', '2017-12-06 16:45:18.811-05');
INSERT INTO content VALUES (4475, 43, 'items', 1578, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap justify-center">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="m-4">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="m-4">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="m-4">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/><br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="m-4">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 16:45:18.811-05', '2017-12-06 16:45:18.811-05');
INSERT INTO content VALUES (4476, 43, 'items', 1579, 20, 'keywords', 'Keywords', '2017-12-06 16:46:18.947-05', '2017-12-06 16:46:18.947-05');
INSERT INTO content VALUES (4477, 43, 'items', 1579, 19, 'title', 'About Us 4 Cards', '2017-12-06 16:46:18.947-05', '2017-12-06 16:46:18.947-05');
INSERT INTO content VALUES (4478, 43, 'items', 1579, 17, 'wysiwyg', '<template>
  <div class="flex w-full lg:flex-no-wrap md:flex-wrap sm:flex-wrap justify-center">
    
    <!-- Card 1 -->
    <wysiwyg-image-card img_src="/static/gems_on_white.jpg" class="max-w-sm m-4">
      <h3 slot="header">
        the Underwood standard
      </h3>
      <p slot="content" class="text-grey text-center">
  Once in our store the diamonds are cross-checked by both gemologists again.  This confirmation of quality includes actually measuring for light performance using a computerized non-contact optical scanner that employs AGS performance grading software (measuring all nine factors that determine beauty in a diamond).  Next, the diamond is color graded against color grading master diamonds and clarity graded using a binocular microscope.  If the diamond measures up to the Underwood standards for light performance, color and clarity, it will be purchased for our inventory.    </p>
    </wysiwyg-image-card>
    
	  <!-- Card 2 -->
    <wysiwyg-image-card img_src="/static/3_rings.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	Diamond Quality Certificate
    </h3>
    <p slot="content" class="text-grey text-center">
    Round diamonds are then sent to the American Gem Society Diamond Grading Laboratory to have an actual Diamond Quality Certificate issued.  These diamonds will be microscopically laser inscribed on the girdle with the Underwood’s name and the unique serial number that relates back to the numbered certificate.  
		<br/><br/>
    This Diamond Quality Certificate is an actual guarantee of the quality of that diamond by the American Gem Society, the American Gem Society Laboratory, and Underwood’s.  
    </p>
    </wysiwyg-image-card>
    
    <!-- Card 3 -->
    <wysiwyg-image-card img_src="/static/ring_in_box.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	brighter and more beautiful
    </h3>
    <p slot="content" class="text-grey text-center">    
    If you wonder why we go to these extremes to purchase a diamond for our inventory, our answer is that we want every Underwood diamond to be brighter and more beautiful than any other diamond.  
    <br/><br/>
    We don’t leave this to chance; we use science to make it happen, employing every weapon in the gemological arsenal to make sure our diamonds are beautiful
    </p>
    </wysiwyg-image-card>
        
    <!-- Card 4 -->
    <wysiwyg-image-card img_src="/static/holding_ring.jpg"  class="max-w-sm m-4">
    <h3 slot="header">
    	The Underwood Distinction
    </h3>
    <p slot="content" class="text-grey text-center">    
    Starting with our visit to the office of a diamond cutter and ending in our Accredited Gem Lab, we reject an average of 95 out of every 100 diamonds placed before us to purchase.  
		<br/><br/>
    We take great pride in the distinction an 
    Underwood diamond gives to the wearer, 
    setting her apart.
    </p>
    </wysiwyg-image-card>
  </div>
</template>', '2017-12-06 16:46:18.947-05', '2017-12-06 16:46:18.947-05');
INSERT INTO content VALUES (4479, 36, 'items', 1580, 6, 'path', '/', '2017-12-07 08:34:23.167-05', '2017-12-07 08:34:23.167-05');
INSERT INTO content VALUES (4480, 36, 'items', 1580, 7, 'template', '<template>
  <div class="flex">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 08:34:23.167-05', '2017-12-07 08:34:23.167-05');
INSERT INTO content VALUES (4481, 36, 'items', 1581, 6, 'path', '/', '2017-12-07 08:35:26.586-05', '2017-12-07 08:35:26.586-05');
INSERT INTO content VALUES (4482, 36, 'items', 1581, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 08:35:26.586-05', '2017-12-07 08:35:26.586-05');
INSERT INTO content VALUES (4483, 40, 'items', 1582, 20, 'keywords', 'Header', '2017-12-07 10:05:11.066-05', '2017-12-07 10:05:11.066-05');
INSERT INTO content VALUES (4484, 40, 'items', 1582, 19, 'title', 'About Header', '2017-12-07 10:05:11.066-05', '2017-12-07 10:05:11.066-05');
INSERT INTO content VALUES (4485, 40, 'items', 1582, 17, 'wysiwyg', '<template>
  <div class="w-full text-center flex flex-col justify-center content-center">
  	<h1 class="capitalize text-green text-center">ABOUT UNDERWOOD JEWELERY UPDATED</h1>
    <p class="w-2/3 self-center">We have earned this reputation through our dedication to a long term “Quality Philosophy.” 
      That being, fine quality will bring customers back and create new customers through the endorsements
      given to Underwood’s by our satisfied customers. 
      However, we define quality differently than most stores; because with us, quality is not just materials and craftsmanship, 
      it also includes design, presentation, service, integrity, and your experience in our store. 
      <br/>
      <br/>
      <br/>
      <strong>
        The result of this philosophy is the satisfaction a customer feels when they have chosen that special gift from Underwood’s.
      </strong>
		</p>
  </div>
</template>
', '2017-12-07 10:05:11.066-05', '2017-12-07 10:05:11.066-05');
INSERT INTO content VALUES (4586, 49, 'items', 1655, 17, 'wysiwyg', '<template>
  <div class="flex flex-col items-center justify-center text-center text-white p-8 bg-grey-darkest">
    <h1 class="capitalize m-0">JOIN US</h1>
    <p class="m-1 tracking-wide">Sign up for our newsletter for latest news and updates!</p>
    <form class="m-4 w-full max-w-sm">
      <input class="p-4 w-2/3" placeholder="Email Address"></input>
    	<input type="submit" value="SUBSCRIBE" class="w-1/6 p-4"></input>
    </form>
  </div>
</template>
<script>
	module.exports = {
  	name: "formJoinUs"
  }
</script>
', '2017-12-07 15:31:08.416-05', '2017-12-07 15:31:08.416-05');
INSERT INTO content VALUES (4486, 11, 'templates', 1583, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :props="allProps.mainHeader"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: ''''
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 10:11:38.807-05', '2017-12-07 10:11:38.807-05');
INSERT INTO content VALUES (4487, 11, 'templates', 1584, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(data.props, JSON.parse(data.props))
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 10:15:41.147-05', '2017-12-07 10:15:41.147-05');
INSERT INTO content VALUES (4488, 36, 'items', 1585, 6, 'path', '/', '2017-12-07 10:18:12.07-05', '2017-12-07 10:18:12.07-05');
INSERT INTO content VALUES (4489, 36, 'items', 1585, 66, 'props', '{"Main Header": {backgroundImg: "/static/diamonds_bg.jpg"}}', '2017-12-07 10:18:12.07-05', '2017-12-07 10:18:12.07-05');
INSERT INTO content VALUES (4490, 36, 'items', 1585, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 10:18:12.07-05', '2017-12-07 10:18:12.07-05');
INSERT INTO content VALUES (4491, 39, 'items', 1586, 63, 'title', 'Main Header', '2017-12-07 10:19:46.67-05', '2017-12-07 10:19:46.67-05');
INSERT INTO content VALUES (4492, 39, 'items', 1586, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img :src="backgroundImage" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
    props: {
    	backgrounndImage: {
      	type: STRING,
        default ''/static/headerImg.jpg''
      }
    },
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-07 10:19:46.67-05', '2017-12-07 10:19:46.67-05');
INSERT INTO content VALUES (4493, 11, 'templates', 1587, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props, JSON.parse(data.props))
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 10:21:14.364-05', '2017-12-07 10:21:14.364-05');
INSERT INTO content VALUES (4494, 39, 'items', 1588, 63, 'title', 'Main Header', '2017-12-07 10:56:01.968-05', '2017-12-07 10:56:01.968-05');
INSERT INTO content VALUES (4495, 39, 'items', 1588, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img :src="backgroundImage" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
		props: {
    	backgroundImage: {
        type: String,
        required: true,
        default: ''/static
    	}
    },
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-07 10:56:01.968-05', '2017-12-07 10:56:01.968-05');
INSERT INTO content VALUES (4496, 39, 'items', 1589, 63, 'title', 'Main Header', '2017-12-07 10:57:00.072-05', '2017-12-07 10:57:00.072-05');
INSERT INTO content VALUES (4588, 37, 'items', 1656, 66, 'props', NULL, '2017-12-07 15:31:52.265-05', '2017-12-07 15:31:52.265-05');
INSERT INTO content VALUES (4589, 37, 'items', 1656, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2"></wysiwyg> 
    <wysiwyg title="About Us 4 Cards" class="bg-green-lightest"></wysiwyg>
    <wysiwyg title="Form Join Us" class=""></wysiwyg>
  <div>
</template>', '2017-12-07 15:31:52.265-05', '2017-12-07 15:31:52.265-05');
INSERT INTO content VALUES (4497, 39, 'items', 1589, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img :src="backgroundImage" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
		props: {
    	backgroundImage: {
        type: String,
        required: true,
        default: ''/static/header_img.jpg''
    	}
    },
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-07 10:57:00.072-05', '2017-12-07 10:57:00.072-05');
INSERT INTO content VALUES (4498, 39, 'items', 1590, 63, 'title', 'Main Header', '2017-12-07 10:57:21.759-05', '2017-12-07 10:57:21.759-05');
INSERT INTO content VALUES (4499, 39, 'items', 1590, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img :src="backgroundImage" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
		props: {
    	backgroundImage: {
        type: String,
        required: false,
        default: ''/static/header_img.jpg''
    	}
    },
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-07 10:57:21.759-05', '2017-12-07 10:57:21.759-05');
INSERT INTO content VALUES (4500, 39, 'items', 1591, 63, 'title', 'Main Header', '2017-12-07 10:58:16.758-05', '2017-12-07 10:58:16.758-05');
INSERT INTO content VALUES (4501, 39, 'items', 1591, 62, 'wyiswyg', '<template>
  <div class="w-full flex flex-col content-center m-0 p-0 overflow-hidden z-10 relative pt-16 pb-64">
    <img 
      class="w-64 self-center z-10 pb-4"
			src="http://www.underwoodjewelers.com/Portals/1/img-logo-header-underwoods.png">
    <page-menu class="flex text-black capitalize content-center w-full content-center justify-center z-10 flex-wrap" :items="menuItems"></page-menu>
    <img :src="backgroundImage" 
         class="w-full absolute pin-l pin-t z-0 min-h-full fit-center fit-cover"
         />
  </div> 
</template>
<script>
  module.exports = {
  	name: "mainHeader",
		props: {
    	backgroundImage: {
        type: String,
        required: false,
        default: ''/static/header_img.jpg''
    	}
    },
    data() {
    	return {
      	menuItems: [
          {title: "Engagement", path: "/"},
          {title: "Wedding/Anniversary", path: "/"},
          {title: "Fashion", path: "/"},
          {title: "Watches", path: "/"},
          {title: "Services", path: "/"},
          {title: "About", path: "/about-us"},
          {title: "Registry", path: "/"},
        ]
      }
    }
  }
</script>', '2017-12-07 10:58:16.758-05', '2017-12-07 10:58:16.758-05');
INSERT INTO content VALUES (4502, 11, 'templates', 1592, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props, JSON.parse(data.props))
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 10:58:39.77-05', '2017-12-07 10:58:39.77-05');
INSERT INTO content VALUES (4503, 11, 'templates', 1593, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:01:18.591-05', '2017-12-07 11:01:18.591-05');
INSERT INTO content VALUES (4504, 36, 'items', 1594, 6, 'path', '/', '2017-12-07 11:02:01.178-05', '2017-12-07 11:02:01.178-05');
INSERT INTO content VALUES (4505, 36, 'items', 1594, 66, 'props', '"{"Main Header": {"backgroundImg": "/static/diamonds_bg.jpg"}}"', '2017-12-07 11:02:01.178-05', '2017-12-07 11:02:01.178-05');
INSERT INTO content VALUES (4506, 36, 'items', 1594, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:02:01.178-05', '2017-12-07 11:02:01.178-05');
INSERT INTO content VALUES (4507, 36, 'items', 1595, 6, 'path', '/', '2017-12-07 11:02:42.975-05', '2017-12-07 11:02:42.975-05');
INSERT INTO content VALUES (4508, 36, 'items', 1595, 66, 'props', '''{"Main Header": {"backgroundImg": "/static/diamonds_bg.jpg"}}''', '2017-12-07 11:02:42.975-05', '2017-12-07 11:02:42.975-05');
INSERT INTO content VALUES (4509, 36, 'items', 1595, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:02:42.975-05', '2017-12-07 11:02:42.975-05');
INSERT INTO content VALUES (4590, 50, 'items', 1657, 20, 'keywords', NULL, '2017-12-07 15:44:08.066-05', '2017-12-07 15:44:08.066-05');
INSERT INTO content VALUES (4591, 50, 'items', 1657, 19, 'title', 'history Awards Experience', '2017-12-07 15:44:08.066-05', '2017-12-07 15:44:08.066-05');
INSERT INTO content VALUES (4510, 11, 'templates', 1596, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:03:59.739-05', '2017-12-07 11:03:59.739-05');
INSERT INTO content VALUES (4511, 11, 'templates', 1597, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:04:42.974-05', '2017-12-07 11:04:42.974-05');
INSERT INTO content VALUES (4512, 36, 'items', 1598, 6, 'path', '/', '2017-12-07 11:04:54.905-05', '2017-12-07 11:04:54.905-05');
INSERT INTO content VALUES (4513, 36, 'items', 1598, 66, 'props', '{"Main Header": {"backgroundImg": "/static/diamonds_bg.jpg"}}', '2017-12-07 11:04:54.905-05', '2017-12-07 11:04:54.905-05');
INSERT INTO content VALUES (4514, 36, 'items', 1598, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:04:54.905-05', '2017-12-07 11:04:54.905-05');
INSERT INTO content VALUES (4515, 36, 'items', 1599, 6, 'path', '/', '2017-12-07 11:04:56.134-05', '2017-12-07 11:04:56.134-05');
INSERT INTO content VALUES (4516, 36, 'items', 1599, 66, 'props', '{"Main Header": {"backgroundImg": "/static/diamonds_bg.jpg"}}', '2017-12-07 11:04:56.134-05', '2017-12-07 11:04:56.134-05');
INSERT INTO content VALUES (4517, 36, 'items', 1599, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:04:56.134-05', '2017-12-07 11:04:56.134-05');
INSERT INTO content VALUES (4518, 11, 'templates', 1600, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:05:46.523-05', '2017-12-07 11:05:46.523-05');
INSERT INTO content VALUES (4519, 11, 'templates', 1601, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:05:47.402-05', '2017-12-07 11:05:47.402-05');
INSERT INTO content VALUES (4520, 36, 'items', 1602, 6, 'path', '/', '2017-12-07 11:06:17.605-05', '2017-12-07 11:06:17.605-05');
INSERT INTO content VALUES (4521, 36, 'items', 1602, 66, 'props', '{"Main Header": {"backgroundImage": "/static/diamonds_bg.jpg"}}', '2017-12-07 11:06:17.605-05', '2017-12-07 11:06:17.605-05');
INSERT INTO content VALUES (4522, 36, 'items', 1602, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class="pt-32 pb-32 bg-blue text-red"></wysiwyg>  
  </div>
</template>', '2017-12-07 11:06:17.605-05', '2017-12-07 11:06:17.605-05');
INSERT INTO content VALUES (4523, 36, 'items', 1603, 6, 'path', '/', '2017-12-07 11:07:26.539-05', '2017-12-07 11:07:26.539-05');
INSERT INTO content VALUES (4524, 36, 'items', 1603, 66, 'props', '{"Main Header": {"backgroundImage": "/static/diamonds_bg.jpg"}}', '2017-12-07 11:07:26.539-05', '2017-12-07 11:07:26.539-05');
INSERT INTO content VALUES (4526, 36, 'items', 1604, 6, 'path', '/', '2017-12-07 11:07:27.658-05', '2017-12-07 11:07:27.658-05');
INSERT INTO content VALUES (4529, 11, 'templates', 1605, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-model="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:11:58.961-05', '2017-12-07 11:11:58.961-05');
INSERT INTO content VALUES (4530, 11, 'templates', 1606, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:14:37.317-05', '2017-12-07 11:14:37.317-05');
INSERT INTO content VALUES (4531, 11, 'templates', 1607, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" v-bind="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:14:38.322-05', '2017-12-07 11:14:38.322-05');
INSERT INTO content VALUES (4532, 11, 'templates', 1608, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" allProps="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:15:16.042-05', '2017-12-07 11:15:16.042-05');
INSERT INTO content VALUES (4533, 33, 'templates', 1609, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="allProps">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:15:42.075-05', '2017-12-07 11:15:42.075-05');
INSERT INTO content VALUES (4592, 50, 'items', 1657, 17, 'wysiwyg', '<template>
  <h1>H | A | E</h1>
</template>', '2017-12-07 15:44:08.066-05', '2017-12-07 15:44:08.066-05');
INSERT INTO content VALUES (4534, 11, 'templates', 1610, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :allProps="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:16:23.533-05', '2017-12-07 11:16:23.533-05');
INSERT INTO content VALUES (4535, 11, 'templates', 1611, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :allProps="allProps[''Main Header'']"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:17:33.236-05', '2017-12-07 11:17:33.236-05');
INSERT INTO content VALUES (4536, 33, 'templates', 1612, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="allProps">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 11:18:06.531-05', '2017-12-07 11:18:06.531-05');
INSERT INTO content VALUES (4537, 33, 'templates', 1613, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="allProps">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:46:37.138-05', '2017-12-07 12:46:37.138-05');
INSERT INTO content VALUES (4538, 33, 'templates', 1614, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:47:05.937-05', '2017-12-07 12:47:05.937-05');
INSERT INTO content VALUES (4539, 33, 'templates', 1615, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:47:26.188-05', '2017-12-07 12:47:26.188-05');
INSERT INTO content VALUES (4593, 50, 'items', 1658, 20, 'keywords', NULL, '2017-12-07 15:45:24.614-05', '2017-12-07 15:45:24.614-05');
INSERT INTO content VALUES (4594, 50, 'items', 1658, 19, 'title', 'history Awards Experience', '2017-12-07 15:45:24.614-05', '2017-12-07 15:45:24.614-05');
INSERT INTO content VALUES (4540, 11, 'templates', 1616, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :allProps="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:49:03.299-05', '2017-12-07 12:49:03.299-05');
INSERT INTO content VALUES (4541, 11, 'templates', 1617, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :allProps="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:52:46.456-05', '2017-12-07 12:52:46.456-05');
INSERT INTO content VALUES (4542, 11, 'templates', 1618, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all_props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:54:50.369-05', '2017-12-07 12:54:50.369-05');
INSERT INTO content VALUES (4543, 33, 'templates', 1619, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''all_props''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:54:58.149-05', '2017-12-07 12:54:58.149-05');
INSERT INTO content VALUES (4544, 11, 'templates', 1620, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:55:19.958-05', '2017-12-07 12:55:19.958-05');
INSERT INTO content VALUES (4595, 50, 'items', 1658, 17, 'wysiwyg', '<template>
  <div class="bg-green h-32 flex items-center justify-center text-white">H | A | E</div>
</template>', '2017-12-07 15:45:24.614-05', '2017-12-07 15:45:24.614-05');
INSERT INTO content VALUES (4545, 11, 'templates', 1621, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          const allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:57:48.778-05', '2017-12-07 12:57:48.778-05');
INSERT INTO content VALUES (4546, 33, 'templates', 1622, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" :v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 12:58:47.909-05', '2017-12-07 12:58:47.909-05');
INSERT INTO content VALUES (4547, 33, 'templates', 1623, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:00:48.471-05', '2017-12-07 13:00:48.471-05');
INSERT INTO content VALUES (4548, 11, 'templates', 1624, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.allProps[component] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          //this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:01:11.352-05', '2017-12-07 13:01:11.352-05');
INSERT INTO content VALUES (4549, 33, 'templates', 1625, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:01:56.105-05', '2017-12-07 13:01:56.105-05');
INSERT INTO content VALUES (4596, 37, 'items', 1659, 6, 'path', '/about-us', '2017-12-07 15:46:04.53-05', '2017-12-07 15:46:04.53-05');
INSERT INTO content VALUES (4597, 37, 'items', 1659, 66, 'props', NULL, '2017-12-07 15:46:04.53-05', '2017-12-07 15:46:04.53-05');
INSERT INTO content VALUES (4598, 37, 'items', 1659, 7, 'template', '<template>
  <div class="flex flex-col justify-around">
    <wysiwyg title="About Header" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 3" class="pt-32 pb-32"></wysiwyg>
    <wysiwyg title="About Section 2"></wysiwyg> 
    <wysiwyg title="About Us 4 Cards" class="bg-green-lightest"></wysiwyg>
    <wysiwyg title="History Rewards Experience" class=""></wysiwyg>
    <wysiwyg title="Form Join Us" class=""></wysiwyg>
  <div>
</template>', '2017-12-07 15:46:04.53-05', '2017-12-07 15:46:04.53-05');
INSERT INTO content VALUES (4550, 11, 'templates', 1626, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {
        	''Main Header'': {}
        }
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          //this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:09:18.21-05', '2017-12-07 13:09:18.21-05');
INSERT INTO content VALUES (4551, 11, 'templates', 1627, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: {}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps && this.allProps[component] ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          //this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:09:44.459-05', '2017-12-07 13:09:44.459-05');
INSERT INTO content VALUES (4552, 11, 'templates', 1628, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps && this.allProps[component] ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          //this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:10:31.141-05', '2017-12-07 13:10:31.141-05');
INSERT INTO content VALUES (4553, 11, 'templates', 1629, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps && this.allProps[component] ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:10:43.968-05', '2017-12-07 13:10:43.968-05');
INSERT INTO content VALUES (4599, 50, 'items', 1660, 20, 'keywords', NULL, '2017-12-07 15:46:21.396-05', '2017-12-07 15:46:21.396-05');
INSERT INTO content VALUES (4600, 50, 'items', 1660, 19, 'title', 'History Rewards Experience', '2017-12-07 15:46:21.396-05', '2017-12-07 15:46:21.396-05');
INSERT INTO content VALUES (4601, 50, 'items', 1660, 17, 'wysiwyg', '<template>
  <div class="bg-green h-32 flex items-center justify-center text-white">H | A | E</div>
</template>', '2017-12-07 15:46:21.396-05', '2017-12-07 15:46:21.396-05');
INSERT INTO content VALUES (4652, 35, 'templates', 1695, 61, 'vue', '<template>
  <nav v-for="item in items">
    <menu-item path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-15 19:09:38.764-05', '2017-12-15 19:09:38.764-05');
INSERT INTO content VALUES (4653, 36, 'templates', 1696, 61, 'vue', '<template>
  <nav >
    <menu-item v-for="item in items" path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-15 19:09:38.778-05', '2017-12-15 19:09:38.778-05');
INSERT INTO content VALUES (4554, 11, 'templates', 1630, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps && this.allProps[component] ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          const allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:10:53.398-05', '2017-12-07 13:10:53.398-05');
INSERT INTO content VALUES (4555, 11, 'templates', 1631, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          const allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:11:45.91-05', '2017-12-07 13:11:45.91-05');
INSERT INTO content VALUES (4556, 11, 'templates', 1632, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, this.allProps[component]);
      	return this.appProps ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          const allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:13:35.336-05', '2017-12-07 13:13:35.336-05');
INSERT INTO content VALUES (4557, 11, 'templates', 1633, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, component, this.allProps[component]);
      	return this.appProps ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          const allProps = JSON.parse(data.props)
          this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:14:32.268-05', '2017-12-07 13:14:32.268-05');
INSERT INTO content VALUES (4602, 50, 'items', 1661, 20, 'keywords', NULL, '2017-12-07 16:34:04.643-05', '2017-12-07 16:34:04.643-05');
INSERT INTO content VALUES (4603, 50, 'items', 1661, 19, 'title', 'History Rewards Experience', '2017-12-07 16:34:04.643-05', '2017-12-07 16:34:04.643-05');
INSERT INTO content VALUES (4604, 50, 'items', 1661, 17, 'wysiwyg', '<template>
    <div class="bg-green flex items-center justify-between text-white p-8 max-w-lg">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>

      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>

      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
</template>', '2017-12-07 16:34:04.643-05', '2017-12-07 16:34:04.643-05');
INSERT INTO content VALUES (4558, 11, 'templates', 1634, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, component, this.allProps[component]);
      	return this.appProps ? this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:14:59.336-05', '2017-12-07 13:14:59.336-05');
INSERT INTO content VALUES (4559, 11, 'templates', 1635, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, component, this.allProps[component]);
      	return this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:15:14.087-05', '2017-12-07 13:15:14.087-05');
INSERT INTO content VALUES (4560, 11, 'templates', 1636, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, component, this.allProps[component]);
      	return this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:15:15.587-05', '2017-12-07 13:15:15.587-05');
INSERT INTO content VALUES (4561, 11, 'templates', 1637, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(component) {
        console.log(`All Props in get props`, component, this.allProps[component]);
      	return this.allProps[component] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:15:53.1-05', '2017-12-07 13:15:53.1-05');
INSERT INTO content VALUES (4605, 50, 'items', 1662, 20, 'keywords', NULL, '2017-12-07 16:38:05.349-05', '2017-12-07 16:38:05.349-05');
INSERT INTO content VALUES (4606, 50, 'items', 1662, 19, 'title', 'History Rewards Experience', '2017-12-07 16:38:05.349-05', '2017-12-07 16:38:05.349-05');
INSERT INTO content VALUES (4607, 50, 'items', 1662, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center">
    <div class="bg-green flex items-center justify-between text-white p-8 max-w-lg">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>

      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>

      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:38:05.349-05', '2017-12-07 16:38:05.349-05');
INSERT INTO content VALUES (4562, 11, 'templates', 1638, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
        console.log(`All Props in get props`, componentTitle, this.allProps[componentTitle]);
      	return this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:16:01.058-05', '2017-12-07 13:16:01.058-05');
INSERT INTO content VALUES (4563, 11, 'templates', 1639, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
        console.log(`All Props in get props`, componentTitle, this.allProps[componentTitle]);
      	return this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:16:02.145-05', '2017-12-07 13:16:02.145-05');
INSERT INTO content VALUES (4564, 11, 'templates', 1640, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
        console.log(`All Props in get props`, componentTitle, this.allProps[componentTitle]);
      	return this.allProps[componentTitle] || {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:17:05.041-05', '2017-12-07 13:17:05.041-05');
INSERT INTO content VALUES (4565, 11, 'templates', 1641, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
        console.log(`All Props in get props`, componentTitle, this.allProps[componentTitle]);
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:18:05.598-05', '2017-12-07 13:18:05.598-05');
INSERT INTO content VALUES (4608, 50, 'items', 1663, 20, 'keywords', NULL, '2017-12-07 16:41:24.956-05', '2017-12-07 16:41:24.956-05');
INSERT INTO content VALUES (4609, 50, 'items', 1663, 19, 'title', 'History Rewards Experience', '2017-12-07 16:41:24.956-05', '2017-12-07 16:41:24.956-05');
INSERT INTO content VALUES (4654, 37, 'templates', 1697, 61, 'vue', '<template>
  <nav>
    <menu-item v-for="item in items" path="item.path" title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-15 19:09:38.796-05', '2017-12-15 19:09:38.796-05');
INSERT INTO content VALUES (4655, 38, 'templates', 1698, 61, 'vue', '<template>
  <nav>
    <menu-item v-for="item in items" :path="item.path" :title="item.title"></menu-item>
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-15 19:09:38.814-05', '2017-12-15 19:09:38.814-05');
INSERT INTO content VALUES (4656, 22, 'templates', 1699, 52, 'vue', '<template>
  <h1>This is not the template you are looking for!</h1>
</template>
<script>
  module.exports = {
    name: ''defaultWysiwyg''
  }</script>
<style> </style>', '2017-12-15 19:09:38.833-05', '2017-12-15 19:09:38.833-05');
INSERT INTO content VALUES (4566, 11, 'templates', 1642, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 13:18:26.989-05', '2017-12-07 13:18:26.989-05');
INSERT INTO content VALUES (4567, 24, 'templates', 1643, 55, 'vue', '<template>
  
  
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b relative">
    <wysiwyg-preview>  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template> 
<script>
  
  
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }

</script>
<style> </style>', '2017-12-07 14:23:32.516-05', '2017-12-07 14:23:32.516-05');
INSERT INTO content VALUES (4568, 46, 'items', 1644, 63, 'title', 'Page Footer', '2017-12-07 14:25:57.709-05', '2017-12-07 14:25:57.709-05');
INSERT INTO content VALUES (4569, 46, 'items', 1644, 62, 'wyiswyg', '<template>
  <div>
    This is the footer!
  </div>
</template>
<script>
  module.exports = {
  	name: ''Page Footer''
  }
</script>', '2017-12-07 14:25:57.709-05', '2017-12-07 14:25:57.709-05');
INSERT INTO content VALUES (4570, 11, 'templates', 1645, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
      <page-component title="Page Footer" :all-props="getProps(''Page Footer'')"></page-component>
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:27:23.108-05', '2017-12-07 14:27:23.108-05');
INSERT INTO content VALUES (4571, 11, 'templates', 1646, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
      <page-component title="Page Footer" :all-props="getProps(''Page Footer'')"></page-component>
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:41:02.694-05', '2017-12-07 14:41:02.694-05');
INSERT INTO content VALUES (4610, 50, 'items', 1663, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center flex justify-center">
    <div class="bg-green flex items-center justify-between text-white p-8 max-w-lg w-2/3">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>
			<hr class="h-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>
			<hr class="h-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:41:24.956-05', '2017-12-07 16:41:24.956-05');
INSERT INTO content VALUES (4572, 11, 'templates', 1647, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
      <page-component title="Page Footer" :all-props="getProps(''Page Footer'')"></page-component>
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:41:03.802-05', '2017-12-07 14:41:03.802-05');
INSERT INTO content VALUES (4573, 11, 'templates', 1648, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
      <page-component title="Page Footer" :all-props="getProps(''Page Footer'')"></page-component>
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return {
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:41:05.814-05', '2017-12-07 14:41:05.814-05');
INSERT INTO content VALUES (4574, 11, 'templates', 1649, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <component :is="componentName">
      <page-component title="Page Footer"></page-component>
    </component></div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return { 
        componentName: '''',
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:41:49.019-05', '2017-12-07 14:41:49.019-05');
INSERT INTO content VALUES (4575, 47, 'items', 1650, 63, 'title', 'Page Footer', '2017-12-07 14:42:31.097-05', '2017-12-07 14:42:31.097-05');
INSERT INTO content VALUES (4576, 47, 'items', 1650, 62, 'wyiswyg', '<template>
  <div>
    This is the footer!
  </div>
</template>
<script>
  module.exports = {
  	name: ''Page Footer''
  }
</script>', '2017-12-07 14:42:31.097-05', '2017-12-07 14:42:31.097-05');
INSERT INTO content VALUES (4577, 48, 'items', 1651, 63, 'title', 'Page Footer', '2017-12-07 14:42:31.906-05', '2017-12-07 14:42:31.906-05');
INSERT INTO content VALUES (4578, 48, 'items', 1651, 62, 'wyiswyg', '<template>
  <div>
    This is the footer!
  </div>
</template>
<script>
  module.exports = {
  	name: ''Page Footer''
  }
</script>', '2017-12-07 14:42:31.906-05', '2017-12-07 14:42:31.906-05');
INSERT INTO content VALUES (4579, 11, 'templates', 1652, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <div>
    	<component :is="componentName">
    	</component></div>
  	<page-component title="Page Footer"></page-component>
  </div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return { 
        componentName: '''', 
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apolloClient.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''])
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-07 14:43:09.274-05', '2017-12-07 14:43:09.274-05');
INSERT INTO content VALUES (4580, 48, 'items', 1653, 63, 'title', 'Page Footer', '2017-12-07 15:02:52.751-05', '2017-12-07 15:02:52.751-05');
INSERT INTO content VALUES (4582, 46, 'items', 1654, 63, 'title', 'Page Footer', '2017-12-07 15:07:06.202-05', '2017-12-07 15:07:06.202-05');
INSERT INTO content VALUES (4584, 49, 'items', 1655, 20, 'keywords', 'form', '2017-12-07 15:31:08.416-05', '2017-12-07 15:31:08.416-05');
INSERT INTO content VALUES (4585, 49, 'items', 1655, 19, 'title', 'Form Join Us', '2017-12-07 15:31:08.416-05', '2017-12-07 15:31:08.416-05');
INSERT INTO content VALUES (4587, 37, 'items', 1656, 6, 'path', '/about-us', '2017-12-07 15:31:52.265-05', '2017-12-07 15:31:52.265-05');
INSERT INTO content VALUES (4613, 50, 'items', 1664, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center flex justify-center">
    <div class="bg-green flex items-center justify-between text-white p-8 max-w-lg w-2/3">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>
			<hr class="h-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>
			<hr class="h-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:41:26.769-05', '2017-12-07 16:41:26.769-05');
INSERT INTO content VALUES (4614, 50, 'items', 1665, 20, 'keywords', NULL, '2017-12-07 16:44:22.95-05', '2017-12-07 16:44:22.95-05');
INSERT INTO content VALUES (4615, 50, 'items', 1665, 19, 'title', 'History Rewards Experience', '2017-12-07 16:44:22.95-05', '2017-12-07 16:44:22.95-05');
INSERT INTO content VALUES (4616, 50, 'items', 1665, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center flex justify-center">
    <div class="bg-green flex md:flex-no-wrap flex-wrap items-center justify-between text-white p-8 max-w-lg w-2/3">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:44:22.95-05', '2017-12-07 16:44:22.95-05');
INSERT INTO content VALUES (4617, 50, 'items', 1666, 20, 'keywords', NULL, '2017-12-07 16:44:39.589-05', '2017-12-07 16:44:39.589-05');
INSERT INTO content VALUES (4618, 50, 'items', 1666, 19, 'title', 'History Rewards Experience', '2017-12-07 16:44:39.589-05', '2017-12-07 16:44:39.589-05');
INSERT INTO content VALUES (4619, 50, 'items', 1666, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center flex justify-center">
    <div class="bg-green flex md:flex-no-wrap flex-wrap items-center justify-between text-white p-8 max-w-lg w-2/3">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p>
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:44:39.589-05', '2017-12-07 16:44:39.589-05');
INSERT INTO content VALUES (4620, 50, 'items', 1667, 20, 'keywords', NULL, '2017-12-07 16:45:14.71-05', '2017-12-07 16:45:14.71-05');
INSERT INTO content VALUES (4621, 50, 'items', 1667, 19, 'title', 'History Rewards Experience', '2017-12-07 16:45:14.71-05', '2017-12-07 16:45:14.71-05');
INSERT INTO content VALUES (4622, 50, 'items', 1667, 17, 'wysiwyg', '<template>
  	<div class="w-full bg-green text-center flex justify-center">
    <div class="bg-green flex md:flex-no-wrap flex-wrap items-center justify-between text-white p-8 max-w-lg w-2/3">
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR HISTORY</h2>
        <img src="/static/history.png" />
        <p class="text-center">See our history >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">AWARDS</h2>
        <img src="/static/awards.png" />
        <p class="text-center">See our awards >></p>
      </div>
			<hr class="md:h-32 md:w-0 w-32"/>
      <div class="flex flex-col justify-center items-center text-white p-2">
        <h2 class="text-center m-0 mb-1">OUR EXPERIENCE</h2>
        <img src="/static/experience.png" />
        <p class="text-center">VIEW OUR EXPERIEN CE >></p> 
      </div>
    </div>
  </div>
</template>', '2017-12-07 16:45:14.71-05', '2017-12-07 16:45:14.71-05');
INSERT INTO content VALUES (4623, 36, 'items', 1668, 6, 'path', '/', '2017-12-08 15:45:21.597-05', '2017-12-08 15:45:21.597-05');
INSERT INTO content VALUES (4624, 36, 'items', 1668, 66, 'props', '{"Main Header": {"backgroundImage": "/static/diamonds_bg.jpg"}}', '2017-12-08 15:45:21.597-05', '2017-12-08 15:45:21.597-05');
INSERT INTO content VALUES (4625, 36, 'items', 1668, 7, 'template', '<template>
  <div class="flex flex-col">
    <wysiwyg title="About Header" class=""></wysiwyg>  
    <wysiwyg title="About Us 4 Cards" class=""></wysiwyg>  
  </div>
</template>', '2017-12-08 15:45:21.597-05', '2017-12-08 15:45:21.597-05');
INSERT INTO content VALUES (4626, 1, 'templates', 1669, 58, 'vue', '<template>
  <div class="w-full">
		<h1>
      Welcom to The Admin Section
    </h1>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
', '2017-12-11 16:38:55.123-05', '2017-12-11 16:38:55.123-05');
INSERT INTO content VALUES (4627, 10, 'templates', 1670, 54, 'vue', '<template>
 <h1></h1>
</template>
<script>
 module.exports={"name": ''homePage''}
</script>
<style>
</style>', '2017-12-13 14:26:58.222-05', '2017-12-13 14:26:58.222-05');
INSERT INTO content VALUES (4628, 29, 'templates', 1671, 55, 'vue', '<template>
  <h1>Hello World</h1></template>
<script>
  module.exports = {
    name: ''adminAlert''
  }</script>
<style> </style>', '2017-12-15 19:09:36.043-05', '2017-12-15 19:09:36.043-05');
INSERT INTO content VALUES (4629, 14, 'templates', 1672, 55, 'vue', '<template>
  <div class="bg-blue hover:bg-green-dark text-white font-bold py-2 px-4 rounded no-underline">
      <router-link :to="path" class="no-underline text-center">{{title}}</router-link>
    </div>
</template>
<script>
  module.exports = {
    name: ''adminButton'',
    props: [''title'', ''path'']
  }
</script>
<style> </style>', '2017-12-15 19:09:36.57-05', '2017-12-15 19:09:36.57-05');
INSERT INTO content VALUES (4630, 12, 'templates', 1673, 55, 'vue', '<template>
  <div class="max-w-sm rounded overflow-hidden shadow-lg p-4">
    <slot></slot>
  </div>
</template>
<script>
  module.exports = {
    name: ''card''
  }
</script>
<style> .template-12 .template-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 mplate-12 n</style>', '2017-12-15 19:09:36.685-05', '2017-12-15 19:09:36.685-05');
INSERT INTO content VALUES (4631, 26, 'templates', 1674, 55, 'vue', '<template>
  <select v-model="value" :change="changed">
    <option v-for="template in templates">
      {{template.name}}
    </option>
  </select>  
</template>
<script>
  module.exports = {
    name: ''adminInputPageSelect'',
    props: [ ''placeholder'', ''name'', ''form''],
    data() {
      return {
        value: ''''
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    },
    asyncComputed: {
      templates: async function () {
        const query = await this.$apollo.query({
          query: this.$gql`
          {
            allTemplates(condition:{
              resourceId: 1
            }){
                nodes{
                  name
                }
              }
            }`
        })
        console.log(''query'', query)
        return query.data.allTemplates.nodes
      }
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:37.52-05', '2017-12-15 19:09:37.52-05');
INSERT INTO content VALUES (4632, 16, 'templates', 1675, 55, 'vue', '<template>
  <div class="w-3/4">
      <label class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2" for="grid-first-name">
        {{label}}
      </label>
      <component :is="componentName(type)" v-bind="inputProps" class="">
      <p class="text-red text-xs italic">Please fill out this field.</p>
    </component>
  </div>
</template>
<script>
  module.exports = {
    name: ''adminInputField'',
    props: [
      ''type'', ''name'', ''placeholder'', ''label'', ''value''
    ],
    methods: {
      componentName(type){
        return `adminInput${type.charAt(0).toUpperCase() + type.slice(1)}`
      },
    },
    computed: {
      inputProps() {
        console.log(this.value)
        return {
          name: this.name,
          initValue: this.value,
          value: this.value,
          placeholder: this.placeholder,
          form: this.$parent 
        }
      }
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:37.581-05', '2017-12-15 19:09:37.581-05');
INSERT INTO content VALUES (4633, 18, 'templates', 1676, 55, 'vue', '<template>
  <input type="submit" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3"> 
</template>
<script>
  module.exports = {
    name: ''adminInputSubmit'',
    props: [''value'', ''placeholder'', ''name'', ''form'']
  }
</script>
<style> </style>', '2017-12-15 19:09:38.319-05', '2017-12-15 19:09:38.319-05');
INSERT INTO content VALUES (4634, 25, 'templates', 1677, 55, 'vue', '<template>
  <select v-model="value" :value="initValue" :change="changed">
    <option v-for="template in templates">
      {{template.name}}
    </option>
  </select>  
</template>
<script>
module.exports = {
    name: ''adminInputTemplateSelect'',
    props: [ ''placeholder'', ''name'', ''form'', ''initValue''],
    data() {
      return {
        value: ''''
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    },
    asyncComputed: {
      templates: async function () {
        const query = await this.$apollo.query({
          query: this.$gql`
          {
              allTemplates{
                nodes{
                  name
                }
              }
            }`
        })
        console.log(''query'', query)
        return query.data.allTemplates.nodes
      }
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.441-05', '2017-12-15 19:09:38.441-05');
INSERT INTO content VALUES (4635, 17, 'templates', 1678, 55, 'vue', '<template>
  <input type="text" v-model="value" :name="name" :placeholder="placeholder" @change="changed" class="template-17 appearance-none block w-full bg-grey-lighter text-grey-darker border border-red rounded py-3 px-4 mb-3"> 
</template>
<script>
  module.exports = {
    name: ''adminInputText'',
    props: [ ''placeholder'', ''name'', ''form'', ''initValue''],
    data() {
      return {
        value: this.initValue
      }
    },
    methods: {
      changed() {
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
      }
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.464-05', '2017-12-15 19:09:38.464-05');
INSERT INTO content VALUES (4636, 24, 'templates', 1679, 55, 'vue', '<template>
  
  
  <div class="flex-grow flex flex-col">
    <div>
      <codemirror v-model="value" :name="name" :options="editorOption" class="flex-grow w-5"></codemirror>
    </div>
    <div class="border-4 border-black border-solid p-2 rounded-b relative">
    <wysiwyg-preview>  
    </wysiwyg-preview>
    </div>
    <p class="text-xs">Last Updated: {{lastUpdated}}</p>
  </div>
</template> 
<script>
  
  
  module.exports = {
    name: "adminInputVueWysiwyg",
    props: [''form'', ''name'', ''placeholder'', ''initValue''],
    data() { return {
        value: this.initValue,
        lastUpdated: new Date(),
        editorOption: {
          code: this.initValue,
          tabSize: 2,
          styleActiveLine: true,
          lineNumbers: true,
          line: true,
          foldGutter: true,
          styleSelectedText: true,
          mode: ''text/html'',
          // keyMap: "sublime",
          matchBrackets: true,
          showCursorWhenSelecting: true,
          theme: "monokai",
          hintOptions:{
            completeSingle: false 
          }
        }
      }
    },
    methods: {
      updatePreview(string) {
        Vue.component(''wysiwyg-preview'', Vue.prototype.$stringToTemplate(string))
        this.form.$emit(''inputEvent'', {name: this.name, value: this.value})
        this.lastUpdated = new Date();
      }
    },
    mounted() {
      this.$watch(''value'', this.updatePreview)
    }
  }

</script>
<style> </style>', '2017-12-15 19:09:38.482-05', '2017-12-15 19:09:38.482-05');
INSERT INTO content VALUES (4637, 3, 'templates', 1680, 55, 'vue', '<template>
  <nav :class="classList">
    <p class="p-4">Smart Site Admin</p>
    	<h1>Settings</h1>
    		<ul class="list-reset">
          <admin-menu-item title="Create Resource" path="/admin/create/resource"></admin-menu-item>
    		</ul>
    	<h1>Resources</h1>
      <ul v-for="item in resources" class="list-reset">
       <admin-menu-item :path="path(item)" :title="item"></admin-menu-item>
     </ul>
  </nav>
</template>
<script>
  module.exports = {
    name: "admin-menu",
    data() {
      return {
        resources: [],
        classList: [
          ''flex'',
          ''flex-col'',
          ''items-center'',
          ''justify-start'',
          ''h-screen'',
          ''bg-grey-darkest''
        ]
      }
    },
    methods: {
      path(resource_name) { return `/admin/resource/${resource_name}`}
    },
    beforeMount () {
      this.$apollo.query({
        query: this.$gql`
          {
            allResources{
              nodes {
                name
              }
            }
          }
        `
      })
      .then(r => {
        resources = r.data.allResources.nodes.map(resource => this.$camelCase(resource.name))
        console.log(''resources'', resources)
        this.resources = resources
      })
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.497-05', '2017-12-15 19:09:38.497-05');
INSERT INTO content VALUES (4638, 6, 'templates', 1681, 55, 'vue', '<template>
  <router-link :to="path" class="p-4 hover:text-red text-center block ">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''adminMenuItem'',
    props: [''title'', ''path''],
    methods: {
  		decamel: function (text) {
  			return this.decamelize(text, '' '');
  		}
  	}
  }
</script>
<style> </style>', '2017-12-15 19:09:38.509-05', '2017-12-15 19:09:38.509-05');
INSERT INTO content VALUES (4639, 20, 'templates', 1682, 55, 'vue', '<template>
  <h1>Hello World</h1>
</template>
<script>  
  module.exports = {
    name: ''wysiwyg-preview''
  }
</script>
<style> </style>', '2017-12-15 19:09:38.524-05', '2017-12-15 19:09:38.524-05');
INSERT INTO content VALUES (4640, 15, 'templates', 1683, 58, 'vue', '<template>
  <div>
      <h1>Create New {{$route.params.resource_name}}</h1>
      <form v-on:submit.prevent="submitForm">
        <div v-for="field in fields"> 
          <admin-input-field :type="field.inputTemplate || &apos;text&apos;" :name="field.name" :placholder="field.name" :label="field.name" :value="inputValues[field.name]">
          </admin-input-field>
        </div>
        <admin-input-field type="submit" name="submit" label="Save your data!"></admin-input-field>
      </form>   
  </div>
</template>
<script>
  module.exports = {
    name: ''adminCreateResource'',
    data() {
      return {
        inputValues: {}
      }
    },
    methods: {
      submitForm() {
          console.log(''submiting Form'', this.inputValues)
          const resource_name = this.$route.params.resource_name;
          const field_set = this.$route.params.field_set;
          const name = this.$camelCase(`create_${resource_name}_${field_set}`)
          const mutate = `
              mutation {
                ${name}(input:{${Object.keys(this.inputValues).map(key => key+'':''+''"''+this.$graphqlString(this.inputValues[key])+''"'')}}) {
                  clientMutationId
                } 
              }
            `
          console.log(mutate)
          this.$apollo.mutate({
            mutation: this.$gql`${mutate}`
        }).then()
        .catch(console.error)
      }
    },
    mounted() {
      this.$on(''inputEvent'', (data) => {
        this.inputValues[data.name] = data.value
      })
    },
    asyncComputed: {
      resourceId: async function() {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const resource = await this.$apollo.query({
          query: this.$gql`
          {
            resourceByName(name: "${resource_name}"){
              name
              id
            }
          }`
        })
        return resource.data.resourceByName.id
      },
      fields: async function () {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const field_set = this.$decamelize(this.$route.params.field_set)
        if (!this.resourceId) return []
        const fields = await this.$apollo.query({
          query: this.$gql`{
            fieldSetAsArray(fieldSetTable: "${field_set}", resourceIdValue: ${this.resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            } 
          }`
        })
        console.log(''fields'', fields.data.fieldSetAsArray.nodes)
        return [{name: "name", type: "text"}, ...fields.data.fieldSetAsArray.nodes]
      },
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.547-05', '2017-12-15 19:09:38.547-05');
INSERT INTO content VALUES (4641, 31, 'templates', 1684, 58, 'vue', '<template>
  <h1>HELlO WoLRD?</h1>
</template>
<script>
  module.exports = {
  	name = "adminACreateResource"
  }
</script>', '2017-12-15 19:09:38.564-05', '2017-12-15 19:09:38.564-05');
INSERT INTO content VALUES (4642, 27, 'templates', 1685, 58, 'vue', '<template>
 <div>
      <h1>Edit {{$route.params.resource_name}}</h1>
      <form v-on:submit.prevent="submitForm">
        <div v-for="field in fields">
          <admin-input-field :type="field.inputTemplate || &apos;text&apos;" :name="field.name" :placholder="field.name" :label="field.name" :value="values[field.name]">
          </admin-input-field>
        </div>
        <admin-input-field type="submit" name="submit" label="Save your data!"></admin-input-field>
      </form>   
  </div>
</template>
<script>
  module.exports = {
    name: ''adminCreateResource'',
    data() {
      return {
        inputValues: {}
      }
    }, 
    methods: {
      submitForm() {
          console.log(''submiting Form'', this.inputValues)
          const resource_name = this.$route.params.resource_name
          const field_set = this.$route.params.field_set
          const name = this.$camelCase(`update_${resource_name}_${field_set}`)
          delete this.inputValues.name
          const mutate = `
              mutation {
                ${name}(input:{id: ${this.$route.params.item_id}, ${Object.keys(this.inputValues).map(key => key+'':''+''"''+this.$graphqlString(this.inputValues[key])+''"'')}}) {
                  clientMutationId
                } 
              }
            `
          console.log(mutate)
          this.$apollo.mutate({
            mutation: this.$gql`${mutate}`
        }).then()
        .catch(console.error)
      }
    },
    mounted() {
      this.$on(''inputEvent'', (data) => {
        this.inputValues[data.name] = data.value
      })
    },
    asyncComputed: {
      resourceId: async function() {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const resource = await this.$apollo.query({
          query: this.$gql`
          {
            resourceByName(name: "${resource_name}"){
              name
              id
            }
          }`
        })
        return resource.data.resourceByName.id
      },
      fields: async function () {
        console.log(this.$route)
        const resource_name = this.$decamelize(this.$route.params.resource_name)
        const field_set = this.$decamelize(this.$route.params.field_set)
        if (!this.resourceId) return []
        const fields = await this.$apollo.query({
          query: this.$gql`{
            fieldSetAsArray(fieldSetTable: "${field_set}", resourceIdValue: ${this.resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            } 
          }`
        })
        console.log(''fields'', fields.data.fieldSetAsArray.nodes)
        return [{name: "name", type: "text"}, ...fields.data.fieldSetAsArray.nodes]
      },
      values: async function() {
        if (this.fields && this.fields.length > 0 &&  this.resourceId) {
          console.log(this.fields)
          const resource_name = this.$route.params.resource_name
          const field_set = this.$route.params.field_set
          const name = this.$camelCase(`${resource_name}_${field_set}`)
          const query = `
                {
                  ${name}ById(searchvalue: ${this.$route.params.item_id}) {
                    nodes {
                      ${this.fields.map(v => v.name).join('' '')}
                    }
                  }
                }
              `
          console.log(query)
          const values = await this.$apollo.query({
            query: this.$gql`${query}`
          })
          const valuesByField = {};
          console.log(values.data[name+''ById''].nodes[0])
          return values.data[name+''ById''].nodes[0]
        }
      }
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.582-05', '2017-12-15 19:09:38.582-05');
INSERT INTO content VALUES (4643, 1, 'templates', 1686, 58, 'vue', '<template>
  <div class="w-full">
		<h1>
      Welcom to The Admin Section
    </h1>
  </div>
</template>
<script>
  module.exports = {
    name: "adminHome"
  }
</script>
', '2017-12-15 19:09:38.596-05', '2017-12-15 19:09:38.596-05');
INSERT INTO content VALUES (4644, 13, 'templates', 1687, 58, 'vue', '<template>
<div>
    <h1>{{$route.params.resource_name}}</h1>
    <div v-for="(data, field_set) in resource" v-if="field_set !== ''__typename''"> 
      <h3>{{field_set}}</h3>
      <ul v-for="item in data.nodes">
        <router-link :to="editLink(item, field_set)">
          <li class="text-black">{{item.id}} - {{item.name}} </li>
        </router-link>
      </ul>
      <admin-button :path="''/admin/create/resource/''+$route.params.resource_name+''/''+field_set" :title="&apos;New &apos;+$route.params.resource_name + '' '' + field_set">
      </admin-button>
    </div>
  </div>
</template>
<script>
  module.exports = {
    name: ''adminResourceList'',
    methods: {
      editLink(item, field_set) {
        return ''/admin/edit/resource/''+this.$route.params.resource_name+''/''+field_set+''/''+item.id
      }
    },
    data () {
      return {
      } 
    }, 
    asyncComputed: {
      resource() {
        return this.$apollo.query({
          query: this.$gql`{
              ${this.$route.params.resource_name} {
                nodes{
                  items{
                    nodes {
                      name
                      id
                    }
                  }
                  templates{
                    nodes{
                      name
                      id
                    }
                  }
                }
              }
            }
          `
        }).then(r => {
          console.log(r.data[this.$route.params.resource_name].nodes[0])
          return r.data[this.$route.params.resource_name].nodes[0]
        })
       }
    },
  }
</script>
<style> </style>', '2017-12-15 19:09:38.616-05', '2017-12-15 19:09:38.616-05');
INSERT INTO content VALUES (4645, 2, 'templates', 1688, 58, 'vue', '<template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style><template>
<div class="flex w-screen">
      <admin-menu class="flex items-center bg-grey-darkest text-white"></admin-menu>
      <div class="p-4 flex-grow">
        <router-view></router-view>
      </div>
    </div>
</template>
<script>
  module.exports = {
    name: "defaultAdminPage",
    created(){
      console.log(this.$route)
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.64-05', '2017-12-15 19:09:38.64-05');
INSERT INTO content VALUES (4646, 30, 'templates', 1689, 59, 'vue', '<template>
 <div>
 <h1>First Template
 </div>
</template>', '2017-12-15 19:09:38.657-05', '2017-12-15 19:09:38.657-05');
INSERT INTO content VALUES (4647, 11, 'templates', 1690, 54, 'vue', '<template>
  <div class="w-screen font-sans">
    	<page-component title="Main Header" :all-props="getProps(''Main Header'')"></page-component>
      <div>
    	<component :is="componentName">
    	</component></div>
  	<page-component title="Page Footer"></page-component>
  </div>
</template>
<script>
  module.exports={
    "name": ''defaultPage'',
    data() {
      return { 
        componentName: '''', 
        allProps: { ''Main Header'': {}}
      }
    },
    methods: {
    	getProps(componentTitle) {
      	return this.allProps && this.allProps[componentTitle] ? this.allProps[componentTitle] : {}
      }
    },
    created(){
      console.log(''apollo!!!!!'',this.$apollo);
      const path = this.$route.matched[0].path || ''/'';
      console.log(path)
      this.$apollo.query({
        query: this.$gql`
          {
            pageItemsByPath(searchvalue: "${path}"){
              nodes{
                name
                template
								props
              }
            }
          }
        `
      }).then(r => {
        if (r && r.data && r.data.pageItemsByPath && r.data.pageItemsByPath.nodes && r.data.pageItemsByPath.nodes[0]) {
          const title = r.data.pageItemsByPath.nodes[0].name.replace('' '', '''');
          const data = r.data.pageItemsByPath.nodes[0];
          window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageItemsByPath.nodes[0].template))
          console.log(`PROPS FRO ${data.name}`, data.props)
          this.allProps = JSON.parse(data.props)
          // this.$set(this.allProps, ''Main Header'', allProps[''Main Header''] )
          this.componentName = title;
          this.loaded = true;
        }
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.676-05', '2017-12-15 19:09:38.676-05');
INSERT INTO content VALUES (4648, 10, 'templates', 1691, 54, 'vue', '<template>
 <h1></h1>
</template>
<script>
 module.exports={"name": ''homePage''}
</script>
<style>
</style>', '2017-12-15 19:09:38.693-05', '2017-12-15 19:09:38.693-05');
INSERT INTO content VALUES (4649, 32, 'templates', 1692, 61, 'vue', '<template>
  <router-link :to="path" class="p-4 text-center block uppercase tracking-wide">{{title}}</router-link>
</template>
<script>
  module.exports = {
    name: ''menuItem'',
    props: [''title'', ''path'']
  }
</script>
<style>
</style>', '2017-12-15 19:09:38.71-05', '2017-12-15 19:09:38.71-05');
INSERT INTO content VALUES (4650, 33, 'templates', 1693, 61, 'vue', '<template>
  <component :is="componentName" v-if="loaded" v-bind="propsForComponent">
</component></template>
<script>
  module.exports = {
    name: ''pageComponent'',
    props: [''title'', ''allProps''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    computed: {
      propsForComponent(){
        console.log(''props for component'', this.allProps);
      	return this.allProps
      }
    },
    created(){
      this.$apollo.query({
        query: this.$gql`
          {
            pageComponentsItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wyiswyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.pageComponentsItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.pageComponentsItemsByTitle.nodes[0].wyiswyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.727-05', '2017-12-15 19:09:38.727-05');
INSERT INTO content VALUES (4651, 34, 'templates', 1694, 61, 'vue', '<template>
  <nav v-for="">
  </nav>
</template>
<script>
  module.exports = {
  	name: ''pageMenu'',
    props: [''items'']
  }
</script>', '2017-12-15 19:09:38.744-05', '2017-12-15 19:09:38.744-05');
INSERT INTO content VALUES (4657, 39, 'templates', 1700, 52, 'vue', '<template>
	<div class="relative overflow-hidden">
    <div class="relative z-10">
      <slot>
      </slot>
    </div>
    <img :src="img" :class="allImageClasses" />
  </div>
</template>
<script>
  module.exports = {
  	name: ''imageText'',
    props: [''img'', ''stack'', ''mobile-img'', ''imageClasses''],
    computed: {
      allImageClasses() {
      	const classArray = this.imageClasses ? this.imageClasses.split('' '') : [];
        classArray.push(''w-full'', ''absolute'', ''pin-l'', ''pin-t'', ''z-0'', ''min-h-full'')
        if (this.stack === true) {
        	classArray.push(''sm:w-full'', ''sm:relative'')
        }
        return classArray.join('' '')
      }
  	}
  }
</script>
', '2017-12-15 19:09:38.846-05', '2017-12-15 19:09:38.846-05');
INSERT INTO content VALUES (4658, 23, 'templates', 1701, 52, 'vue', '<template>
  <component :is="componentName" v-if="loaded">
</component></template>
<script>
  module.exports = {
    name: ''wysiwyg'',
    props: [''title''],
    data() {
      return {
        loaded: false,
        componentName: "defaultWysiwyg" 
      }
    },
    created(){
      this.$apollo.query({
        query: this.$gql`
          {
            wysiwygItemsByTitle(searchvalue: "${this.title}"){
              nodes{
                title
                wysiwyg
              }
            }
          }
        `
      }).then(r => {
        console.log(''query result in wysiwyg'', r)
        const title = r.data.wysiwygItemsByTitle.nodes[0].title.replace(/ /g, '''');
        window.Vue.component(title, Vue.prototype.$stringToTemplate(r.data.wysiwygItemsByTitle.nodes[0].wysiwyg))
        this.componentName = title;
        this.loaded = true;
      }).catch(console.error)
    }
  }
</script>
<style> </style>', '2017-12-15 19:09:38.864-05', '2017-12-15 19:09:38.864-05');
INSERT INTO content VALUES (4659, 46, 'templates', 1702, 52, 'vue', '<template>
  <div>
    <img src />
    <div :class="title_classes_constructed">
      <slot named="title">
      </slot>
    </div>
    <div :class="content_classes_constructed">
      <slot named="content">
      </slot>
    </div>
  <div>
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
    	title_classes: {
      	type: Array,
        default: undefined
      },
      content_classes: {
        type: Array,
      }
    }
  }
</script>', '2017-12-15 19:09:38.88-05', '2017-12-15 19:09:38.88-05');
INSERT INTO content VALUES (4660, 47, 'templates', 1703, 52, 'vue', '<template>
  <div :class="card_classes">
    <img :src="img_src" class="w-full"/>
    <div :class="title_classes">
      <slot name="header">
      </slot>
    </div>
    <div :class="content_classes">
      <slot name="content">
      </slot>
    </div>
  <div> 
</template>
<script>
  module.exports = {
  	name: "wysiwygImageCard",
    props: {
      img_src: {
      	type: String,
        default: ''/static/3_rings.jpg''
      },
    	title_classes: {
      	type: Array,
        default: () => [''p-4 pb-0'', ''uppercase'', ''text-center'']
      },
      card_classes: {
        type: Array,
        default: () => ["bg-white", 
                        "lg:w-1/4 md:w-5/6 sm:w-full", 
                        "flex flex-col items-center"]
      },
      content_classes: {
        type: Array,
        default: () => [
					"p-4"
        ]
      }
    },
  }
</script>', '2017-12-15 19:09:38.899-05', '2017-12-15 19:09:38.899-05');


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: smartsiterole
--

SELECT pg_catalog.setval('content_id_seq', 4660, true);


--
-- PostgreSQL database dump complete
--

