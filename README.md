# Frisco Food Trucks

This project pulls the data from [DataSF](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data) and provides it as a searchable resource online at [friscofoodtrucks.com](https://www.friscofoodtrucks.com/).

On startup and every 24 hours thereafter, the data is pulled as a CSV and since there isn't much data at all, stored in memory, ready to be served.

There are two codebases in this monorepo.

- "api" holds the Phoenix app that gathers, transforms, and exposes the data.
- "web" is the React app that displays the data.

There is only one endpoint on the API that is served by the `index` action on a trucks controller that serves up the list, taking a `filter` param - a single `string` - to use to narrow down the list.

The core of the API is a GenServer that keeps the truck data in state and refreshs it daily. There are also two services to fetch and parse the data. One uses a behaviour to help out with testing.

We only store approved food trucks that have food items and locations listed, filtering out anything else.

There is no database. A future improvement might be to also store the data in a database for use if the DataSF service isn't available, giving us time to figure out what's up without the site being down.

There's also not a lot of error handling to maintain the stability of the site if things go wrong. Having the data backed up in a database would help with that. If the process crashed - probably due to an issue with fetching or parsing the data, such as if their service were down or they changed the fields - we should fall back to pulling the stored data into memory when the process is restarted.

I didn't do much with the client other than throwing it together to actually show the data, test it out, and make it live.

Thanks for looking!
