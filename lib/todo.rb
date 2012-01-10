module Todo
  def self.base_dir
    ENV['TODO_DIR'] || File.expand_path('~/.todo')
  end

  class List
    attr_accessor :name

    def self.all
      Dir.entries(Todo.base_dir).select{|f| File.file?(File.join(Todo.base_dir, f))}.map{|f| find(f)}
    end

    def self.find(name)
      new(name)
    end

    def initialize(name)
      @name = name
    end

    def filename
      File.join(Todo.base_dir, @name)
    end

    def add item
      File.open(filename, 'a') {|f| f.write("#{item}\n") }
    end

    def remove_at i
      new_items = items
      new_items.delete_at(i)
      if new_items.length > 0
        File.open(filename, 'w') {|f| f.write(new_items.map{|i| "#{i}\n"}.join())}
      else
        File.delete(filename)
      end
    end

    def items
      if File.exists?(filename)
        File.open(filename).lines.to_a.map{|l| l.chomp}
      else
        []
      end
    end

    def to_s
      items_str = if items.empty?
                    "  (empty)"
                  else
                    items.each_with_index.map{|item, i| "  #{i+1}: #{item}"}.join("\n")
                  end
      "#{@name}:\n#{items_str}"
    end
  end
end
