<template>
  <v-card>
    <v-card-title>
      <span class="headline">太郎さんの進捗</span>
    </v-card-title>
    <v-card-text>
      <v-data-table
        :headers="headers"
        :items="desserts"
        class="elevation-1"
      >
        <template slot="headerCell" slot-scope="props">
          <v-tooltip bottom>
            <span slot="activator">
              {{ props.header.text }}
            </span>
          </v-tooltip>
        </template>
        <template slot="items" slot-scope="props">
          <td><router-link to="/admin/article/1">{{ props.item.id }}</router-link></td>
          <td class="text-xs-right">{{ props.item.name }}</td>
          <td class="text-xs-right">{{ props.item.status }}</td>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>


<script>
  export default {
    layout: 'admin',
    data () {
      return {
        headers: [
          { text: 'id', value: 'id' },
          { text: 'ネタ名', value: 'name' },
          { text: 'ステータス', value: 'status' },
        ],
        desserts: [
          {
            id: 1,
            name: 'DIY',
            status: '公開',
          },
          {
            id: 2,
            name: 'インテリア',
            status: '校正',
          },
          {
            id: 3,
            name: '収納',
            status: '初稿',
          }
        ]
      }
    }
  }
</script>
