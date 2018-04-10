USE ovs_neutron;
SELECT keystone.project.name AS project, networks.id, networks.name, subnets.name AS subnet, subnets.cidr, networks.status FROM networks
INNER JOIN keystone.project ON networks.tenant_id COLLATE utf8_unicode_ci = keystone.project.id
INNER JOIN subnets ON networks.id=subnets.network_id
ORDER BY project, networks.name;
