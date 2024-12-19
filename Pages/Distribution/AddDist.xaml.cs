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
            cmbFilterStatus.SelectedValuePath = "status";
            cmbFilterStatus.DisplayMemberPath = "status";
            cmbFilterStatus.ItemsSource = dbConnect.entObj.distributionArz.GroupBy(o => o.status).ToList();

            cmbFilterDest.SelectedValuePath = "endpoint";
            cmbFilterDest.DisplayMemberPath = "endpoint";
            cmbFilterDest.ItemsSource = dbConnect.entObj.distributionArz.GroupBy(o => o.endpoint).ToList();
        }

        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            distributionArz distObj = new distributionArz()
            {
                code = Convert.ToInt32(txbCode.Text),
                name = txbName.Text,
                length = Convert.ToDecimal(txbLength.Text),
                status = cmbFilterStatus.Text,
                endpoint = cmbFilterDest.Text
            };
            dbConnect.entObj.distributionArz.Add(distObj);
            dbConnect.entObj.SaveChanges();
            MessageBox.Show(
                "Газопровод '" + distObj.name + "' добавлен",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Warning
                );
            this.NavigationService.Navigate(new gaz());
        }
    }
}
