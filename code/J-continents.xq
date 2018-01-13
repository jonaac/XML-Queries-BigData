<continents>	
{
	let $mondial := "mondial-2015.xml"
		
		for $continent in distinct-values(doc($mondial)//encompassed/@continent)
		order by $continent
		let $countries := doc($mondial)//country[.//encompassed/@continent/data()=$continent]
		
		let $continentSize := xs:integer ( sum (
			for $country in $countries
			let $percentage := $country//encompassed[@continent/data()=$continent]/@percentage/data()
			let $area := $country/@area/data()
			let $total := round( ({$area} * {$percentage}) div 100 )
			return <continentSize>{$total}</continentSize>
		) )

		return
		<continent name='{$continent}' size='{$continentSize}' countries='{count($countries)}'>
		{
			for $country in $countries
			order by $country/name
			let $total := round( xs:integer ({$country/@area/data()} * {$country//encompassed[@continent/data()=$continent]/@percentage/data()}) div 100 )
			return <country name='{$country/name/text()}' size='{$total}'/>
		}
		</continent>					
}
</continents>