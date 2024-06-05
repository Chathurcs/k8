module "vpc" {
    source = "./vpc"
    cidr_block = "192.168.0.0/16"
    subnet1 = "192.168.1.0/24"
    az1 = "us-east-1a"
    subnet2 = "192.168.2.0/24"
    az2 = "us-east-1b"
    cidr_rt = "0.0.0.0/0"
}

module "lt_sg" {
    source = "./launchtemp.sg"
    vpcid = module.vpc.vpcid
    depends_on = [ module.vpc ]

}

module "eks" {
    source = "./eks"
    subnet1 = module.vpc.subnet1 
    subnet2 = module.vpc.subnet2 
    sgid = module.lt_sg.sgid
    ltid = module.lt_sg.ltid
    ltv1 = module.lt_sg.ltv1
    depends_on = [ module.lt_sg ]
}