# Set container and image names
$containername=$args[0]
$imagename=$args[1]
$volumnename=$args[2]

# Stop the contriner
docker stop $containername

# Remove the container
docker rm $containername

# Remove the image
docker rmi $imagename

# Remove the volume
docker volume rm $volumnename
