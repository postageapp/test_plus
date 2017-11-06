module TestPlus::Extensions
  # == Mixin Methods ========================================================

  # Tests that a model was created properly: That no errors were reported,
  # that the model is listed as valid, and that it's no longer flagged as a
  # new record.
  def assert_created(model)
    assert(model, "Model was not defined")
    assert_equal([ ], model.errors.full_messages)
    assert(model.valid?, "Model failed to validate")
    assert(!model.new_record?, "Model is still a new record")
  end

  # Tests that a model was not created by verifying that it has not been saved.
  def assert_not_created(model)
    assert(model, "Model was not defined")
    assert(model.new_record?, "Model has been saved")
  end
  alias_method :refute_created, :assert_not_created

  # Tests that the given model has errors on the specified attributes. Any
  # additional errors will be reported as anomalous, and any missing ones
  # will be flagged as well.
  def assert_errors_on(model, *attrs)
    found_attrs = [ ]

    model.errors.each do |attr, error|
      found_attrs << attr
    end

    assert_equal(
      attrs.flatten.collect(&:to_s).sort,
      found_attrs.uniq.collect(&:to_s).sort
    )
  end

  # Tests that two lists of objects contain the same values when calling a
  # method on the itens in question, if they respond to it. Those items that
  # do not respond to the method are treated as-is.
  def assert_equal_reduced(a, b, reduce, message = nil, &block)
    assert_equal(
      TestPlus::Support.reduce_with(a, reduce).to_a.sort,
      TestPlus::Support.reduce_with(b, reduce).to_a.sort,
      message,
      &block
    )
  end

  # Tests a number of cases simultaneously using a key-value Hash to map
  # inputs to expected outputs. The keys are supplied to a block and the
  # result of that block is compared to the expected value. Any mistakes
  # are reported as failures.
  def assert_mapping(map)
    result_map = map.each_with_object({ }) do |(k,v), h|
      if (k and k.respond_to?(:freeze))
        k = k.freeze
      end

      h[k] = yield(k)
    end

    differences = result_map.each_with_object([ ]) do |(k,v), a|
      next unless (v == map[k])

      a << k
    end

    assert_equal(
      map,
      result_map,
      differences.collect do |s|
        "Input: #{s.inspect}\n  Expected: #{map[s].inspect}\n  Result:   #{result_map[s].inspect}\n"
      end.join('')
    )
  end

  # Tests that an exceeption is raised. An optional exception class can be
  # provided to ensure that the exception is of the correct type.
  def assert_exception_raised(exception_class = nil, error_text = nil, message = nil, &block)
    exception_raised = nil
    yield

  rescue => exception_raised
    if (exception_class)
      assert_equal(
        exception_raised.is_a?(exception_class),
        message || "Exception raised is not of type #{exception_class}, instead is #{exception_raised.class}",
        &block
      )
    else
      assert(true)
    end

    if (error_text)
      assert_equal(
        error_text,
        exception_raised.to_s,
        message || "Exception raised had incorrect text",
        &block
      )
    end
  else
    if (exception_class)
      flunk(message || "Exception of type #{exception_class} was not raised")
    else
      flunk(message || "An exception was not raised")
    end
  end
end
