require 'rubygems'
require 'thor'
require 'atomic-parsley-ruby'
require 'imdb'

class MGCLI < Thor
  desc "imdb", "Encodes video with attributes from imdb."
  method_option :video, :type => :string, :required => true
  method_option :title, :type => :string, :required => false
  def imdb
    search_term = options[:title]
    search_term ||= File.basename(options[:video], ".*")

    searched = Imdb::Search.new(search_term)
    movie = searched.movies.first

    if movie.nil?
      puts "Could not find any #{search_term}"
    else
      img_name = File.basename(movie.poster)

      open(movie.poster) {|f|
        File.open(img_name,"wb") do |file|
          file.puts f.read
        end
      }

      media = AtomicParsleyRuby::Media.new(File.expand_path(options[:video]))

      media.encode do |config|
        config.title movie.title
        #config.year DateTime.parse(movie.release_date).year
        config.genre movie.genres.first
        config.artist movie.cast_members.join(", ")
        config.description movie.plot
        config.artwork img_name
      end

    end
  end
end

MGCLI.start