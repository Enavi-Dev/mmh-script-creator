class CodeQualifier < Qualifier
  def initialize(match_type, match_condition, codes)
    @match_condition = match_condition
    @invert = match_type == :does_not
    @codes = codes.map(&:downcase)
  end

  def match?(cart, selector = nil)
    return false if cart.discount_code.nil?
    code = cart.discount_code.code.downcase
    case @match_condition
      when :match
        return @invert ^ @codes.include?(code)
      when :start_or_end_with
        return @invert ^ @codes.any? { |check| code.start_with?(check) || code.end_with?(check) }
      else
        return @invert ^ partial_match(@match_condition, code, @codes)
    end
  end
end
