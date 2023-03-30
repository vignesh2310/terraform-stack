variable REGION {
    default = "us-east-2"
}

variable ZONE1 {
    default = "us-east-2a"
}

variable ZONE2 {
    default = "us-east-2b"
}

variable ZONE3 {
    default = "us-east-2c"
}

variable AMI {
    type = map 
    deafult = {
        us-east-1 = "ami-00c39f71452c08778"
        us-east-2 = "ami-02f97949d306b597a"
    }
}

variable USER {
    deafult = "ec2-user"
}

variable PUB_KEY {
    default = "tfkey.pub"
}

variable PRV_KEY {
    default = "tfkey"
}