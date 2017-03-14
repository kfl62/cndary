define ['libs/cnd_msg','public/cnd_login','public/cnd_map'], ()->
  $.extend Cnd,
    init: ()->
      Cnd.msgHide()
      $('a.header-login').click ()->
        Cnd.login($(this))
        false
      $menuItems = $('nav.menu ul li a').click ()->
        $('#xhr_content').load "/#{$(this).attr('id')}"
        false
      Cnd.gmap($('#google_map')[0])
      $(document).tooltip
        content: ()->
          $(@).attr('title').replace(/\n/g, "<br/>")
      return
  Cnd
