define () ->
  $.extend true,Cnd,
    desk:
      selects:
        handleOID: (select)->
          $hd   = Cnd.desk.hdo
          $form = Cnd.desk.hdf
          $id   = select.attr('id')
          select.on 'change', ()->
            $hd[$id] = select.val()
          return
        handleRID: (select)->
          $hd   = Cnd.desk.hdo
          $form = Cnd.desk.hdf
          select.on 'change', () ->
            Cnd.lst.setItem 'r_mdl', 'fake_mdl'
            Cnd.lst.setItem 'r_id', select.val()
            $url = "#{$form.attr('action')}/#{$hd.dialog}?r_id=#{select.val()}"
            Cnd.desk.init($url)
            return
          return
        init: ()->
          @handleOID($('select#oid'))
          @handleRID($('select[id$=_id]'))
          $log('Cnd.desk.selects.init() OK...')
  Cnd.desk.selects
