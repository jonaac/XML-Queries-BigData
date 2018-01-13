<summary>
{
	let $mondial := "mondial-2015.xml"
    
    for $country in doc($mondial)/mondial/country 
    order by $country
    let $capital :=
    	<capital>
    	{
    		for $city in $country//city
    			return
    				if ($city/@id = {$country/@capital/data()}) then (
						{$city/name[1]/text()}
					)
					else()

    	}
    	</capital>
    let $populations := 
		<populations>
		{
			for $population in $country/population
			where $population/@year = max($country/population/@year)
			return <population year='{$population/@year/data()}'>{$population/text()}</population>
		}
		</populations>
	let $inceptions :=
		<inceptions>
		{
			let $ind := $country/indep_date
			return
				if ($ind) then (
					<inception>{$country/indep_date/text()}</inception>)
				else ()
		}
		</inceptions>
	return 
		<country name='{$country/name/text()}'>
			{$capital}
			{$populations/population}
			<size>{$country/@area/data()}</size>
			{$inceptions/inception}
		</country>		
}
</summary>