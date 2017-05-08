//Store list
var stores = [
                {
                    "type": "Store",
                    "name": "College Square Liquors",
                    "address1": "College Square, 444 WMC Dr # 106,",
                    "address2": " Westminster, MD 21158",
                    "times": ["Sunday 11AM - 7PM",
                                "Monday 9:30AM - 10PM",
                                "Tuesday 9:30AM - 10PM",
                                "Wednesday 9:30AM - 10PM",
                                "Thursday 9:30AM - 10PM",
                                "Friday 9:30AM - 10PM",
                                "Saturday 9:30AM - 10PM"
                            ],
                    "website": "",
                    "drinks": [],
                    "lat": 39.586029,
                    "long": -77.012904
                },
                {
                    "type": "Store",
                    "name": "Rite Aid Liquors",
                    "address1": "140 Englar Rd,",
                    "address2": "Westminster, MD 21157",
                    "times": ["Sunday 11AM - 7PM",
                                "Monday 9AM - 10PM",
                                "Tuesday 9AM - 10PM",
                                "Wednesday 9AM - 10PM",
                                "Thursday 9AM - 10PM",
                                "Friday 9AM - 10PM",
                                "Saturday 9AM - 10PM"
                              ],
                    "website": "www.riteaid.com",
                    "drinks": [],
                    "lat": 39.581761,
                    "long": -76.990429
                },
                {
                    "type": "Store",
                    "name": "Cranberry Liquors",
                    "address1": "405 N Center St #26,",
                    "address2": "Westminster, MD 21157",
                    "times": [ "Sunday 11AM - 6PM",
                                "Monday 9AM - 10PM",
                                "Tuesday 9AM - 10PM",
                                "Wednesday 9AM - 10PM",
                                "Thursday 9AM - 10PM",
                                "Friday 9AM - 10PM",
                                "Saturday 9AM - 10PM"
                              ],
                    "website": "www.cranberryliquors.com",
                    "drinks": [],
                    "lat": 39.574232,
                    "long": -76.982315
                }
            ]

//Brewery list
var breweries = [
                    {
                        "type": "Brewery",
                        "name": "Flying Dog Brewery",
                        "address1": "4607 Wedgewood Blvd,",
                        "address2": "Frederick, MD 21703",
                        "times": [ "Sunday 12PM - 6PM",
                                    "Monday Closed",
                                    "Tuesday Closed",
                                    "Wednesday 3PM - 8PM",
                                    "Thursday 3PM - 8PM",
                                    "Friday 3PM - 8PM",
                                    "Saturday 12PM - 8PM"
                                  ],
                        "website": "flyingdogbrewery.com",
                        "drinks": ["Raging Bitch", "Bloodline", "Snake Dog", "St. EADman", "The Truth", "Doggie Style"],
                        "lat": 39.362696,
                        "long": -77.426454
                    },
                    {
                        "type": "Brewery",
                        "name": "Jailbreak Brewing Company",
                        "address1": "9445 Washington Blvd N F,",
                        "address2": "Laurel, MD 20723",
                        "times": [ "Sunday Closed",
                                    "Monday Closed",
                                    "Tuesday Closed",
                                    "Wednesday 3PM - 10PM",
                                    "Thursday 3PM - 10PM",
                                    "Friday 3PM - 10PM",
                                    "Saturday 12PM - 10PM"
                                 ],
                        "website": "www.jailbreakbrewing.com",
                        "drinks": ["The Infinite", "Feed The Monkey", "Into the Dark", "Welcome to Scoville", "The White Russian", "Van Dammit", "Poor Righteous", "Big Punisher", "Ephemeral: Vol II",  "Ephemeral: Vol III", "Barrel Aged Big Pun", "Cask Special" ],
                        "lat": 39.124147,
                        "long": -76.823102
                    },
                    {
                        "type": "brewery",
                        "name": "Milkhouse Brewery",
                        "address1": "8253 Dollyhyde Rd,",
                        "address2": "Mt Airy, MD 21771",
                        "times": [ "Sunday 1PM - 6PM",
                                    "Monday Closed",
                                    "Tuesday Closed",
                                    "Wednesday Closed",
                                    "Thursday Closed",
                                    "Friday 3PM - 7PM",
                                    "Saturday 1PM - 8PM"
                                 ],
                        "website": "www.milkhousebrewery.com",
                        "drinks": ["Red Eye Porter", "Homestead Hefe Weizen", "Coppermine Creek Dry Stout", "Stairway IPA", "Goldie's Best Bitter", "Dollyhyde Farmhouse Ale" ],
                        "lat": 39.460262,
                        "long": -77.225512
                    }
                ]

