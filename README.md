# Installation
```
docker-compose build
docker-compose up
docker-compose run web rake db:create db:seed
```

# Search 
Full text search is implemented using **pg_trgm**

