binaryRepository {
    url = 'http://localhost:8081/artifactory'
    username = 'admin'
    password = 'password'
    name = 'libs-release-local'
}

environments {
    test {
        server {
            hostname = "localhost"
        }
    }
}