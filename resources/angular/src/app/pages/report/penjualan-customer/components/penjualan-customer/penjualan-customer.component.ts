import { Component, OnInit } from '@angular/core'
import { PenjualanCustomerService } from '../../services/penjualan-customer.service'
import * as moment from 'moment'
import { UserService } from 'src/app/pages/master/users/services/user-service.service'
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast'

@Component({
  selector: 'app-penjualan-customer',
  templateUrl: './penjualan-customer.component.html',
  styleUrls: ['./penjualan-customer.component.scss'],
})
export class PenjualanCustomerComponent implements OnInit {
  constructor(
    private penjualanCustomerService: PenjualanCustomerService,
    private userService: UserService,
  ) {}
  listPenjualanCustomer: []
  listGrandTotal: []
  listDay: any
  listMonth: any
  listYear: any
  listUser: any
  dateLength: number
  formModel: {
    user?: []
    bulan?: {
      nama?: any
      value?: number
    }
    tahun?: {
      value?: number
    }
    id_bulan?: number
    id_tahun?: number
  }

  searchModel: {
    bulan?: number
    tahun?: number
  }

  ngOnInit(): void {
    this.emptyForm()
    this.getData()
    this.getYear()
    this.getUsers()
    this.getDaysArrayByMonth(
      moment(this.formModel.id_tahun + '-' + this.formModel.id_bulan).format(
        'YYYY-MM',
      ),
    )
  }

  emptyForm() {
    this.formModel = {
      user: [],
      bulan: {
        nama: moment().format('MMMM'),
        value: moment().add(1, 'M').month(),
      },
      tahun: {
        value: moment().year(),
      },
      id_bulan: moment().add(1, 'M').month(),
      id_tahun: moment().year(),
    }

    this.searchModel = {
      tahun: 0,
      bulan: 0,
    }

    this.listMonth = [
      {
        nama: 'Januari',
        value: 1,
      },
      {
        nama: 'Februari',
        value: 2,
      },
      {
        nama: 'Maret',
        value: 3,
      },
      {
        nama: 'April',
        value: 4,
      },
      {
        nama: 'Mei',
        value: 5,
      },
      {
        nama: 'Juni',
        value: 6,
      },
      {
        nama: 'Juli',
        value: 7,
      },
      {
        nama: 'Agustus',
        value: 8,
      },
      {
        nama: 'September',
        value: 9,
      },
      {
        nama: 'Oktober',
        value: 10,
      },
      {
        nama: 'November',
        value: 11,
      },
      {
        nama: 'Desember',
        value: 12,
      },
    ]
  }

  getYear() {
    let yearNow = moment().year()
    this.listYear = [
      {
        value: yearNow - 2,
      },
      {
        value: yearNow - 1,
      },
      {
        value: yearNow,
      },
      {
        value: yearNow + 1,
      },
      {
        value: yearNow + 2,
      },
    ]
  }

  getData() {
    const params = {
      filter: JSON.stringify(this.formModel),
    }
    console.log(params)

    this.penjualanCustomerService.getPenjualanCustomer(params).subscribe(
      (res: any) => {
        this.listGrandTotal = res.data[0]
        this.listPenjualanCustomer = res.data[1]
        console.log(this.listGrandTotal)
      },
      (err: any) => {
        console.log(err)
      },
    )
  }

  refreshData() {
    this.getData()
    this.formModel.bulan = this.listMonth[this.formModel.id_bulan - 1]
    this.getDaysArrayByMonth(
      moment(this.formModel.id_tahun + '-' + this.formModel.id_bulan).format(
        'YYYY-MM',
      ),
    )
  }

  getMonths() {
    this.listMonth = [
      {
        nama: 'Januari',
        value: 1,
      },
      {
        nama: 'Februari',
        value: 2,
      },
      {
        nama: 'Maret',
        value: 3,
      },
      {
        nama: 'April',
        value: 4,
      },
      {
        nama: 'Mei',
        value: 5,
      },
      {
        nama: 'Juni',
        value: 6,
      },
      {
        nama: 'Juli',
        value: 7,
      },
      {
        nama: 'Agustus',
        value: 8,
      },
      {
        nama: 'September',
        value: 9,
      },
      {
        nama: 'Oktober',
        value: 10,
      },
      {
        nama: 'November',
        value: 11,
      },
      {
        nama: 'Desember',
        value: 12,
      },
    ]
  }

  getDaysArrayByMonth(date) {
    var daysInMonth = moment(date, 'YYYY-MM').daysInMonth()
    this.dateLength = daysInMonth
    var arrDays = []
    var current = 0
    while (daysInMonth) {
      current++
      arrDays.push(current)
      daysInMonth--
    }
    this.listDay = arrDays
  }

  getUsers() {
    this.userService.getUsers([]).subscribe(
      (res: any) => {
        this.listUser = res.data.list
      },
      (err) => {
        console.log(err)
      },
    )
  }

  showUser(id) {
    console.log(this.formModel)
  }

  generatePdf() {
    const params = {
      data: JSON.stringify({
        listPenjualanCustomer: this.listPenjualanCustomer,
        listGrandTotal: this.listGrandTotal,
        jmlHari: this.listDay,
        type: 'customer',
        periode: {
          tahun: this.formModel.id_tahun,
          bulan: this.formModel.bulan.nama,
        },
      }),
    }
    this.penjualanCustomerService.generatePDF(params).subscribe(
      (res) => {
        var file = new Blob([res], { type: 'application/pdf' })
        var fileURL = URL.createObjectURL(file)
        window.open(fileURL)
        var a = document.createElement('a')
        a.href = fileURL
        a.target = '_blank'
        document.body.appendChild(a)
        a.click()
      },
      (error) => {
        console.log('getPDF error: ', error)
      },
    )
  }

  generateExcel() {
    const params = {
      data: JSON.stringify({
        listPenjualanCustomer: this.listPenjualanCustomer,
        listGrandTotal: this.listGrandTotal,
        jmlHari: this.listDay,
        type: 'customer',
        periode: {
          tahun: this.formModel.id_tahun,
          bulan: this.formModel.bulan.nama,
        },
      }),
    }
    this.penjualanCustomerService.generateExcel(params).subscribe(
      (res) => {
        var file = new Blob([res], {
          type:
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;',
        })
        var fileURL = URL.createObjectURL(file)
        window.open(fileURL)
        var a = document.createElement('a')
        a.href = fileURL
        a.target = '_blank'
        document.body.appendChild(a)
        a.click()
      },
      (error) => {
        console.log('getPDF error: ', error)
      },
    )
  }
}
