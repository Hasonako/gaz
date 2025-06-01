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
        private Pipeline dst;
        private const decimal Step = 0.1m;
        public EditDist(object mat)
        {
            InitializeComponent();
            DataContext = mat;
            var mid = TypeDescriptor.GetProperties(DataContext)["PipelineID"].GetValue(DataContext);
            dst = dbConnect.entObj.Pipelines.FirstOrDefault(a => a.PipelineID == (int)mid);

            cmbFilterStatus.ItemsSource = dbConnect.entObj.PipeStatus.GroupBy(o => o.name).ToList();
            cmbFilterStatus.SelectedValuePath = "id";
            cmbFilterStatus.DisplayMemberPath = "name";

            cmbFilterStatus.SelectedValue = dst.Status;
            txbLoc.Text = dst.Location;
            txbLength.Text = Convert.ToString(dst.Length);
            txbPressure.Text = Convert.ToString(dst.Pressure);
            dpNextInspectionDate.Text = Convert.ToString(dst.NextInspectionDate);
        }

        private void menuDlt_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены, что хотите удалить запись?", "Удаление газопровода", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                dbConnect.entObj.Pipelines.Remove(dst);
                dbConnect.entObj.SaveChanges();
                this.NavigationService.Navigate(new gaz());
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txbLoc.Text) ||
                    string.IsNullOrWhiteSpace(txbLength.Text) ||
                    string.IsNullOrWhiteSpace(txbPressure.Text) ||
                    string.IsNullOrWhiteSpace(cmbFilterStatus.Text))
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Проверка: дата след инспекции
                if (dpNextInspectionDate.SelectedDate == null)
                {
                    MessageBox.Show("Выберите дату.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Проверка: длина
                if (!decimal.TryParse(txbLength.Text, out decimal length) || length <= 0)
                {
                    MessageBox.Show("Длина должна быть положительным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Проверка: давление
                if (!decimal.TryParse(txbPressure.Text, out decimal pressure) || pressure <= 0)
                {
                    MessageBox.Show("Давление должно быть положительным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Поиск статуса
                var selectedStatus = dbConnect.entObj.PipeStatus.FirstOrDefault(x => x.name == cmbFilterStatus.Text);

                if (selectedStatus == null)
                {
                    MessageBox.Show("Выбранный статус не найден в базе данных.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                DateTime selectedDateNextInsp = dpNextInspectionDate.SelectedDate.Value;
                if (selectedDateNextInsp < DateTime.Today)
                {
                    MessageBox.Show("Дата следующей инспекции не может быть раньше сегодняшнего дня.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Сохранение объекта
                dst.Location = txbLoc.Text.Trim();
                dst.NextInspectionDate = selectedDateNextInsp;
                dst.Length = length;
                dst.Pressure = pressure;
                dst.Status = (int)cmbFilterStatus.SelectedValue;

                // Сохранение
                dbConnect.entObj.SaveChanges();
                MessageBox.Show("Данные успешно сохранены.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
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
        
        private void BtnInc_Click(object sender, RoutedEventArgs e)
        {
            if (decimal.TryParse(txbPressure.Text, out decimal value))
            {
                value += Step;
                txbPressure.Text = value.ToString("0.0");
            }
            else
            {
                MessageBox.Show("Введите корректное число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void BtnDec_Click(object sender, RoutedEventArgs e)
        {
            if (decimal.TryParse(txbPressure.Text, out decimal value))
            {
                value -= Step;
                if (value < 0) value = 0;
                txbPressure.Text = value.ToString("0.0");
            }
            else
            {
                MessageBox.Show("Введите корректное число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        private void menuBack_Click(object sender, RoutedEventArgs e) => this.NavigationService.GoBack();
    }
}
