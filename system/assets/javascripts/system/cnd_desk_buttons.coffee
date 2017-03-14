define () ->
  $.extend true, Cnd,
    desk:
      buttons:
        layout: (button) ->
          $bd = button.data()
          button.prepend("<i class='#{$bd.icon}'></i>")
          button.button()
          return
        handle_reload_path: (button) ->
          $hd = Cnd.desk.hdo
          $bd = button.data()
          if $bd.r_mdl?
            $.ajax({type: 'POST',url: "/sys/session/r_mdl/#{$bd.r_mdl}",async: false})
            Cnd.lst.setItem 'r_mdl', $bd.r_mdl
            Cnd.lst.setItem 'r_id',  $bd.r_id
            Cnd.lst.setItem 'tab',   $bd.tab  if $bd.tab
          if $bd.r_path?
            if $bd.r_path is 'remove'
              $.ajax({type: 'POST',url: "/sys/session/r_path/null",async: false})
              Cnd.lst.removeItem 'r_path'
            else
              $.ajax({type: 'POST',url: "/sys/session/r_path/#{$bd.r_path.replace(/\//g,'!')}",async: false})
              Cnd.lst.setItem 'r_path', $bd.r_path
          if $bd.url?
            [$url,$params] = $bd.url.split('?')
          else
            $url = Cnd.desk.hdf.attr('action')
          if Cnd.lst.r_id
            $params = if $params? then "?#{$params}&r_id=#{Cnd.lst.r_id}" else "?r_id=#{Cnd.lst.r_id}"
          else
            $params = if $params? then "?#{$params}" else ''
          [$url,$params]
        action:
          create: () ->
            $hd = Cnd.desk.hdo
            $bd = $(@).data()
            [$url,$params] = Cnd.desk.buttons.handle_reload_path($(@))
            Cnd.desk.closeDesk($bd.remove)
            $url = if $url.split('/').pop() is 'create' then "#{$url}#{$params}" else "#{$url}/create#{$params}"
            Cnd.desk.init($url)
            $log('Button.create Pressed...')
          show: () ->
            $hd = Cnd.desk.hdo
            $bd = $(@).data()
            [$url,$params] = Cnd.desk.buttons.handle_reload_path($(@))
            $hd.oid = if $bd.oid? then $bd.oid else $hd.oid
            if $hd.oid is null
              Cnd.publish("msg.select.error",'error',$hd.model_name)
            else
              Cnd.desk.closeDesk($bd.remove)
              $url += "/#{$hd.oid}#{$params}"
              Cnd.desk.init($url)
            $log('Button.show Pressed...')
          edit: () ->
            $hd = Cnd.desk.hdo
            $bd = $(@).data()
            [$url,$params] = Cnd.desk.buttons.handle_reload_path($(@))
            $hd.oid = if $bd.oid? then $bd.oid else $hd.oid
            if $hd.oid is null
              Cnd.publish("msg.select.error",'error',$hd.model_name)
            else
              Cnd.desk.closeDesk($bd.remove)
              $url = if $url.split('/').pop() is 'edit' then "#{$url}#{$params}" else "#{$url}/edit/#{$hd.oid}#{$params}"
              Cnd.desk.init($url)
            $log('Button.edit Pressed...')
          save: () ->
            $hd   = Cnd.desk.hdo
            $bd   = $(@).data()
            $type = Cnd.desk.hdf.attr('method')
            $data = Cnd.desk.hdf.serializeArray()
            [$url,$params] = Cnd.desk.buttons.handle_reload_path($(@))
            Cnd.desk.closeDesk($bd.remove)
            $hd.oid = if $hd.oid is null then 'create' else $hd.oid
            $url += "/#{$hd.oid}#{$params}"
            Cnd.desk.init($url,$type,$data)
            $log('Button.save Pressed...')
          delete: () ->
            $hd = Cnd.desk.hdo
            $bd = $(@).data()
            [$url,$params] = Cnd.desk.buttons.handle_reload_path($(@))
            $hd.oid = if $bd.oid? then $bd.oid else $hd.oid
            $type = if $bd.type? then $bd.type else Cnd.desk.hdf.attr('method')
            if $hd.oid is null
              Cnd.publish("msg.select.error",'error',$hd.model_name)
            else
              Cnd.desk.closeDesk($bd.remove)
              if $hd.dialog is 'delete' or $bd.type is 'delete'
                $url += "/#{$hd.oid}#{$params}"
                Cnd.desk.init($url,$type)
              else
                $url = if $url.split('/').pop() is 'delete' then "#{$url}#{$params}" else "#{$url}/delete/#{$hd.oid}#{$params}"
                Cnd.desk.init($url)
            $log('Button.delete Pressed...')
          cancel: () ->
            $bd = $(@).data()
            Cnd.desk.closeDesk($bd.remove)
            if Cnd.lst.r_mdl
              $.ajax({type: 'POST',url: "/sys/session/r_mdl/null",async: false})
              Cnd.lst.removeItem 'r_mdl'
              Cnd.lst.removeItem 'r_id'
            if Cnd.lst.r_path
              $.ajax({type: 'POST',url: "/sys/session/r_path/null",async: false})
              $url = Cnd.lst.r_path
              Cnd.lst.removeItem 'r_path'
              Cnd.desk.init($url)
            $log('Button.cancel Pressed...')
          relations: () ->
            if $('#relationsContainer').length
              $('#relationsContainer').remove()
            else
            require ['system/cnd_desk_relations'], (relations) ->
              $log('Cnd.desk.relations() Loaded...')
              relations.init()
              return
            $log('Button.relations Pressed...')
          print: ()->
            $hd   = Cnd.desk.hdo
            $form = Cnd.desk.hdf
            Cnd.msgShow Cnd.i18n.msg.report.start
            $.fileDownload "#{$form.attr('action')}/print?id=#{$hd.oid}",
              successCallback: ()->
                Cnd.msgHide()
                return
              failCallback: ()->
                Cnd.msgHide()
                Cnd.desk.createDownload $hd.model_name
                return
            $log('Button.print Pressed...')
        init: (buttons) ->
          $desk = $('#deskDialog')
          $buttons = if buttons? then buttons else $desk.find('button')
          $buttons.each () ->
            Cnd.desk.buttons.layout($(@))
            $(@).on 'click', Cnd.desk.buttons.action[$(@).data('action')]
            return
          $desk.find('.buttonset').buttonset()
          $log('Cnd.desk.buttons.init() OK...')
  Cnd.desk.buttons
