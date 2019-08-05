import consumer from './consumer'

consumer.subscriptions.create('BlogChannel', {
  initialized() {
    $(document).on('turbolinks:load', () => {
      this.$comments = $('[data-channel="comments"]')
    })
  },

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if (this.$comments.is(`[data-blog-id=${data.comment.blog_id}]`)) {
      this.$comments.append(data.html)
    }
  }
})
