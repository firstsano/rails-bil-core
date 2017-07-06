VOLGASPOT_DB = YAML.load_file(File.join(Rails.root, "config", "volgaspot_database.yml"))[Rails.env.to_s]
