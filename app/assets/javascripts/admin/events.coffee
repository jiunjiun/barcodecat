# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  sortable_products = document.getElementById('sortable_products')
  if sortable_products
    Sortable.create sortable_products,
      animation: 150
      onEnd: (evt) ->
        event_id = $('#events_show').data('id')

        data = {}
        $('#sortable_products tr').each (index, v) ->
          id = $(v).data('id')
          data[id] = { index: index + 1 }

        $.ajax
          url: "/events/#{event_id}/products/update_index"
          type: 'PUT'
          data: {product_index_attributes: data}
          success: (data) ->
            if data.status == 'success'
              notyMessage '更新成功'
            else
              notyError '更新失敗'

