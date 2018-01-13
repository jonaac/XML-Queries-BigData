<rivers>
{
	let $mondial := "mondial-2015.xml"

	for $river in distinct-values(doc($mondial)//located_at[@watertype='river']/@river)
	order by $river
	let $river-name := replace($river, '^[^-]*-([^-]*).*$', '$1')
	return
		<river name='{$river-name}'>
		{
			let $countries := distinct-values(doc($mondial)//country[.//city[./located_at/@river=$river]]/name/text())
				for $country in $countries 
				order by $country
				return <country name='{$country}'/>
		}
		</river>
}
</rivers>