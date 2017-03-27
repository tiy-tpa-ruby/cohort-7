require 'erb'

# Run this code with: ruby erb_example.rb
# Then open the output `book_report.html` in your browser with: open book_report.html
Book = Struct.new(:title, :year, :author, :page_count)

war_and_peace = Book.new("War and Peace", 1869, "Leo Tolstoy", 1225)
h2g2          = Book.new("The Hitchhiker's Guide to the Galaxy", 1979, "Douglas Adams", 224)
moby_dick     = Book.new("Moby Dick", 1851, "Herman Melville", 927)
pride         = Book.new("Pride and Prejudice", 1813, "Jane Austen", 432)

@books = [war_and_peace, h2g2, moby_dick, pride]

# ---------------------------------------------------------------------------------

template_string = File.read("book_report.html.erb")
erb_template = ERB.new(template_string)
html = erb_template.result(binding)

File.write("book_report.html", html)
