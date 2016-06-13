require 'serverspec'

set :backend, :exec

packages = ["git", "unzip", "epel-release", "nginx"]

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

	# describe file("/etc/nginx/sites-enabled") do
	#     it { should exist }
	# end

	# describe file("/etc/nginx/sites-available") do
	#     it { should exist }
	# end

	# describe file("/etc/nginx/
	# sites-enabled/eclaim_nginx.conf") do
	#     it { should exist }
  #           it { should be_symlink }
	# end

	describe file("/root/.bashrc") do
		it { should exist }
		it { should contain("PATH=/opt/miniconda2/bin:$PATH")}
	end

	describe file("/root/.bash_profile") do
		it { should exist }
		it { should contain("PATH=/opt/miniconda2/bin:$PATH")}
	end

	describe file("/etc/nginx/conf.d/eclaim.conf") do
			it { should exist }
	end

	describe file("/etc/uwsgi.ini") do
			it { should exist }
	end

	describe file("/etc/environment") do
	    it { should exist }
	end

	describe file("/etc/rc.d/init.d/uwsgi") do
	    it { should exist }
	    it { should be_executable }
	end

	describe file("/opt/miniconda2/bin/uwsgi") do
	    it { should exist }
	    it { should be_executable }
	end
end

bash_files = ["/root/.bashrc", "/root/.bash_profile"]

describe "miniconda path should be in .bashrc and .bash_profile" do
	bash_files.each do |bash_file|
	   describe file(bash_file) do
	      it { should contain('PATH=/opt/miniconda2/bin:$PATH') }
	   end
	end
end

services = ["nginx", "postgresql", "uwsgi"]

describe "Main services that should be enabled" do	
	services.each do |core_service|
	    describe service(core_service) do
	       it { should be_enabled.with_level(3) }
	    end
	end
end
	
	   describe service(

   


