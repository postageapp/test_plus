module TestPlus::Support
  # == Module Methods =======================================================

  def reduce_with(list, reduction)
    case (reduction)
    when Symbol
      reduction_method = reduction
      reduction = lambda do |o|
        o.respond_to?(reduction_method) ? o.send(reduction_method) : o
      end
    end

    list.to_a.flatten.map(&reduction)
  end

  extend self
end
