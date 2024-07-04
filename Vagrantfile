RAM_SIZE = 32
CPU_CORES = 16

IP_NW = '192.168.56.'

ram_selector = (RAM_SIZE / 4) * 4
raise "Unsufficient memory #{RAM_SIZE}GB. min 8GB" if ram_selector < 8

RESOURCES = {
  'control' => {
    1 => {
      # controlplane01 bigger since it may run e2e tests.
      'ram' => [ram_selector * 128, 2048].max,
      'cpu' => CPU_CORES >= 12 ? 4 : 2
    },
    2 => {
      # All additional masters get this
      'ram' => [ram_selector * 128, 2048].min,
      'cpu' => CPU_CORES > 8 ? 2 : 1
    }
  },
  'worker' => {
    'ram' => [ram_selector * 128, 4096].min,
    'cpu' => (((CPU_CORES / 4) * 4) - 4) / 4
  }
}

# Define the number of master and worker nodes. You should not change this
NUM_CONTROL_NODES = 2
NUM_WORKER_NODE = 2

# Host address start points
MASTER_IP_START = 10
NODE_IP_START = 20
LB_IP_START = 30

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/jammy64'
  config.vm.boot_timeout = 900
  config.vm.box_check_update = false

  (1..NUM_CONTROL_NODES).each do |i|
    config.vm.define "controlplane0#{i}" do |node|
      node.vm.provider 'virtualbox' do |vb|
        vb.name = "k8s-ha-control-#{i}"
        vb.memory = RESOURCES['control'][i > 2 ? 2 : i]['ram']
        vb.cpus = RESOURCES['control'][i > 2 ? 2 : i]['cpu']
      end
      node.vm.hostname = "controlplane0#{i}"
      node.vm.network :private_network, ip: IP_NW + "#{MASTER_IP_START + i}"
      node.vm.network 'forwarded_port', guest: 22, host: "#{2710 + i}"
    end
  end

  config.vm.define 'loadbalancer' do |node|
    node.vm.provider 'virtualbox' do |vb|
      vb.name = 'loadbalancer'
      vb.memory = 512
      vb.cpus = 1
    end
    node.vm.hostname = 'loadbalancer'
    node.vm.network :private_network, ip: IP_NW + "#{LB_IP_START}"
    node.vm.network 'forwarded_port', guest: 22, host: 2730
  end

  (1..NUM_WORKER_NODE).each do |i|
    config.vm.define "node0#{i}" do |node|
      node.vm.provider 'virtualbox' do |vb|
        vb.name = "k8s-ha-worker-#{i}"
        vb.memory = RESOURCES['worker']['ram']
        vb.cpus = RESOURCES['worker']['cpu']
      end
      node.vm.hostname = "node0#{i}"
      node.vm.network :private_network, ip: IP_NW + "#{NODE_IP_START + i}"
      node.vm.network 'forwarded_port', guest: 22, host: "#{2720 + i}"

      next unless i == NUM_WORKER_NODE

      node.vm.provision 'ansible' do |ansible|
        ansible.inventory_path = 'ansible/inventory.yml'
        ansible.playbook = 'ansible/playbook.yml'
        ansible.limit = 'all'
      end
    end
  end
end
