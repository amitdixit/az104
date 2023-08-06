param location string = 'Central India'
@secure()
param adminPassword string

resource appNetwork 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: 'app-network'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    // subnets: [
    //   {
    //     name: 'Subnet-1'
    //     properties: {
    //       addressPrefix: '10.0.0.0/24'
    //     }
    //   }
    //   {
    //     name: 'Subnet-2'
    //     properties: {
    //       addressPrefix: '10.0.1.0/24'
    //     }
    //   }
    // ]
    subnets: [for i in range(1, 3): {
      name: 'Subnet-${i}'
      properties: {
        addressPrefix: cidrSubnet('10.0.0.0/16', 24, i)
      }
    }]
  }
}

resource appIPAddress 'Microsoft.Network/publicIPAddresses@2023-02-01' = {
  name: 'app-ip'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // dnsSettings: {
    //   domainNameLabel: 'dnsname'
    // }
  }
}

resource appNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-02-01' = {
  name: 'app-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH'
        properties: {
          description: 'Allow Remote SSH'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource appNetworkInterface 'Microsoft.Network/networkInterfaces@2023-02-01' = {
  name: 'app-network-interface'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipConfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'app-network', 'Subnet-1')
          }
          publicIPAddress: {
            id: appIPAddress.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: appNetworkSecurityGroup.id
    }
  }
}

resource akdtore55434434 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'akdtore55434434'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource ubuntuVM 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: 'appvm'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    osProfile: {
      computerName: 'appvm'
      adminUsername: 'appusr'
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        name: 'linuxVM1OSDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: appNetworkInterface.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: reference(resourceId('Microsoft.Storage/storageAccounts/', toLower('akdtore55434434'))).primaryEndpoints.blob
      }
    }
  }
}
