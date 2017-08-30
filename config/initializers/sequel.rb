module RCore
  class SequelDb
    class << self
      attr_reader :base_db, :utm_db

      def connections
        [@base_db, @utm_db]
      end

      def start_connections
        @base_db ||= establish_connection
        @utm_db ||= establish_connection('utm')
      end

      def disconnect_all
        connections.each(&:disconnect)
      end

      private

      def establish_connection(database = nil)
        Sequel.connect params_to_connect(database)
      end

      def params_to_connect(database = nil)
        yml_config = YAML.load_file(File.expand_path('../../database.yml', __FILE__))
        env_database = database ? "#{database}_#{Rails.env}" : Rails.env
        yml_config[env_database]
      end
    end
  end
end

RCore::SequelDb.start_connections
