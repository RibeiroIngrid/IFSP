const searchInput = document.getElementById('searchInput');
const searchButton = document.getElementById('searchButton');
const resultsDiv = document.getElementById('results');

const API_KEY = '8ffe91d6-17ec-4cb3-9b18-a571c7efcb16'; 

async function searchMovies(title) {
  const response = await fetch(`http://www.omdbapi.com/?apikey=${API_KEY}&s=${title}`);
  const data = await response.json();
  return data.Search;
}

searchButton.addEventListener('click', async () => {
  const searchTerm = searchInput.value;
  const movies = await searchMovies(searchTerm);

  resultsDiv.innerHTML = '';

  if (movies.length > 0) {
    movies.forEach(movie => {
      const movieDiv = document.createElement('div');
      movieDiv.classList.add('card');
      movieDiv.innerHTML = `
        <div class="card-image">
          <figure class="image is-4by3">
            <img src="${movie.Poster}" alt="${movie.Title}">
          </figure>
        </div>
        <div class="card-content">
          <div class="content">
            <h4>${movie.Title} (${movie.Year})</h4>
          </div>
        </div>
      `;
      resultsDiv.appendChild(movieDiv);
    });
  } else {
    resultsDiv.innerHTML = '<p>Nenhum filme encontrado.</p>';
  }
});
