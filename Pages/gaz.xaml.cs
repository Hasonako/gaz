using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace gaz.Pages
{
    /// <summary>
    /// Логика взаимодействия для gaz.xaml
    /// </summary>
    public partial class gaz : Page
    {
        public gaz()
        {
            InitializeComponent();
            dist.ItemsSource = dbConnect.entObj.distribution.ToList();
        }

        private void txbSearchName_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void txbSearchCode_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void menuArzamas_Click(object sender, RoutedEventArgs e)
        {

        }

        private void menuNN_Click(object sender, RoutedEventArgs e)
        {

        }

        private void menuAdd_Click(object sender, RoutedEventArgs e)
        {

        }

        private void menuReport_Click(object sender, RoutedEventArgs e)
        {

        }
        private void ApplyFilters()
        {
            string searchText = txbSearchName.Text.ToLower();
            var query = dbConnect.entObj.distribution.AsQueryable();

            if (txbSearchCode.Text != "Код" && !string.IsNullOrEmpty(txbSearchCode.Text))
            {
                int searchCode = Convert.ToInt32(txbSearchCode.Text);
                query = query.Where(m => m.code == searchCode);
            }

            if (txbSearchName.Text != "Поиск по наименованию" && !string.IsNullOrEmpty(txbSearchName.Text))
                query = query.Where(m => m.name.ToLower().Contains(searchText));

            dist.ItemsSource = query.ToList();
        }
        private void menuExit_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult messageBoxResult = MessageBox.Show("Are you sure?", "Delete Confirmation", MessageBoxButton.YesNo);
            if (messageBoxResult == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }
    }
}
