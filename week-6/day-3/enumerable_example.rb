class Library
  include Enumerable

  def initialize
    @h2g2 = "Hitchhicker's Guide"
    @war_and_peace = "War and Peace"
    @pride = "Pride and Prejudice"
    @moby_dick = "Moby Dick"
  end

  def each
    yield @h2g2
    yield @war_and_peace
    yield @pride
    yield @moby_dick
    yield @h2g2
    yield @war_and_peace
    yield @pride
    yield @moby_dick
  end
end

library = Library.new

p library.map { |book| book.upcase }




#
