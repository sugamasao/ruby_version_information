module RubyVersionInformation
  class Extract
    def initialize
      @data = {}
    end

    def run
      @data[:version] = RUBY_VERSION
      @data[:classes] = {}
      classes.each do |c|
        @data[:classes][c.name] = {
          instance_methods: c.instance_methods(false),
          class_methods: c.methods(false),
        }
      end
      @data
    end

    def classes
      ObjectSpace.each_object(Class).select { |c|
        case
        when c.name.to_s.empty?
          false
        when c.name.start_with?('RubyVersionInformation')
          false
        when c.name.start_with?('Bundler')
          false
        else
          true
        end
      }.sort_by { |c|
        c.name
      }
    end
  end
end