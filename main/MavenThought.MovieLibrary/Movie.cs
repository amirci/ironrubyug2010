using System;

namespace MavenThought.MovieLibrary
{
    public class Movie : IMovie
    {
        public Movie(string title)
        {
            Title = title;
        }

        public Movie(string title, DateTime releaseDate)
        {
            Title = title;
            ReleaseDate = releaseDate;
        }

        public string Title { get; private set; }

        public DateTime? ReleaseDate { get; private set; }

        public override string ToString()
        {
            return string.Format("Movie {0} released on {1}", Title, ReleaseDate == null ? "(na)" : ReleaseDate.ToString());
        }
    }
}