package "php5-fpm"

service "php5-fpm" do
  action    [:enable, :start]
  supports  [:start, :restart, :stop]
end

template "/etc/php5/fpm/pool.d/www.conf" do
  source "www.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "php5-fpm"), :immediately
end