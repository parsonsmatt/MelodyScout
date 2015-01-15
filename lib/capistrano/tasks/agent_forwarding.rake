desc "Check if agent forwarding is working"
  task :forwarding do
    on roles(:all) do |h|
      if test("env | grep SSH_AUTH_SOCK")
        info "Agent forwarding is up to #{h}"
      else
        error "Agent forwading is not up to #{h}"
      end
    end
  end

