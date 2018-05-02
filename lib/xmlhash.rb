require 'xmlhash/version'
require 'xmlhash/xmlhash'

module Xmlhash

  class XMLHash < Hash
    # Return an array of elements or []. It requires a plain string as argument
    #
    # This makes it easy to write code that assumes an array.
    # If there is just a single child in the XML, it will be wrapped
    # in a single-elemnt array and if there are no children, an empty
    # array is returned.
    #
    # You can also pass a block to iterate over all childrens.
    def elements(name)
      raise ArgumentError, 'expected string' unless name.is_a? String
      sub = self[name]
      return [] if !sub || sub.empty?
      unless sub.is_a? Array
        return [sub] unless block_given?
        yield sub
        return
      end
      return sub unless block_given?
      sub.each do |n|
        yield n
      end
    end

    # Return the element by the given name or an empty hash
    #
    # This makes it easy to write code that assumes a child to be present.
    # obj["a"]["b"] will give you a "[] not defined for nil".
    # obj.get("a")["b"] will give you nil
    def get(name)
      sub = self[name]
      return sub if sub
      XMLHash.new
    end

    # Return the value of the name or nil if nothing is there
    #
    def value(name)
      sub = self[name.to_s]
      return nil unless sub
      return '' if sub.empty? # avoid {}
      sub
    end

    # Initialize with a hash
    def initialize(opts = nil)
      replace(opts) if opts
    end

    def inspect
      "X(#{super})"
    end
  end

  def self.parse(str)
    @@mutex ||= Mutex.new
    @@mutex.synchronize { parse_int(str) }
  end
end
