USE nova;
SELECT keystone.project.name AS project, SUM(instances.vcpus) AS vCPU, SUM(instances.memory_mb) AS memory_MB, SUM(instances.root_gb) AS disk_GB FROM instances
INNER JOIN keystone.project ON instances.project_id=keystone.project.id
WHERE deleted_at IS NULL
GROUP BY project
ORDER BY project;

SELECT display_name, uuid, node FROM instances
WHERE deleted_at IS NULL
ORDER BY node, display_name;
