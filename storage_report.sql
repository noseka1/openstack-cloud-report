USE cinder;
SELECT keystone.project.name AS project, volumes.id, volumes.display_name AS volume_name, volume_types.name AS volume_type, volumes.size AS size_GB FROM volumes
INNER JOIN keystone.project ON volumes.project_id=keystone.project.id
LEFT JOIN volume_types ON volumes.volume_type_id=volume_types.id
WHERE volumes.deleted_at IS NULL
ORDER BY project;

SELECT keystone.project.name AS project, SUM(volumes.size) AS volume_usage_GB FROM volumes
INNER JOIN keystone.project ON volumes.project_id=keystone.project.id
WHERE volumes.deleted_at IS NULL
GROUP BY project;

SELECT volume_types.name AS volume_type, SUM(volumes.size) AS volume_usage_GB FROM volumes
LEFT JOIN volume_types ON volumes.volume_type_id=volume_types.id
WHERE volumes.deleted_at IS NULL
GROUP BY volume_type;
