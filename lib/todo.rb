module Todo
  class List
    BASE_DIR = File.expand_path('~/.todo')
    attr_accessor :name

    def self.all
      Dir.entries(BASE_DIR).select{|f| File.file?(File.join(BASE_DIR, f))}.map{|f| find(f)}
    end

    def self.find(name)
      new(name)
    end

    def initialize(name)
      @name = name
    end

    def filename
      File.join(BASE_DIR, @name)
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
