require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("public/*").map { |fname| File.basename(fname) }.sort
  @files.reverse! if params[:sort] == "desc"
  erb :list
end
