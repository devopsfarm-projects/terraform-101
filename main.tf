module "team1" {
    source = "./module/vpc_instance"
    cidr_subnet1 = "10.0.1.0/24"
    vpc_cidr = "10.0.0.0/16"
    environment = "team1"
}




module "team2" {
    source = "./module/vpc_instance"
    cidr_subnet1 = "10.1.1.0/24"
    vpc_cidr = "10.1.0.0/16"
    environment = "team2"
}