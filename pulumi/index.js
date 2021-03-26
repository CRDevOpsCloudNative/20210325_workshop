"use strict";
const aws = require("@pulumi/aws");

const prefijoEntorno = "workshop";
const rangoDeIps = "10.0.0.0/16";
const arregloDeSubnets = [];
const amiId = "ami-03d315ad33b9d49c4";

const subnets = [
    [`${prefijoEntorno}-subnet-a`, "10.0.1.0/24" ],
    [`${prefijoEntorno}-subnet-b`, "10.0.2.0/24" ],
]

const miVpc = new aws.ec2.Vpc(`${prefijoEntorno}-vpc`, {
    cidrBlock: rangoDeIps,
})

const securityGroup = new aws.ec2.SecurityGroup(`${prefijoEntorno}-sg`, {
    description: "Esto es un Workshop, no hagan esto en produccion",
    vpcId: miVpc.id,
    ingress: [
        {
            fromPort: 0,
            toPort: 0,
            protocol: "-1",
            cidrBlocks: ["0.0.0.0/0"],
        }
    ],
    egress: [
        {
            fromPort: 0,
            toPort: 0,
            protocol: "-1",
            cidrBlocks: ["0.0.0.0/0"],
        }
    ],
})

const crearSubnet = (nombreDeSubnet, rangoDeIps, idDeVpc) => {
    return new aws.ec2.Subnet(nombreDeSubnet, {
        vpcId: idDeVpc,
        cidrBlock: rangoDeIps,
        tags: {
            Name: nombreDeSubnet,
        }
    })
}

subnets.forEach((subnet) => {
    arregloDeSubnets.push(crearSubnet(subnet[0], subnet[1], miVpc.id));
})

arregloDeSubnets.forEach((subnet) => {
    return new aws.ec2.Instance(`${prefijoEntorno}-instance-${Math.random(10)}`, {
        ami: amiId,
        instanceType: "t2.micro",
        subnetId: subnet.id,
        securityGroupIds: [
            securityGroup.id
        ]
    })
})
