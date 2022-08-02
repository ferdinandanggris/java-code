import { Component, OnInit } from '@angular/core'
import * as moment from 'moment'
import { PenjualanMenuService } from '../../services/penjualan-menu.service'

@Component({
  selector: 'app-penjualan-menu',
  templateUrl: './penjualan-menu.component.html',
  styleUrls: ['./penjualan-menu.component.scss'],
})
export class PenjualanMenuComponent implements OnInit {
  listPenjualanMenu: []
  listGrandTotal: []
  dateLength: number
  listMonth: any
  listDay: any
  listYear: any
  searchParam: {
    kategori: string
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

  constructor(private penjualanMenuService: PenjualanMenuService) {}

  ngOnInit(): void {
    this.getMonths()
    this.getYear()
    this.emptySearch()
    this.getDaysArrayByMonth(
      moment(
        this.searchParam.id_tahun + '-' + this.searchParam.id_bulan,
      ).format('YYYY-MM'),
    )
    this.getData()
  }

  emptySearch() {
    this.searchParam = {
      kategori: 'all',
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
  }

  getData() {
    const params = {
      filter: JSON.stringify(this.searchParam),
    }

    this.penjualanMenuService.getPenjualanMenu(params).subscribe(
      (res: any) => {
        console.log(res.data)

        this.listGrandTotal = res.data[0]
        res.data.shift()
        this.listPenjualanMenu = res.data
        console.log(res.data)
      },
      (err: any) => {
        console.log(err)
      },
    )
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

  showByKategori(kategori) {
    this.searchParam.kategori = kategori
    this.getData()
  }
  refreshData() {
    this.searchParam.bulan = this.listMonth[this.searchParam.id_bulan - 1]
    this.getDaysArrayByMonth(
      moment(
        this.searchParam.id_tahun + '-' + this.searchParam.id_bulan,
      ).format('YYYY-MM'),
    )
    this.getData()
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

  generatePdf() {
    const params = {
      data: JSON.stringify({
        listPenjualanMenu: this.listPenjualanMenu,
        listGrandTotal: this.listGrandTotal,
        jmlHari: this.listDay,
        type: 'menu',
        periode: {
          tahun: this.searchParam.id_tahun,
          bulan: this.searchParam.bulan.nama,
        },
      }),
    }
    this.penjualanMenuService.generatePDF(params).subscribe(
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
        listPenjualanMenu: this.listPenjualanMenu,
        listGrandTotal: this.listGrandTotal,
        jmlHari: this.listDay,
        type: 'menu',
        periode: {
          tahun: this.searchParam.id_tahun,
          bulan: this.searchParam.bulan.nama,
        },
      }),
    }
    this.penjualanMenuService.generateExcel(params).subscribe(
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
