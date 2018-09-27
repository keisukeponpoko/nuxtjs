<template>
  <v-app id="inspire">
    <v-navigation-drawer
      fixed
      v-model="drawer"
      app
    >
      <v-list dense>
        <router-link to="/">
          <v-list-tile>
            <v-list-tile-action>
              <v-icon>home</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>TOP</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </router-link>
        <router-link to="/admin">
          <v-list-tile>
            <v-list-tile-action>
              <v-icon>account_circle</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>管理者TOP</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </router-link>
        <router-link to="/admin/topic">
          <v-list-tile>
            <v-list-tile-action>
              <v-icon>highlight</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>ネタ</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </router-link>
        <router-link to="/admin/worker">
          <v-list-tile>
            <v-list-tile-action>
              <v-icon>people</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>ワーカー</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </router-link>
        <router-link to="/admin/article">
          <v-list-tile>
            <v-list-tile-action>
              <v-icon>book</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>記事</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </router-link>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar color="indigo" dark fixed app>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>管理者ページ</v-toolbar-title>
    </v-toolbar>
    <v-content class="content">
      <v-container fluid fill-height>
        <v-layout
          justify-center
          align-center
        >
          <nuxt />
        </v-layout>
      </v-container>
    </v-content>
    <v-footer color="indigo" app>
      <span class="white--text">&copy; 2017</span>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    data: () => ({
      drawer: false
    }),

    props: {
      source: String
    }
  }
</script>

<style scoped>
  .content {
    overflow: scroll;
  }
</style>
