require.config({
  paths: {
    'jquery': 'http://code.jquery.com/jquery-2.1.1.min',
    'jquery-ui': 'http://code.jquery.com/ui/1.11.1/jquery-ui.min',
    'async': 'plugins/async'
  },
  priority: ['jquery']
})

require(['jquery','jquery-ui','/javascripts/libs/jquery.ba-tinypubsub.min.js'], function($){
  $(function(){
    Cnd = {debug: false};
    $log = function(txt){
      if (Cnd.debug){
        console.log(txt)
      }
    };
    if ($('body').attr('id') == 'public'){
      require(['public/main'], function(){
        Cnd.init()
      })
    } else {
      require(['system/main'], function(){
        if ($('body').data('js_module_path')){
          var js_module_path = $('body').data('js_module_path')
          var module  = js_module_path.substr(0,1).toUpperCase() + js_module_path.substr(1)
          window[module] = {}
          require([js_module_path + '/main'], function(module){
            Cnd.module = module
            Cnd.init()
            module.init()
          })
        } else {
          Cnd.init()
        }
      })
    }
  })
})
