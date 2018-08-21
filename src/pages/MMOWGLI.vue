<template>
  <q-page>
    <h2>{{ message}}</h2>
  </q-page>
</template>
<script>
import api from 'src/api'
const conversation = api.service('conversation')
import cards from '../../data/cards.json'

export default {
  data () {
    return {
      message: 'Loading'
    }
  },
  methods: {
    load (json, callback) {
      conversation.create(json).then((response) => {
        return callback(response)
      })
    }
  },
  mounted () {
    console.info('CARDS', cards.length)
    // console.info('JSON', cards[0])
    var card
    var self = this
    function next () {
      card = cards.pop()
      if (card) {
        self.load(card, function(res) {
          next()
        })
      } else {
        self.$data.message = 'Done'
        return
      }
    }
    next()
  }
}
</script>