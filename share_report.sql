USE manila;
SELECT keystone.project.name AS project, shares.id, shares.display_name AS share_name, share_types.name AS share_type, shares.size AS size_GB FROM shares
INNER JOIN keystone.project ON shares.project_id=keystone.project.id
LEFT JOIN share_types ON shares.share_type_id=share_types.id
WHERE shares.deleted_at IS NULL
ORDER BY project;

SELECT keystone.project.name AS project, SUM(shares.size) AS share_usage_GB FROM shares
INNER JOIN keystone.project ON shares.project_id=keystone.project.id
WHERE shares.deleted_at IS NULL
GROUP BY project;

SELECT share_types.name AS share_type, SUM(shares.size) AS share_usage_GB FROM shares
LEFT JOIN share_types ON shares.share_type_id=share_types.id
WHERE shares.deleted_at IS NULL
GROUP BY share_type;
