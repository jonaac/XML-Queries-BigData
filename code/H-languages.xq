<languages>
{
	let $mondial := "mondial-2015.xml"

	for $languages in distinct-values(doc($mondial)//language/text())
	order by $languages
	return
		<language name='{$languages}'>
		{
			let $countries := 
				for $country in doc($mondial)//country
					where count($country/population) > 0
					for $population in $country/population
					where $population/@year = max($country/population/@year)
						for $language in $country/language
						let $first :=  xs:decimal( {$population/text()} * {$language/@percentage/data()} )
						let $second := round({$first} div 100)
							return 
								if ($language/text() = $languages and exists($language/@percentage/data()) ) then (
									<country name='{$country/name/text()}' speakers='{$second}'/>
								)
								else ()
			for $country in $countries
			order by fn:number($country/@speakers) descending
			return $country
		}
		</language>
}
</languages>