#import 'JavaProperties'

module Fastlane
  module Actions
    class PropertyFileWriteAction < Action

      require "java-properties"

      def self.run(params)

        property_file = params[:file]

        property_key = params[:key]
        property_value = params[:value]

        # read in content of file
        content = JavaProperties.load(property_file)

        # alter content
        content[property_key.to_sym] = property_value

        # save back to file
        JavaProperties.write(content, property_file)
        true
      end

      def self.description
        "Writes value into properties file"
      end

      def self.authors
        ["Jan Meier"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Writes into property files. Used mostly in Android development as configuration files for gradle builds."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :file,
                env_name: "PROPERTY_FILE_WRITE_FILE",
             description: "Property file to write",
                optional: false,
                    type: String),
          FastlaneCore::ConfigItem.new(key: :key,
                env_name: "PROPERTY_FILE_WRITE_KEY",
             description: "Property key of file to alter",
                optional: false,
                    type: String),
          FastlaneCore::ConfigItem.new(key: :value,
                env_name: "PROPERTY_FILE_WRITE_VALUE",
             description: "Value of property to set",
                optional: false,
                    type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        [:ios, :mac, :android].include?(platform)
      end
    end
  end
end
