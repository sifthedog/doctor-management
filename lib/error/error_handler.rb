module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end
    end

    private
    def record_not_found(_e)
      redirect_to root_path, alert: 'Registro não encontrado.'
    end
  end
end