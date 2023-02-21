require "gvcs/version"

require 'singleton'

module Gvcs
  class Error < StandardError; end
  # Your code goes here...

  # abstract the VCS engine
  # e.g. git, hg, svn etc
  class Vcs
  end

  # abstract of the vcs workspaces
  class Workspace
  end

  # abstract of the vcs remote repository
  class Repository
  end

  # configuration elements for the library
  class Config
    include Singleton
    
    def initialize
      @showCommand = false
      @commandOut = STDOUT
    end

    def show_vcs_command(val, out = STDOUT)
      if val == true or val == false
        @showCommand = val
        if @commandOut.respond_to?(:puts)
          @commandOut = out
        else
          raise Error, "Command output minimally need to support puts() call. Given #{@commandOut}"
        end
      end
    end

    def is_show_vcs_command?
      @showCommand
    end

    def command_output
      @commandOut
    end
  end

end
