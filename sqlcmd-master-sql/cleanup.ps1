# Set container and image names
$containername=$args[0]
$imagename=$args[1]

# Stop the contriner
docker stop $containername

# Remove the container
docker rm $containername

# Remove the image
docker rmi $imagename
