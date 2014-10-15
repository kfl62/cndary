# encoding: utf-8
module Cnd
  module Helpers
    class << self
      def registered(app)
        app.helpers self
      end
    end
    # @todo document this method
    def pdf(*args)
      render(:rb, *args)
    end
    # Delegates to I18n.translate with no additional functionality.
    #
    # @param [Symbol] *args
    #   The keys to retrieve.
    #
    # @return [String]
    #  The translation for the specified keys.
    #
    # @api public
    def translate(*args)
      args[0] = "#{Cnd.firm.i18n_path}.#{args[0]}"
      I18n.translate(*args)
    end
    alias :t :translate
    # Delegates to I18n.localize with no additional functionality.
    #
    # @param [Symbol] *args
    #   The keys to retrieve.
    #
    # @return [String]
    #  The translation for the specified keys.
    #
    # @api public
    def localize(*args)
      I18n.localize(*args)
    end
    alias :l :localize
    ##
    # Translates attribute name for the given model.
    #
    # @param [Symbol] model
    #  The model name for the translation.
    # @param [Symbol] attribute
    #  The attribute name in the model to translate.
    #
    # @return [String] The translated attribute name for the current locale.
    #
    # @example
    #   # => t("models.account.attributes.email", :default => "Email")
    #   mat(:account, :email)
    #
    def model_attribute_translate(model, attribute)
      model = model.is_a?(Mongoid::Document) ? model.class : model
      model.human_attribute_name(attribute)
    end
    alias :mat :model_attribute_translate
    # @todo
    def model_name
      mat(@object, 'model_name')
    end
    # Set language prefix for browser's path
    # @return [String]
    def localized_path
      lang = I18n.locale.to_s
      lang == "ro" ? "" : "/#{lang}"
    end
    alias :lp :localized_path
    # @todo
    def guess_icon(action)
      i = ['fa']
      case action
      when /query|filter/
        i.push 'fa-search'
      when /relations/
        i.push 'fa-arrows-h'
      when /create|add/
        i.push 'fa-plus-square-o'
      when /show|view/
        i.push 'fa-file-text-o'
      when /edit/
        i.push 'fa-edit'
      when /delete|remove/
        i.push 'fa-minus-square-o', 'red'
      when /save/
        i.push 'fa-floppy-o'
      when /print|pdf/
        i.push 'fa-print'
      when /cancel/
        i.push 'fa-ban'
      when /info|detail/
        i.push 'fa-info-circle', 'fa-lg', 'blue'
      when /warning/
        i.push 'fa-exclamation-triangle', 'fa-lg'
      when /error|error-red/
        i.push 'fa-bomb', 'fa-lg'
        i.push 'red' if action == 'error-red'
      when /loading/
        i.push 'fa-refresh', 'fa-spin', 'fa-lg'
      else
        i.push 'fa-bomb', 'fa-lg'
      end
      i.join(' ')
    end
  end # Helper
end # Cnd
