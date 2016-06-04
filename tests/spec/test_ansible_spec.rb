require 'serverspec'

set :backend, :exec 

packages = ["git", "unzip", "epel-release"] 

describe "Make sure base packages installed" do
	
	packages.each do |base|
	   describe package(base) do
	      it { should be_installed }
	   end
	end

end

describe "path should exist" do
	describe file("/opt/miniconda2/bin/conda") do
	    it { should exist }
	    it { should be_executable }
	end

	describe file("/etc/nginx/sites-enabled") do
	    it { should exist }
	end

	describe file("/etc/nginx/sites-available") do
	    it { should exist }
	end

	describe file("/etc/nginx/sites-enabled/eclaim_nginx.conf") do
	    it { should exist }
        it { should be_symlink }
	end

end
