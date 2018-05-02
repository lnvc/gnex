# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# $ ->
#   $(document).on 'change', '#supplier_select', (evt) ->
#     $.ajax 'update_products',
#       type: 'GET'
#       dataType: 'script'
#       data: {
#         country_id: $("#supplier_select option:selected").val()
#       }
#       error: (jqXHR, textStatus, errorThrown) ->
#         console.log("AJAX Error: #{textStatus}")
#       success: (data, textStatus, jqXHR) ->
#         console.log("Dynamic supplier select OK!")
# jQuery ->
#     $('#inflow_product_id').parent().hide()
#     products = $('#inflow_product_id').html()
#     $('#inflow_supplier_id').change ->
#         supplier = $('#inflow_supplier_id :selected').text()
#         options = $(products).filter("optgroup[label='#{supplier}']").html()
#         if options
#             $('#inflow_product_id').html(options)
#             $('#inflow_product_id').parent().show()
#         else
#             $('#inflow_product_id').empty()
#             $('#inflow_product_id')parent().hide()
        