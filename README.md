# XML-Queries-BigData

## A-buddhist

### Question

Report the countries that have “Buddhist” reported as a religion practiced within the country.

### Structure

```xml
<myxml>
<buddhist>
    <country name='…' percentage='…'/>
    ...
</buddhist>
</myxml>
```
### Instructions

For a country's name, report the country's name, not its country code.
For attribute percentage, report the percentage of the population of that country which is buddhist.
Within root <buddhist>, present the <country> list in document order.

## B-straddle

### Question

Report countries that straddle two (or more) continents. Include as content which continents the country occupies.

### Structure

<straddle>
    <country name='…'>
        <continent name='…'/>
        ...
    </country>
    ...
</straddle>

### Instructions

Within root <straddle>, present the <country> list in document order.
Within node <country>, present the <continent> node in document order (as they appear within that <country> node within the document).

## C-woe

### Question

Report countries that have more than 5% inflation and 10% unemployment.

### Structure

<woe>
    <country inflation='…' unemployment='…'>
        <inflation>…</inflation>
        <unemployment>…</unemployment>
    </country>
        ⋮
</woe>

### Instructions

Within root <woe>, present the <country> list in document order.

## D-summary

### Question

For each country, report its name, capital, population, and size. Report every country; if one of the requested pieces of information for the country is missing, just leave it out.

### Structure

<summary>
    <country>
        <name>…</name>
        <capital>…</capital>
        <population year='…'>…</population>
        <size>…</size>
        <inception>…</inception>
    </country>
        ...
</summary>

### Instructions

For name, report the country's name, not its country code.
For capital, report the city's name, not the document's string for it. E.g., France's capital should be reported as “Paris”, not as “cty-France-Paris”. If there is more than one name for the city provided, choose the first.
For population, report the population count of the most recent (latest) year reported. Show the year in the results as an attribute. (Only have that one attribute, no more!)
Note that all <population> nodes in the dataset have a year attribute. You may assume this.
Size is reported as attribute area in the document.
For the inception data, use the value of the node <indep_date> under <country>.
If a country has no indep_date reported, do _not include <inception> for that country in the results.
Within root <summary>, sort the <country> list by name.

## E-alpha

### Question

For each country, report the alpha city for that country; that is, the city in the country with the largest population.

### Structure

<alpha>
    <country name='…'>
        <alpha name='…' population='…'/>
    </country>
        ⋮
</alpha>

### Instructions

Use the country's name, not country code.
In many cases, several populations are reported for a city, as measured in different years; use the latest year's population.
If a city has no population reported, ignore it.
In the dataset, when a <population> node is present for a city, it has a year attribute. You may assume this.
Within root <cities>, sort the <country> list by country name.
In the extremely rare case a country has more than one largest city (that is, with the exact same reported population for each), report each, ordered by the cities' names.

## F-rivers

### Question

For each river mentioned, report it by name (as an attribute) and contain the list of the countries by name that the river runs through.

### Structure

<rivers>
    <river name='…'>
        <country name='…'/>
            ⋮
    </river>
        ⋮
</rivers>

### Instructions

For a country's name, report the country's name, not its country code.
Do not repeat a <river> more than once; i.e., ensure the list of rivers is distinct.
Consider anything in node <located_at> with a value of “river” for attribute watertype as a river. Take the value of attribute river of such nodes in the document to be the river's name.
Rename the river not to include “river-” or ”sea-” at the front. See function replace for this.
Note, do all XPath matching you need to do before this string replace!
Do not repeat a <country> more than once within a <river> node; i.e., ensure the list of countries per river is distinct.
Within root <rivers>, order the <river> list by the rivers' names.
Within a <river> node, order the <country> nodes by the countries' names.

## G-bordering

### Question

For each country, list the countries that border it by name. Place within the bordering <neighbour> a node <length> that contains the length of the shared border.

### Structure

<countries>
    <country name='…'>
        <neighbour name='…'>
            <length>…</length>
        </neighbour>
            ⋮
    </country>
        ⋮
</countries>

### Instructions

For countries and neighbours, use the country's name, not country code.
If a country's node contains no border information, do not list it.
Within root <countries>, sort the <country> list by name.
Within each <country> node, sort the <neighbour> nodes by name.

## H-languages

### Question

Generate a document that reports for each language, the countries that have a reported population that speaks that language. Report in an attribute speakers for <country> an estimate of the number of speakers of that language (as country's population times the percentage that speak that language).

### Structure

<languages>
    <language name='…'>
        <country name='…' speakers='…'/>
            ⋮
    </language>
        ⋮
</languages>

### Instructions

For calculating speakers, when more than one population number is reported for a country, use the one with the latest year.
If the language's percentage for that country is missing, or if the country's population is missing, leave out speakers.
Sort the <language> list within the <languages> root by language name (ascending), and the <country> list within each <language> node by number of speakers descending. (Place any that have no speakers at the end sorted by the languages' names.)

## I-gdppc

### Question

Report the aggregate gdp per capita (gdppc) for democracies versus non-democracies.

### Structure

<gdp_per_capita>
    <countries government='…' gdppc='…'/>
        ⋮
</gdp_per_capita>

### Instructions

Only consider countries with a reported gdp_total.
Consider a country a democracy if it has “democracy”, “republic”, or “constitutional monarchy”, but not “dictator”, in the contents of its <government> node. In the answer XML, set the value of the attribute government for the report node <countries> for it to be “democracy”. Consider all other countries (with a reported gdp_total) non-democracies. In the answer XML, set the value of the attribute government for the report node <countries> for it to be “non-democracy”.
Compute the GDP per capita as the summed GDP's of the countries divided by the sum of their populations. Find the population of each country, using the last reported year for its population.
The GDP's reported in the dataset seem to be in US dollars and in millions. Adjust to report your gross domestic product per capita in dollars; e.g., $11,507.48.

## J-continents

### Question

Report for each continent the land area of the continent as size and the number of countries on that continent.

### Structure

<continents>
    <continent name='…' size='…' countries='…'>
        <country name='…' size='…'/>
            ⋮
    </continent>
        ⋮
</continents>

### Instructions

Some countries straddle several continents. The node <encompassed> reports the percentage of land area of the country within that continent. Pro-rate the country's contribution to the continent's size by the percentage.
Note that every <encompassed> has a percentage attribute; the value is 100% for any country entirely within that continent.
For country count, count the country with each continent that it straddles.
Within root <continents>, order the <continent> list by name.
Within a node <continent>, order the <country> list by country name. For area in country, list the area of the country belonging to that continent.
For area of country reported, I rounded to integer.
