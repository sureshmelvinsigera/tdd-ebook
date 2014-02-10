require 'shellwords'

def local_ebook_variant(extension)
  "./Test-Driven Development - Extensive Tutorial.#{extension}"
end

def unzip!(archive, exdir = nil)
  exdir ||= "."
  archive = archive.shellescape
  sh "unzip -o #{archive} -d #{exdir}"
end

def convert(source_ebook, params)
  params[:using] ||= ""
  params[:to] ||= params[:to].shellescape
  source_ebook = source_ebook.shellescape
  sh "ebook-convert #{source_ebook} .#{params[:to].to_s} #{params[:using]}"
end

SOURCE_DOCUMENT = local_ebook_variant(:epub)
PUBLISH_FOLDER = '/home/astral/Dropbox/Public/'
PDF_CONVERSION_OPTIONS = "--pdf-add-toc --toc-title \"Table of Contents\" --margin-bottom 20 --margin-top 20 --margin-left 20 --margin-right 20 --pdf-add-toc --change-justification justify"

task :default => :push do
end

class Git
  include FileUtils

  def initialize(path_to_repository)
    @path = path_to_repository
  end

  def add_all()
    begin
      sh "cd \"#{@path}\" && git add --all"
    rescue 
      puts "Nothing to add to source control"
    end
  end

  def add(path)
    sh "cd \"#{@path}\" && git add --all #{path}"
  end

  def commit_all(commit_message)
    sh "cd \"#{@path}\" && git commit -a -m \"#{commit_message}\""
  end
 
  def push_changes_to_master
    sh 'git push -u origin master'
  end

  def push_changes
    sh 'git push'
  end

end
