<countries>
{
	let $mondial := "mondial-2015.xml"

	for $country in doc($mondial)//country
	order by $country/name
	where count($country/border) > 0
	return
		<country name='{$country/name/text()}'>
		{

			for $neighbour in $country/border
				for $potentialneighbour in doc($mondial)//country
				order by $potentialneighbour/name
				return 
					if ($neighbour/@country = $potentialneighbour/@car_code) then (
						<neighbour name='{$potentialneighbour/name/text()}'>
							<length> {$neighbour/@length/data()}</length>
						</neighbour>
					)
					else()

		}
		</country>
}
</countries>