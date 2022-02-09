'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "7a251c27cd57abc7cff699a417e16796",
"assets/assets/anims/loading.flr": "51eb608bfe80ffe1b004dfc551fbae77",
"assets/assets/images/classifications/Emerg%25C3%25AAncia.svg": "94f70ace313b2fb3e46b17b9089bbebf",
"assets/assets/images/classifications/N%25C3%25A3o%2520Urgente.svg": "9f9f87bd99fe7552ab2c4604f3fbc0e2",
"assets/assets/images/classifications/Pendente.svg": "01856a4a6f2de4a9ce57f254759a5a99",
"assets/assets/images/classifications/Pouco%2520Urgente.svg": "dee8a3be4a81c094a78831ef16199201",
"assets/assets/images/classifications/Urgente.svg": "061625a9f78aa965281618478700fa94",
"assets/assets/images/logo.png": "87a695d03f998e0c430de2a1b3eded58",
"assets/assets/images/menu/agendamento.svg": "6b19e4294905157def86fa09d97ada8d",
"assets/assets/images/menu/analytics.svg": "750cf9decedc39ef1c8977a0ff76fa72",
"assets/assets/images/menu/configuracoes.svg": "4c20c4cb94a9beef7aed4b5f57d8e868",
"assets/assets/images/menu/drawer.svg": "2f47e9270f699b4702f827bd6202d055",
"assets/assets/images/menu/inicio.svg": "b649287de8e1a14cbc6479236beee5b7",
"assets/assets/images/menu/monitoramento.svg": "55187ecc028312f0b87ec7f74faad9ee",
"assets/assets/images/menu/notificacoes.svg": "4963527ef314e2da6a91e7738aba1f94",
"assets/assets/images/menu/pacientes.svg": "f103bae3fa85d6a590056fead093b578",
"assets/assets/images/menu/usuarios.svg": "15b855cb8b2f3d2127b4aca8bcba8da3",
"assets/assets/images/others/background.png": "5fe8b4dc9bdda58a85297976e24f6086",
"assets/assets/images/others/background_card.png": "a3e06c0ac7f46db2d90f34356897ff9f",
"assets/assets/images/others/drag.svg": "85802f43ec2044dea7804124410bba4c",
"assets/assets/images/photos/user_1.jpg": "846321f4860d36f8762cf8a92f2f7136",
"assets/assets/images/photos/user_2.jpg": "53de29550d5e45033ebd76248b1e4c12",
"assets/assets/images/photos/user_3.jpg": "ea3b997facd43507e98b65dce3a3c6ad",
"assets/assets/images/photos/user_4.jpg": "d767fe4fe05bb2724828ae5381d8c8eb",
"assets/assets/images/symptoms/Cansa%25C3%25A7o%2520Fadiga.svg": "16d6c126b96881ef4d773203433a36e2",
"assets/assets/images/symptoms/Chiado%2520no%2520Peito.svg": "37ebfb66aa44fc107a351a1ca7075244",
"assets/assets/images/symptoms/Des%25C3%25A2nimo%2520Ansiedade.svg": "3310c31315d2ee81868872b5abab1e6b",
"assets/assets/images/symptoms/Diarr%25C3%25A9ia.svg": "3e27e8695a4b0aa8a52a432662199d22",
"assets/assets/images/symptoms/Dificuldade%2520de%2520Concentra%25C3%25A7%25C3%25A3o,%2520Esquecimento,%2520Cabe%25C3%25A7a%2520vazia.svg": "bd1914ceb7c72ec1b1d23542612edfc3",
"assets/assets/images/symptoms/Dor%2520nas%2520Articula%25C3%25A7%25C3%25B5es.svg": "b69e73c69c054d5ed64a6218f1e44c8d",
"assets/assets/images/symptoms/Dor%2520no%2520Corpo.svg": "f976aad25fc19833b7abac5145d9aa72",
"assets/assets/images/symptoms/Dores%2520de%2520Cabe%25C3%25A7a.svg": "3b5cb4864875e6888d837c3f9e581718",
"assets/assets/images/symptoms/Falta%2520de%2520Ar.svg": "62ebb17574d9415a345759ff1aa82702",
"assets/assets/images/symptoms/Febre.svg": "96bba732aa81d646aea343da7341f53e",
"assets/assets/images/symptoms/Insonia.svg": "6a6734984953c74861084ee353ade329",
"assets/assets/images/symptoms/Intestino%2520Preso.svg": "b232292f8dadf148471afab3b2b6f763",
"assets/assets/images/symptoms/Les%25C3%25B5es.svg": "927502247802f3999b47fbe2807c77af",
"assets/assets/images/symptoms/N%25C3%25A3o%2520sente%2520cheiro.svg": "e2807974946b4b10ad656521802fd28f",
"assets/assets/images/symptoms/N%25C3%25A3o%2520sente%2520gosto.svg": "1b6126189f975f79edbcc0a0d610cee5",
"assets/assets/images/symptoms/queda%2520de%2520cabelo.svg": "0d91a99c8fbb2e7b259c0f57c9226ff5",
"assets/assets/images/symptoms/Taquicardia.svg": "13a0db3edba557077822723c8db39aa8",
"assets/assets/images/symptoms/Tosse.svg": "1164bc8be18704995e6e922160c9a048",
"assets/assets/images/symptoms/Tremores.svg": "cdb1483a70c8aef844a23052e1f125b8",
"assets/assets/static_jsons/monitoring_today.json": "59805d7822e3c16dbd460b45359f01e7",
"assets/assets/static_jsons/report_doc.json": "947498c807fd11f4e3eddc7414daa7e2",
"assets/assets/static_jsons/scheduling_today.json": "9c8ef54612ffb34052865b5bdfe10520",
"assets/FontManifest.json": "851407e608ebe7473c0ff3a0a45a91b7",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "1f20a674df1e79730c4b1e04bd775651",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/modern_form_line_awesome_icons/assets/fonts/icon_font.ttf": "4d42f5f0c62a8f51e876c14575354a6e",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4ce078efa64dbf8dca6dc3a9de564e71",
"/": "4ce078efa64dbf8dca6dc3a9de564e71",
"main.dart.js": "df03d6b25c915a3bc12117509ca43089",
"manifest.json": "a6bf733c5ff7cd5775faad23095ee26a",
"version.json": "03f5412e45d2df3d844a7cbea420b6f4"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
