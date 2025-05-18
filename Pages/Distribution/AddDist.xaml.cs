using gaz.Main;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
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
    /// Логика взаимодействия для AddDist.xaml
    /// </summary>
    public partial class AddDist : Page
    {
        public AddDist()
        {
            InitializeComponent();
            cmbFilterStatus.SelectedValuePath = "Status";
            cmbFilterStatus.DisplayMemberPath = "Status";
            cmbFilterStatus.ItemsSource = dbConnect.entObj.Pipeline.GroupBy(o => o.Status).ToList();
        }

        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Pipeline distObj = new Pipeline()
                {
                    Code = Convert.ToInt32(txbCode.Text),
                    Location = txbLoc.Text,
                    InstallationDate = Convert.ToDateTime(txbInstDate.Text),
                    Length = Convert.ToDouble(txbLength.Text),
                    Pressure = Convert.ToDouble(txbPressure.Text),
                    Status = cmbFilterStatus.Text,
                };
                dbConnect.entObj.Pipeline.Add(distObj);
                dbConnect.entObj.SaveChanges();
                MessageBox.Show(
                    "Газопровод '" + distObj.Code + "' добавлен",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning
                    );
                this.NavigationService.Navigate(new gaz());
            }
            catch 
            {
                MessageBox.Show(
                    "Введены неверные данные",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning
                    );
            }

            
        }
    }
}
