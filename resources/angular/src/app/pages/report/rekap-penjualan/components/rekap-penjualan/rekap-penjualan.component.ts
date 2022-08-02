import { Component, OnInit } from '@angular/core'
import * as moment from 'moment'
import { ItemService } from 'src/app/pages/master/items/services/item.service'
import { UserService } from 'src/app/pages/master/users/services/user-service.service'
import { RekapPenjualanService } from '../../services/rekap-penjualan.service'

@Component({
  selector: 'app-rekap-penjualan',
  templateUrl: './rekap-penjualan.component.html',
  styleUrls: ['./rekap-penjualan.component.scss'],
})
export class RekapPenjualanComponent implements OnInit {
  listDay: any
  listRekapPenjualan: any
  listMonth: any
  listYear: any
  listUser: any
  listItem: any
  searchModel: {
    bulan?: any
    tahun?: any
    id_bulan?: number
    id_tahun?: number
    id_user?: number
    id_item?: number
  }
  constructor(
    private rekapPenjualanService: RekapPenjualanService,
    private userService: UserService,
    private itemService: ItemService,
  ) {}

  ngOnInit(): void {
    this.emptySearch()
    this.getUser()
    this.getMonths()
    this.getYear()
    this.getData()
    this.getItem()
  }

  emptySearch() {
    this.searchModel = {
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
      filter: JSON.stringify(this.searchModel),
    }

    this.rekapPenjualanService.getRekapPenjualan(params).subscribe(
      (res: any) => {
        this.listRekapPenjualan = res.data
        console.log(res.data)
      },
      (err: any) => {
        console.log(err)
      },
    )
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

  getUser() {
    this.userService.getUsers([]).subscribe(
      (res: any) => {
        this.listUser = res.data.list
      },
      (err) => {
        console.log(err)
      },
    )
  }

  getItem() {
    this.itemService.getItems([]).subscribe(
      (res: any) => {
        this.listItem = res.data.list
      },
      (err) => {
        console.log(err)
      },
    )
  }

  refreshData() {
    this.getData()
    this.searchModel.bulan = this.listMonth[this.searchModel.id_bulan - 1]
  }

  generatePdf() {
    const params = {
      data: JSON.stringify({
        listRekapPenjualan: this.listRekapPenjualan,
        type: 'penjualan',
        periode: {
          tahun: this.searchModel.id_tahun,
          bulan: this.searchModel.bulan.nama,
        },
      }),
    }
    this.rekapPenjualanService.generatePDF(params).subscribe(
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
        listRekapPenjualan: this.listRekapPenjualan,
        jmlHari: this.listDay,
        type: 'penjualan',
        periode: {
          tahun: this.searchModel.id_tahun,
          bulan: this.searchModel.bulan.nama,
        },
      }),
    }
    this.rekapPenjualanService.generateExcel(params).subscribe(
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
