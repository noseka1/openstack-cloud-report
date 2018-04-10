USE nova;
SELECT SUM(vcpus) as total_CPU, SUM(memory_mb) as total_memory_MB, SUM(local_gb) as total_disk_GB
FROM compute_nodes
WHERE deleted_at IS NULL;

USE nova;
SELECT SUM(instances.vcpus) as total_vCPU_used, SUM(instances.memory_mb) as total_memory_MB_used, SUM(instances.root_gb) as total_disk_GB_used
FROM instances
WHERE deleted_at IS NULL;

USE ovs_neutron;
SELECT count(*) as total_networks from networks;

USE cinder;
SELECT count(*) as total_volume_count, SUM(volumes.size) as total_volume_usage_GB
FROM volumes
WHERE volumes.deleted_at IS NULL;
