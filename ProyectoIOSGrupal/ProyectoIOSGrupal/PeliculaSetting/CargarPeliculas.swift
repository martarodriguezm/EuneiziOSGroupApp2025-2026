import Foundation

class CargarPeliculas {
    var peliculas: [Pelicula] = [] // Lista de pelis
    
    
    init() {
        loadPeliculas() // Cargar peliculas al iniciar
    }
    
    //Listado de pelis
    func loadPeliculas() {
            peliculas = [
                Pelicula(id: 1, title: "The Shawshank Redemption", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", year: 1994, imageUrl: "https://devsapihub.com/img-movies/1.jpg", genre: "Drama", stars: 5),
                            Pelicula(id: 2, title: "Jumanji", description: "In Jumanji: The Next Level, the gang is back but the game has changed.", year: 2019, imageUrl: "https://devsapihub.com/img-movies/2.jpg", genre: "Adventure", stars: 3.4),
                            Pelicula(id: 3, title: "The Godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", year: 1972, imageUrl: "https://devsapihub.com/img-movies/3.jpg", genre: "Crime", stars: 2.8),
                            Pelicula(id: 4, title: "The Godfather: Part II", description: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.", year: 1974, imageUrl: "https://devsapihub.com/img-movies/4.jpg", genre: "Crime", stars: 4.3),
                            Pelicula(id: 5, title: "The Dark Knight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", year: 2008, imageUrl: "https://devsapihub.com/img-movies/5.jpg", genre: "Action", stars: 4),
                            Pelicula(id: 6, title: "12 Angry Men", description: "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.", year: 1957, imageUrl: "https://devsapihub.com/img-movies/6.jpg", genre: "Drama", stars: 1.8),
                            Pelicula(id: 7, title: "No Hard Feelings", description: "On the brink of losing her home, a woman agrees to date a wealthy couple's introverted son before he leaves for college.", year: 2023, imageUrl: "https://devsapihub.com/img-movies/7.jpg", genre: "Comedy", stars: 2.4),
                            Pelicula(id: 8, title: "The Lord of the Rings: The Return of the King", description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.", year: 2003, imageUrl: "https://devsapihub.com/img-movies/8.jpg", genre: "Fantasy", stars: 1.9),
                            Pelicula(id: 9, title: "Pulp Fiction", description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", year: 1994, imageUrl: "https://devsapihub.com/img-movies/9.jpg", genre: "Crime", stars: 5),
                            Pelicula(id: 10, title: "The Good, the Bad and the Ugly", description: "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.", year: 1966, imageUrl: "https://devsapihub.com/img-movies/10.jpg", genre: "Western", stars: 4.3),
                            Pelicula(id: 11, title: "The Lord of the Rings: The Fellowship of the Ring", description: "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.", year: 2001, imageUrl: "https://devsapihub.com/img-movies/11.jpg", genre: "Fantasy", stars: 5),
                            Pelicula(id: 12, title: "Fight Club", description: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.", year: 1999, imageUrl: "https://devsapihub.com/img-movies/12.jpg", genre: "Drama", stars: 4.2),
                            Pelicula(id: 13, title: "Dune: Part Two", description: "Paul Atreides unites with Chani and the Fremen to exact revenge against the conspirators who destroyed his family.", year: 2024, imageUrl: "https://devsapihub.com/img-movies/13.jpg", genre: "Sci-Fi", stars: 4.8),
                            Pelicula(id: 14, title: "Oppenheimer", description: "The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.", year: 2023, imageUrl: "https://devsapihub.com/img-movies/14.jpg", genre: "Biography", stars: 5),
                            Pelicula(id: 15, title: "Barbie", description: "Barbie suffers a crisis that leads her to question her world and her existence.", year: 2023, imageUrl: "https://devsapihub.com/img-movies/15.jpg", genre: "Comedy", stars: 3.2),
                            Pelicula(id: 16, title: "Spider-Man: No Way Home", description: "With Spider-Man’s identity revealed, Peter asks Doctor Strange for help, leading to multiverse chaos.", year: 2021, imageUrl: "https://devsapihub.com/img-movies/16.jpg", genre: "Action", stars: 4.6),
                            Pelicula(id: 17, title: "Avatar: The Way of Water", description: "Jake Sully lives with his newfound family formed on the planet of Pandora, facing new threats.", year: 2022, imageUrl: "https://devsapihub.com/img-movies/17.jpg", genre: "Sci-Fi", stars: 4.1),
                            Pelicula(id: 18, title: "The Batman", description: "Batman uncovers corruption in Gotham City that connects to his own family while facing the Riddler.", year: 2022, imageUrl: "https://devsapihub.com/img-movies/18.jpg", genre: "Action", stars: 3.7),
                            Pelicula(id: 19, title: "Everything Everywhere All at Once", description: "An aging Chinese immigrant is swept up in a wild adventure where she alone can save the world by exploring other universes.", year: 2022, imageUrl: "https://devsapihub.com/img-movies/19.jpg", genre: "Adventure", stars: 5),
                            Pelicula(id: 20, title: "The Matrix", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", year: 1999, imageUrl: "https://devsapihub.com/img-movies/20.jpg", genre: "Sci-Fi", stars: 5)
                        ]
            
        }
    
    func getPeliculas(forGenero genero: String, maximo: Int = 3) -> [Pelicula] {
            let filtradas = peliculas.filter { $0.genre.contains(genero) }
            return Array(filtradas.shuffled().prefix(maximo))
        }
}
