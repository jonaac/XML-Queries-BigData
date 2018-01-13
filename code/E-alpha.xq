<alpha>
{
	let $mondial := "mondial-2015.xml"

	for $country in doc($mondial)/mondial/country
	order by $country/name
	where count($country//city) > 0
		and count($country//city/population) > 0
	return 
		<country name='{$country/name/text()}'>
		{
			let $cities := 
				for $city in $country//city
					for $population in $city/population
					where $population/@year = max($city/population/@year)
					return <alpha name='{$city/name[1]/text()}' population='{$population/text()}'/>
			let $max_population := max($cities/@population)
			for $alpha in $cities
			where $alpha/@population/data() = $max_population
			return $alpha
		}
		</country>
}
</alpha>