//winery list
var wineries = [
                {
                    "type": "Winery",
                    "name": "Old Westminster Winery & Vineyard",
                    "address1": "1550 Old Westminster Rd,",
                    "address2": "Westminster, MD 21157",
                    "times": [ "Sunday 12PM - 5PM",
                                "Monday Closed",
                                "Tuesday Closed",
                                "Wednesday Closed",
                                "Thursday Closed",
                                "Friday 5PM - 10PM",
                                "Saturday 12PM - 5PM"
                             ],
                    "website": "www.oldwestminster.com",
                    "drinks": [],
                    "lat": 39.531623,
                    "long": -77.033225
                },
                {
                        "type": "Winery",
                        "name": "Serpent Ridge Vineyard",
                        "address1": "2962 Nicodemus Rd,",
                        "address2": "Westminster, MD 21157",
                        "times": [ "Sunday 10:30AM - 6PM",
                                    "Monday Closed",
                                    "Tuesday Closed",
                                    "Wednesday 12PM - 5PM",
                                    "Thursday 12PM - 5PM",
                                    "Friday 12PM - 5PM",
                                    "Saturday 12PM - 5PM",
                                  ],
                        "website": "www.serpentridge.com",
                        "drinks": [],
                        "lat": 39.494315,
                        "long": -77.004615
                },
                {
                        "type": "Winery",
                        "name": "Cygnus Wine Cellars",
                        "address1": "3130 Long Ln,",
                        "address2": "Manchester, MD 21102",
                        "times": [ "Sunday 12PM - 5PM",
                                    "Monday Closed",
                                    "Tuesday Closed",
                                    "Wednesday Closed",
                                    "Thursday Closed",
                                    "Friday Closed",
                                    "Saturday 12PM - 5PM",
                                ],
                        "website": "www.cygnuswinecellars.com",
                        "drinks": [],
                        "lat": 39.659453,
                        "long": -76.882864
                }
            ]

//change pin look
var breweryPin = L.icon({
                iconUrl: 'images/breweryPin.png',
                iconSize: [26.25, 40],
                iconAnchor: [13.125, 39],
                popupAnchor: [1,-40]
            })
var storePin = L.icon({
                iconUrl: 'images/storePin.png',
                iconSize: [26.25, 40],
                iconAnchor: [13.125, 39],
                popupAnchor: [1,-40]
            })
var wineryPin = L.icon({
                iconUrl: 'images/wineryPin.png',
                iconSize: [26.25, 40],
                iconAnchor: [13.125, 39],
                popupAnchor: [1,-40]
            })

//create filter group
var breweryLayer = L.layerGroup()
var storeLayer = L.layerGroup()
var wineryLayer = L.layerGroup()

//initiat pins for locations
for(i = 0; i < breweries.length; i++){
    var msg = 
    L.marker([breweries[i].lat, breweries[i].long],{icon:breweryPin})
        .addTo(breweryLayer)
        .bindPopup('<h3>' +breweries[i].name+'</h3>'+
                   breweries[i].address1 + 
                  '<br/>' +breweries[i].address2 +
                  '<br/>' +breweries[i].times[0] +
                  '<br/>More...')
        .on('click', openPopup(breweries[i]));
}

for(i = 0; i < stores.length; i++){
    L.marker([stores[i].lat, stores[i].long],{icon:storePin})
        .addTo(storeLayer)
       .bindPopup('<h3>' +stores[i].name+'</h3>'+
                   stores[i].address1 + 
                  '<br/>' +stores[i].address2 +
                  '<br/>' +stores[i].times[0] +
                  '<br/>More...')
        .on('click', openPopup())
        .data= stores[i];

}

for(i = 0; i < wineries.length; i++){
    L.marker([wineries[i].lat, wineries[i].long],{icon:wineryPin})
        .addTo(wineryLayer)
        .bindPopup('<h3>' +wineries[i].name+'</h3>'+
                   wineries[i].address1 + 
                  '<br/>' +wineries[i].address2 +
                  '<br/>' +wineries[i].times[0] +
                  '<br/>More...')
        .on('click', openPopup())
        .data= wineries[i];

}

// create map
var map = L.map('map').setView([39.5830, -77.0037], 18);

//map tiles
    L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',{
    attribution: '&copy; <a href="https://www.google.com/maps">GoogleMaps</a> Contributors',
    minZoom: 8,
    maxZoom: 18,
    subdomains:['mt0','mt1','mt2','mt3'],
    layers:[breweryLayer, wineryLayer, storeLayer]
    }).addTo(map);

//layer filters
var overlay = {
    "<img src='images/breweryIcon.png' height='18px'/> Breweries" : breweryLayer,
    "<img src='images/storeIcon.png' height='15px'/> Stores" : storeLayer,
    "<img src='images/wineryIcon.png' height='20px'/> Wineries": wineryLayer
}

L.control.layers("",overlay,{collapsed: false}).addTo(map);





//timeout to get location
function loadTime(){
    setTimeout(locateMe(), 2000)
}

//get location
function locateMe(){
        map.locate({setView: true, watch: true}) /* This will return map so you can do chaining */
        .on('locationfound', function(e){
            var marker = L.marker([e.latitude, e.longitude]).bindPopup('Your are here :)');
            map.addLayer(marker);
        })
        .on('locationerror', function(e){
            console.log(e);
            alert("Location access denied.");
        });
    }


//populate location information
function openPopup(e){
//        L.popup().setContent('<h3>e.name</h3')
}

//search function
// function find(){
//   $('#txtSearch').
// }
