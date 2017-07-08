module WAB

  # A Controller class or a duck-typed alternative should be created and
  # registered with a Shell for any type that implements behavior other than
  # the default REST API processing. If a public method is not found on the
  # class instance then the default REST API processing will be used.
  #
  # A description of the available methods is included as private methods.
  class Controller # :doc: all
    attribute_accessor :shell
    attribute_accessor :view
    attribute_accessor :model

    # Create a instance.
    def initialize()
      @shell = nil
      @view = shell.view
      @model = shell.model
      # TBD
    end

    # Handler for paths that do not match the REST pattern. Only called on the
    # default controller.
    #
    # Processing result are passed back to the view which forward the result
    # on to the requester. The result, is not nil, should be a Data instance.
    #
    # path:: identifies operation and additional data in a / delimited
    #        format. It is up to the controller to decide how to process the
    #        request.
    # data:: data to be processed
    def handle(path, data)
      nil
    end

    # To make the desired methods active while processing the desired method
    # should be made public in the subclasses. If the methods remain private
    # they will not be called.
    private

    # Should create a new data object.
    #
    # The return should be the identifier for the object created or if
    # +with_data+ is true a Data object with an +id+ attribute and a +data+
    # attribute that contains the full object details.
    #
    # On error an Exception should be raised.
    #
    # data:: the data to use as a new object.
    # with_data:: flag indicating the response should include the new object
    def create(data, with_data=false) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Should return the object with the +id+ provided.
    #
    # The function should return the result of a fetch on the model with the
    # provided +id+. The result should be a Data instance which is either the
    # object data or a wrapper that include the object id in an +id+ attribute
    # and the object data itself in a +data+ attribute depending on the value
    # of the +with_id+ argument.
    #
    # id:: identifier of the object
    # with_id:: if true wrap the object data with an envelope that includes
    #           the id as well as the object data.
    def read(id, with_id=false) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Should return the objects with attributes matching the +attrs+ argument.
    #
    # The return should be a Hash where the keys are the matching object
    # identifiers and the value are the object data. An empty Hash or nil
    # indicates there were no matches.
    #
    # attrs:: a Hash with keys matching paths into the target objects and value
    #         equal to the target attribute values. A path can be an array of
    #         keys used to walk a path to the target or a +.+ delimited set of
    #         keys.
    def read_by_attrs(attrs) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Replaces the object data for the identified object.
    #
    # The return should be the identifier for the object updated or if
    # +with_data+ is true a Data object with an +id+ attribute and a +data+
    # attribute that contains the full object details. Note that depending on
    # the implemenation the identifier may change as a result of an update.
    #
    # On error an Exception should be raised.
    #
    # id:: identifier of the object to be replaced
    # data:: the data to use as a new object.
    # with_data:: flag indicating the response should include the new object
    def update(id, data, with_data=false) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Delete the identified object.
    #
    # On success the deleted object identifier is returned. If the object is
    # not found then nil is returned. On error an Exception should be raised.
    #
    # id:: identifier of the object to be deleted
    def delete(id) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Delete all object that match the set of provided attribute values.
    #
    # An array of deleted object identifiers should be returned.
    #
    # attrs:: a Hash with keys matching paths into the target objects and value
    #         equal to the target attribute values. A path can be an array of
    #         keys used to walk a path to the target or a +.+ delimited set of
    #         keys.
    def delete_by_attrs(attrs) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Return a Hash of all the objects of the type associated with the
    # controller.
    #
    # The return hash keys should be the identifiers of the objects and the
    # the values should be either nil or the object data if the +with_data+
    # flag is true. If the response will be larger than supported one of the
    # keys should be the empty string which indicated additional instance
    # exists and were not provided.
    #
    # Note that this could return a very large set of data. If the number of
    # instances in the type is large the +search()+ might be more appropriate
    # as it allows for paging of results and sorting.
    #
    # with_data:: flag indicating the return should include object data
    def list(with_data=false) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Search using a TQL SELECT.
    #
    # The provided TQL[http://opo.technology/pages/doc/tql/index.html] can be
    # either the JSON syntax or the friendly syntax. The call exists on the
    # controller to allow filtering and permission checking before
    # execution. Only the default controller is expected to provide a public
    # version of this method.
    #
    # query:: query
    # format:: can be one of :TQL or :TQL_JSON. The :GraphQL option is
    #          reserved for the future.
    def search(query, format=:TQL) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

    # Subscribe to changes in data pushed from the model that will be passed
    # to the view with the +push+ method if it passes the supplied filter.
    #
    # The +view+ +changed+ method is called when changes in data cause
    # the associated object to pass the provided filter.
    #
    # filter:: the filter to apply to the data. TBD the nature of the filter is pending.
    def subscribe(filter)
      # TBD
    end

    # Called by the model when data changes if supported by the model storage
    # component.
    #
    # data:: the data that has changed
    def changed(data) # :doc:
      # TBD implement the default behavior as an example or starting point
    end

  end # Controller
end # WAB