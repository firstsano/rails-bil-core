module RCore
  class SequelDb
    class << self
      attr_reader :utm_db

      def connections
        [@utm_db]
      end

      def start_connections
        @utm_db ||= establish_connection('utm')
      end

      def disconnect_all
        utm_db.disconnect
      end

      private

      def establish_connection(database)
        Sequel.connect params_to_connect(database)
      end

      def params_to_connect(database)
        yml_config = YAML.load_file(File.expand_path('../../database.yml', __FILE__))
        env_database = "#{database}_#{Rails.env}"
        yml_config[env_database]
      end
    end
  end
end

RCore::SequelDb.start_connections
