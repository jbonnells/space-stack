# space-stack

## Helpful Tips

### Git Submodules
Update all modules at once with:
```bash
git submodule update --remote --merge
```
If your submodules are out of sync after switching branches:
```bash
git submodule update --init --recursive
```

### Docker
Get the image running as a container in the background: 
```bash
docker run -d -it <image_id>
```
*`docker ps` will show the container_id that you just fired upfrom said image.*

To launch several sessions connected to the same container:
```bash
docker exec -it <container> bash
```