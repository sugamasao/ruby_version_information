module RubyVersionInformation
  class Differ
    def initialize(old_version, new_version)
      @old_version = old_version
      @new_version = new_version
    end

    def show_classes
      puts "*** class diff ***"
      if @old_version['classes'].keys != @new_version['classes'].keys
        (@old_version['classes'].keys - @new_version['classes'].keys).each do |name|
          puts "D #{ name }"
        end
        (@new_version['classes'].keys - @old_version['classes'].keys).each do |name|
          puts "A #{ name }"
        end
      end
    end

    def show_methods
      puts "*** methods diff ***"
      [
        {name: 'Instance', type: 'instance_methods', separate: '#'},
        {name: 'Class', type: 'class_methods', separate: '.'},
      ].each do |target|
        (@old_version['classes'].keys & @new_version['classes'].keys).each do |class_name|
          old_methods = @old_version['classes'][class_name][target[:type]]
          new_methods = @new_version['classes'][class_name][target[:type]]
  
          (old_methods - new_methods).each do |name|
            puts "D #{ class_name }#{ target[:separate] }#{ name }"
          end
          (new_methods - old_methods).each do |name|
            puts "A #{ class_name }#{ target[:separate] }#{ name }"
          end
        end
      end
    end
  end
end