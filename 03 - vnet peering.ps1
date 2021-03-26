## O script abaixo cria um peering entre a Vnet-01 e a Vnet-01

# Defina as variáveis

$vnet1 = Get-AzVirtualNetwork -Name Vnet-01 -ResourceGroupName RG-Vnet
$vnet2 = Get-AzVirtualNetwork -Name Vnet-02 -ResourceGroupName RG-Vnet02

# Criando Peering entre Vnet-01 e Vnet-02
Add-AzVirtualNetworkPeering -Name Vnet1-to-Vnet2 -VirtualNetwork $vnet1 `-RemoteVirtualNetworkId $vnet2.Id 
# Criando Peering entre Vnet-02 e Vnet-01Add-AzVirtualNetworkPeering -Name Vnet2-to-vnet1 -VirtualNetwork $vnet2 `-RemoteVirtualNetworkId $vnet1.Id # Verificando o status do peering(Get-AzVirtualNetworkPeering -ResourceGroupName RG-Vnet -VirtualNetworkName Vnet-01 | Select PeeringState).PeeringState# Verificando o status do peering
Get-AzVirtualNetworkPeering -ResourceGroupName RG-Vnet02 `
-VirtualNetworkName $vNet2.Name | Format-Table VirtualNetworkName, peeringState
 