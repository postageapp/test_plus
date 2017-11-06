module TestPlus::Support
  # == Module Methods =======================================================

  def reduce_with(list, reduction)
    case (reduction)
    when Symbol
      reduction = lambda do |o|
        o.respond_to?(reduction) ? o.send(reduction) : o
      end
    end

    list.to_a.flatten.map(&reduction)
  end

  extend self
end
