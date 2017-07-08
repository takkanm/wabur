
require 'uri'

module WAB

  # The class representing the cananical data structure in WAB. Typically the
  # Data instances are factory created by the Shell and will most likely not
  # be instance of this class but rather a class that is a duck-type of this
  # class (has the same methods and behavior).
  class Data

    # Gets the Data element or value identified by the path where the path
    # elements are separated by the '.' character. The path can also be a
    # array of path node identifiers. For example, child.grandchild is the
    # same as ['child', 'grandchild'].
    def get(path)
      raise NotImplementedError.new
    end
    
    # Sets the node value identified by the path where the path elements are
    # separated by the '.' character. The path can also be a array of path
    # node identifiers. For example, child.grandchild is the same as ['child',
    # 'grandchild']. The value must be one of the allowed data values
    # described in the initialize method.
    #
    # For arrays, the behavior is similar to an Array#[] with the exception
    # of a negative index less than the negative length in which case the
    # value is prepended (Array#unshift).
    #
    # path:: path to location to be set
    # value:: value to set
    # repair:: flag indicating invalid value should be repaired if possible
    def set(path, value)
      raise NotImplementedError.new
    end

    # Each child of the Data instance is provided as an argument to a block
    # when the each method is called.
    def each()
      raise NotImplementedError.new
    end

    # Each leaf of the Data instance is provided as an argument to a block
    # when the each method is called. A leaf is a primitive that has no
    # children and will be nil, a Boolean, String, Numberic, Time, WAB::UUID,
    # or URI.
    def each_leaf()
      raise NotImplementedError.new
    end

    # Make a deep copy of the Data instance.
    def clone()
      raise NotImplementedError.new
    end

    # Returns the instance converted to native Ruby values such as a Hash,
    # Array, etc.
    def native()
      raise NotImplementedError.new
    end

    # Returns true if self and other are either the same or have the same
    # contents. This is a deep comparison.
    def eql?(other)
      raise NotImplementedError.new
    end

    # Returns the length of the root element.
    def length()
      raise NotImplementedError.new
    end

    # Returns the number of leaves in the data tree.
    def leaf_count()
      raise NotImplementedError.new
    end

    # Returns the number of nodes in the data tree.
    def size()
      raise NotImplementedError.new
    end

    # Encode the data as a JSON string.
    def json(indent=0)
      raise NotImplementedError.new
    end

    private

    # This method is included only to raise an error if an attempt is made to
    # create an instance directly.  The Shell implementation should provide a
    # similar initializer which should create a new Data instance with the
    # initial value provided. The value must be a Hash or Array. The members
    # of the Hash or Array must be nil, boolean, String, Integer, Float,
    # BigDecimal, Array, Hash, Time, URI::HTTP, or WAB::UUID. Keys to Hashes
    # must be Symbols.
    def initialize(value=nil, repair=false)
      raise NotImplementedError.new
    end

  end # Data
end # WAB