using System.Collections.Generic;

namespace MavenThought.MovieLibrary
{
    /// <summary>
    /// Library to store media
    /// </summary>
    public class Library
    {
        /// <summary>
        /// Collection to store the movies
        /// </summary>
        private readonly ICollection<IMovie> _contents = new List<IMovie>();

        /// <summary>
        /// Gets the Contents of the library
        /// </summary>
        public IEnumerable<IMovie> Contents
        {
            get { return this._contents; }
        }

        /// <summary>
        /// Adds a movie to the library
        /// </summary>
        /// <param name="movie">Movie to add</param>
        public void Add(IMovie movie)
        {
            this._contents.Add(movie);
        }
    }
}