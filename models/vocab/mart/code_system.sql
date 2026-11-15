select s.*, f.sha256 as source_sha256
from {{ ref('stg_code_system') }} as s
left join {{ ref('stg_source_file') }} as f on list_contains(f.paths, s.source_path)
