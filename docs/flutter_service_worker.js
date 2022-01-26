'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "9e6caeeee7f5f8c78ee6b34335f22f27",
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
"assets/assets/images/others/drag.svg": "85802f43ec2044dea7804124410bba4c",
"assets/assets/images/symptoms/Des%25C3%25A2nimo%2520Ansiedade.svg": "3310c31315d2ee81868872b5abab1e6b",
"assets/assets/images/symptoms/Diarr%25C3%25A9ia.svg": "3e27e8695a4b0aa8a52a432662199d22",
"assets/assets/images/symptoms/Dores%2520de%2520Cabe%25C3%25A7a.svg": "3b5cb4864875e6888d837c3f9e581718",
"assets/assets/images/symptoms/Febre.svg": "96bba732aa81d646aea343da7341f53e",
"assets/assets/images/symptoms/queda%2520de%2520cabelo.svg": "0d91a99c8fbb2e7b259c0f57c9226ff5",
"assets/assets/static_jsons/monitoring_today.json": "59805d7822e3c16dbd460b45359f01e7",
"assets/assets/static_jsons/report_doc.json": "947498c807fd11f4e3eddc7414daa7e2",
"assets/FontManifest.json": "4ccb1be16bf30df330c1d7077d164108",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "bd508f5f1f4b5072d02d79e16e646eca",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/modern_form_line_awesome_icons/assets/fonts/icon_font.ttf": "4d42f5f0c62a8f51e876c14575354a6e",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1843bd1478cdc599d2be9b138e4723d1",
"/": "1843bd1478cdc599d2be9b138e4723d1",
"main.dart.js": "df8e26a8285c1e58b92ef9a8a39b6ce5",
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
