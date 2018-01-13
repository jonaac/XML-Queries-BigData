let $mondial := "mondial-2015.xml"
	
	let $TotalPopulation := sum(
		for $country in doc($mondial)//country
		where (contains({$country/government/text()},'democracy')
			or contains({$country/government/text()},'republic')
			or contains({$country/government/text()},'constitutional monarchy'))
			and (count($country/gdp_total) > 0)
			and (not (contains({$country/government/text()},'dictator')))
		let $lastYear := max($country/population/@year)
		let $population := $country/population[@year=$lastYear]
		return $population
	)
	
	let $TotalGdp := sum(
		for $country in doc($mondial)//country
		where (contains({$country/government/text()},'democracy')
			or contains({$country/government/text()},'republic')
			or contains({$country/government/text()},'constitutional monarchy'))
			and (count($country/gdp_total) > 0)
			and (not (contains({$country/government/text()},'dictator')))
	    let $gdp := $country/gdp_total
		return $gdp
	) * 1000000
	
	let $GDPperCapita := format-number($TotalGdp div $TotalPopulation, '$#,##0.00')
	

	let $ND_TotalPopulation := sum(
		for $country in doc($mondial)//country
		where (
			(
			not (contains({$country/government/text()},'democracy'))
			and not (contains({$country/government/text()},'republic'))
			and not (contains({$country/government/text()},'constitutional monarchy'))
			)
			or (contains({$country/government/text()},'dictator'))
			)
			and (count($country/gdp_total) > 0)
		let $lastYear := max($country/population/@year)
		let $population := $country/population[@year=$lastYear]
		return $population
	)
	
	let $ND_TotalGdp := sum(
		for $country in doc($mondial)//country
		where (
			(
			not (contains({$country/government/text()},'democracy'))
			and not (contains({$country/government/text()},'republic'))
			and not (contains({$country/government/text()},'constitutional monarchy'))
			)
			or (contains({$country/government/text()},'dictator'))
			)
			and (count($country/gdp_total) > 0)
	    let $gdp := $country/gdp_total
		return $gdp
	) * 1000000
	let $ND_GDPperCapita := format-number($ND_TotalGdp div $ND_TotalPopulation, '$#,##0.00')

	return
		<gdp_per_capita>
			<countries government='democracy' gdppc='{$GDPperCapita}'/>
			<countries government='non-democracy' gdppc='{$ND_GDPperCapita}'/>
		</gdp_per_capita>