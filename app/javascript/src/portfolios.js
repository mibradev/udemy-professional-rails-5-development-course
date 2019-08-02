import sortable from 'html5sortable/dist/html5sortable.es'

$(document).on('turbolinks:load', () => {
  sortItems()
})

function sortItems() {
  const $sortable = $(sortable('.sortable'))

  $sortable.on('sortupdate', () => {
    const order = $('[data-id]').map((i, element) =>  {
      return {
        'id': $(element).attr('data-id'),
        'position': ++i
      }
    }).toArray()

    $.ajax({
      url: 'portfolios/sort',
      type: 'put',
      data: { order: order }
    })
  })
}
