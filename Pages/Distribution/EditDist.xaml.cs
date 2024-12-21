using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Security.Cryptography;
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
    public partial class EditDist : Page
    {
        private distributionArz dst;
        public EditDist(object mat)
        {
            InitializeComponent();
            DataContext = mat;
            var mid = TypeDescriptor.GetProperties(DataContext)["id"].GetValue(DataContext);
            dst = dbConnect.entObj.distributionArz.FirstOrDefault(a => a.id == (int)mid);

            cmbFilterDest.SelectedValuePath = "endpoint";
            cmbFilterDest.DisplayMemberPath = "endpoint";
            cmbFilterDest.ItemsSource = dbConnect.entObj.distributionArz.GroupBy(o => o.endpoint).ToList();
            cmbFilterDest.SelectedValue = dst.endpoint;

            cmbFilterStatus.SelectedValuePath = "status";
            cmbFilterStatus.DisplayMemberPath = "status";
            cmbFilterStatus.ItemsSource = dbConnect.entObj.distributionArz.GroupBy(o => o.status).ToList();
            cmbFilterStatus.SelectedValue = dst.status;
        }

        private void menuDlt_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены?", "Удаление направления", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                dbConnect.entObj.distributionArz.Remove(dst);
                dbConnect.entObj.SaveChanges();
                this.NavigationService.Navigate(new gaz());
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            string txb = txbLength.Text.Replace('.', ',');
            decimal len = Convert.ToDecimal(txb);
            dst.code = Convert.ToInt32(txbCode.Text);
            dst.name = txbName.Text;
            dst.length = len;
            dst.status = cmbFilterStatus.Text;
            dst.endpoint = cmbFilterDest.Text;
            dbConnect.entObj.SaveChanges();
            MessageBox.Show(
                "Сохранено",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Warning
                );
            this.NavigationService.Navigate(new gaz());
        }

        private void menuBack_Click(object sender, RoutedEventArgs e) => this.NavigationService.GoBack();
    }
}
