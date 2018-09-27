<template>
  <v-card>
    <v-card-title>
      <span class="headline">ネタ一覧</span>
    </v-card-title>
    <v-card-text>
      <v-toolbar flat color="white">
        <v-text-field
          v-model="search"
          append-icon="search"
          label="Search"
          single-line
          hide-details
        ></v-text-field>

        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">
          <v-btn slot="activator" color="primary" dark class="mb-2">New Item</v-btn>
          <v-card>
            <v-card-title>
              <span class="headline">{{ formTitle }}</span>
            </v-card-title>
            <v-card-text>
              <v-container grid-list-md>
                <v-layout wrap>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.title" label="ネタ"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.idea" label="ネタ元"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.category" label="カテゴリ"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.sub_category" label="サブカテゴリ"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.article_type" label="記事型"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.rank" label="種別"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.description" label="説明"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field v-model="editedItem.comment" label="コメント"></v-text-field>
                  </v-flex>
                </v-layout>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" flat @click.native="close">Cancel</v-btn>
              <v-btn color="blue darken-1" flat @click.native="save">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
      <v-data-table
        :headers="headers"
        :items="topics"
        hide-actions
        class="elevation-1"
        :search="search"
      >
        <template slot="items" slot-scope="props">
          <td>{{ props.item.created_at }}</td>
          <td class="text-xs-right">{{ props.item.title }}</td>
          <td class="text-xs-right">{{ props.item.idea }}</td>
          <td class="text-xs-right">{{ props.item.category }}</td>
          <td class="text-xs-right">{{ props.item.sub_category }}</td>
          <td class="text-xs-right">{{ props.item.article_type }}</td>
          <td class="text-xs-right">{{ props.item.rank }}</td>
          <td class="text-xs-right">{{ props.item.description }}</td>
          <td class="text-xs-right">{{ props.item.comment }}</td>
          <td class="text-xs-right"><a :href="'/admin/article/' + props.item.article_id">{{ props.item.article_id }}</a></td>
          <td class="text-xs-right">
            <v-edit-dialog
              large
              lazy
              persistent
              @save="saveWorkerId(props.item)"
            >
              <div>{{ props.item.worker_id }}</div>
              <div slot="input" class="mt-3 title">ワーカーを設定する</div>
              <v-text-field
                slot="input"
                label="Edit"
                single-line
                counter
                autofocus
              ></v-text-field>
            </v-edit-dialog>
          </td>
          <td class="text-xs-right">{{ props.item.workers }}</td>
          <td class="justify-center layout px-0">
            <v-icon
              small
              class="mr-2"
              @click="editItem(props.item)"
            >
              edit
            </v-icon>
          </td>
        </template>
      </v-data-table>
    </v-card-text>
  </v-card>
</template>

<script>
  export default {
    layout: 'admin',
    computed: {
      topics () { return this.$store.state.topics.list },
      formTitle () {
        return this.editedIndex === -1 ? '新規作成' : '編集'
      }
    },
    data: () => ({
      editWorkerId: '',
      search: '',
      dialog: false,
      headers: [
        { text: '作成日時', value: 'created_at' },
        { text: 'ネタ', value: 'title' },
        { text: 'ネタ元', value: 'idea' },
        { text: 'カテゴリ', value: 'category' },
        { text: 'サブカテゴリ', value: 'sub_category' },
        { text: '記事型', value: 'article_type' },
        { text: '種別', value: 'rank' },
        { text: '説明', value: 'description' },
        { text: 'コメント', value: 'comment' },
        { text: '紐づく記事ID', value: 'article_id' },
        { text: '紐づくワーカーID', value: 'worker_id' },
        { text: '希望するワーカーID', value: 'workers' }
      ],
      desserts: [],
      editedIndex: -1,
      editedItem: {
        title: '',
        idea: '',
        category: '',
        sub_category: '',
        article_type: '',
        rank: '',
        description: '',
        comment: '',
      },
      defaultItem: {
        title: '',
        idea: '',
        category: '',
        sub_category: '',
        article_type: '',
        rank: '',
        description: '',
        comment: '',
      }
    }),

    watch: {
      dialog (val) {
        val || this.close()
      }
    },

    async fetch ({ store }) {
      await store.dispatch('topics/fetch');
    },

    methods: {
      editItem (item) {
        this.editedIndex = this.topics.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      close () {
        this.dialog = false
        setTimeout(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        }, 300)
      },

      async save () {
        if (this.editedIndex > -1) {
          await this.$store.dispatch('topics/update', {params: this.editedItem, index: this.editedIndex});
        } else {
          await this.$store.dispatch('topics/store', {params: this.editedItem});
        }
        this.close()
      },

      saveWorkerId (item) {
        this.$store.commit('topics/updateWorker', this.topics.indexOf(item))
      }
    }
  }
</script>
