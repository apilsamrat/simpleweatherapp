<article>

  <h1>SimpleWeatherApp ☁️☀️</h1>

  <p>SimpleWeatherApp is a Flutter-based mobile application that allows users to check the weather forecast for their current location or any other location they choose. This app includes the following features:</p>

  <ul>
    <li>🌤️ Display the current weather condition</li>
    <li>🌡️ Display the current temperature in Celsius</li>
    <li>🔍 Provide a search functionality to search for weather in any location</li>
    <li>🎨 Beautiful and minimalistic UI</li>
  </ul>

  <h2>Installation</h2>

  <ol>
    <li>Clone this repository.</li>
    <li>Rename the file <code>api_key2.dart</code> to <code>api_key.dart</code> located in the folder <code>lib/secrets</code>.</li>
    <li>Open the <code>api_key.dart</code> file and enter the weatherapi.com's API key in the <code>globalApiKey</code> variable.</li>
    <li>Run the following commands:</li>
  </ol>

  <pre><code>$ flutter pub get
$ flutter run
  </code></pre>

  <p>Note: Make sure you have Flutter installed on your machine before running the app.</p>

  <h2>Screenshots</h2>

  <img src="/assets/screenshots/screenshot_00.jpg" alt="Screenshot 00">

  <img src="/assets/screenshots/screenshot_02.jpg" alt="Screenshot 01">

  <img src="/assets/screenshots/screenshot_02.jpg" alt="Screenshot 02">


  <p>The app uses <a href="https://www.weatherapi.com/">WeatherAPI.com</a> to retrieve weather data and the following open-source packages:</p>

  <h2>Packages</h2>

  <p>The app uses the following open-source packages:</p>

  <ul>
    <li><a href="https://pub.dev/packages/geolocator">geolocator</a> - for location-based services</li>
    <li><a href="https://pub.dev/packages/http">http</a> - for making HTTP requests to weather APIs</li>
  </ul>

</article>
