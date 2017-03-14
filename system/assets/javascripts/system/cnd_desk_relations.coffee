define () ->
  $.extend true,Cnd,
    desk:
      relations:
        makeSelectable: ()->
          $('#deskDialog ul.trst-ui-sortable, #relationsContainer ul.trst-ui-sortable')
            .sortable
              connectWith: '.trst-ui-sortable'
              placeholder: 'ui-state-highlight'
              appendTo:    'body'
              helper:      'clone'
              zIndex:      1010
              start: (event,ui) ->
                ui.placeholder.height(ui.helper.height)
                return
            .disableSelection()
          return
        createContainer: ()->
          $button    = $('#deskDialog form button[data-action="relations"]')
          $container = $('<div id="relationsContainer"></div>')
          $container.css
            top:    $button.offset().top
            left:   $button.offset().left + $button.width() + 15
            zIndex: 1005
          $container
        init: ()->
          $hd      = Cnd.desk.hdo
          $form    = Cnd.desk.hdf
          $button  = $('#deskDialog form button[data-action="relations"]')
          $url     = "#{$form.attr('action').replace(/sys/,'utils/relations')}/#{$hd.oid}/#{$button.data('rel_to')}"
          $request = $.ajax url: $url, type: 'GET'
          $request.fail (xhr) ->
            Cnd.publish('error.desk', 'error', "#{xhr.status} #{xhr.statusText}")
          $request.done (data) ->
            $container = Cnd.desk.relations.createContainer()
            $container.append(data).appendTo('#deskDialog')
            Cnd.desk.relations.makeSelectable()
          $log('Cnd.desk.relations.init() OK...')
  Cnd.desk.relations
