require 'pry-byebug'

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
