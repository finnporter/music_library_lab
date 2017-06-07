require('pry-byebug')
require_relative('albums')

class Artists
  
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end
  
  
end