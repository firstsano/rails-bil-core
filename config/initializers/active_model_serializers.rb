# Use attributes adapter
ActiveModelSerializers.config.adapter = :attributes

# Use camel_lower keys transformation
ActiveModelSerializers.config.key_transform = :camel_lower

# Do not include relations by default
ActiveModelSerializers.config.default_includes = nil
