using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.EntityFrameworkCore.Storage;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Data.Entity;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Entity_framework_core
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static ObservableCollection<VMOfSongs> vm_of_songs = new();
        public MainWindow()
        {
            InitializeComponent();
            LoadData();
            DataContext = vm_of_songs;
            vm_of_songs.CollectionChanged += Songs_CollectionChanged;
        }
        public void Songs_CollectionChanged(object? sender, NotifyCollectionChangedEventArgs args)
        {
            using ProdDbMus prod_db_mus = new();
            prod_db_mus.Ev_song.RemoveRange(args.OldItems!
                .Cast<VMOfSongs>().Select(song => song.Compositions));
            prod_db_mus.SaveChanges();
        }
        public static void LoadData()
        {
            vm_of_songs.Clear();
            using ProdDbMus prod_db_mus = new();
            foreach (Songs song in prod_db_mus.Ev_song.ToArray()) vm_of_songs.Add(new VMOfSongs(song, LoadData));
        }
        private void grid_AddingNewItem(object sender, AddingNewItemEventArgs e) => e.NewItem = new VMOfSongs(new Songs(), LoadData);
    }
}