import { $ } from "@rails/ujs";

// ライブラリの読み込み
//必要な変数の定義
let map; 
const mapTarget = document.getElementById('map') //mapというIDのついたHTML要素取得する
const planId = mapTarget.dataset.mapid

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");  //必要なマップやマーカーの機能を読み込み
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker") 

  map = new Map(document.getElementById("map"), {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 15,
    mapId: "DEMO_MAP_ID", 
    mapTypeControl: false
  });

  
  try {
    const response = await fetch(`/plans/${planId}.json`);
    if (!response.ok) throw new Error('Network response was not ok');

    const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");

    if (items.length > 0) {
      const latlng = { lat: items[0].latitude, lng: items[0].longitude }
      map.setCenter(latlng);
    }

    items.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const name = item.name;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: name,

      });
    });

    const linkTargets = document.querySelectorAll(".spot-address")
    linkTargets.forEach((linkTarget) => {
      linkTarget.addEventListener("click", (e) => {
        const target = e.target
        const spotId = target.dataset.spotid
        const result = items.find(o => o.id == spotId)
        const latlng = { lat: result.latitude, lng: result.longitude }
        map.setCenter(latlng);
        const targetDOMRect = mapTarget.getBoundingClientRect()
        const targetTop = targetDOMRect.top + window.pageYOffset;
        window.scrollTo({
          top: targetTop,
          bejavior: 'smooth'
        })
      });
    });
  } catch (error) {
    console.error('Error fetching or processing post images:', error);
  }
}



initMap()