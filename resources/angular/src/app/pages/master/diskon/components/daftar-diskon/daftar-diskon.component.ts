import { Component, OnInit, ViewChild } from '@angular/core'
import { DataTableDirective } from 'angular-datatables'
import { LandaService } from 'src/app/core/services/landa.service'
import { PromoService } from '../../../promo/services/promo.service'
import { UserService } from '../../../users/services/user-service.service'
import { DiskonService } from '../../services/diskon.service'

@Component({
  selector: 'app-daftar-diskon',
  templateUrl: './daftar-diskon.component.html',
  styleUrls: ['./daftar-diskon.component.scss'],
})
export class DaftarDiskonComponent implements OnInit {
  listDiskon: []
  listUser: []
  listHeader: []

  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  dtOptions: any
  constructor(
    private diskonService: DiskonService,
    private userService: UserService,
    private promoService: PromoService,
    private landaService: LandaService,
  ) {}

  ngOnInit(): void {
    this.getDiskons()
    this.getPromo()
  }

  getUsers() {
    this.userService.getUsers([]).subscribe(
      (res: any) => {
        this.listUser = res.data.list
      },
      (err: any) => {
        console.log(err)
      },
    )
  }

  updateDiskon(userId, promoId, status, diskonId, event) {
    if (diskonId == 0) {
      this.diskonService
        .createDiskon({ id_user: userId, id_promo: promoId, status: 1 })
        .subscribe(
          (res: any) => {
            diskonId = res.data.id_diskon
            this.landaService.alertSuccess('Berhasil', res.message)
            this.getDiskons()
          },
          (err) => {
            this.landaService.alertError('Mohon Maaf', err.error.errors)
          },
        )
    } else {
      if (status == 1) {
        this.diskonService
          .updateDiskon({ id_diskon: diskonId, status: 0 })
          .subscribe(
            (res: any) => {
              this.landaService.alertSuccess('Berhasil', res.message)
              this.getDiskons()
            },
            (err) => {
              this.landaService.alertError('Mohon Maaf', err.error.errors)
            },
          )
      } else {
        this.diskonService
          .updateDiskon({ id_diskon: diskonId, status: 1 })
          .subscribe(
            (res: any) => {
              this.landaService.alertSuccess('Berhasil', res.message)
            },
            (err) => {
              this.landaService.alertError('Mohon Maaf', err.error.errors)
            },
          )
      }
    }
  }

  getDiskonById(id) {
    this.diskonService.getDiskonById(id).subscribe((res: any) => {})
  }

  getDiskons() {
    const params = {
      filter: JSON.stringify([]),
    }
    this.diskonService.getDiskons(params).subscribe(
      (res: any) => {
        this.listDiskon = res.data.list
      },
      (err: any) => {
        console.log(err)
      },
    )
  }

  getPromo() {
    const params = {
      filter: JSON.stringify({ type: 'diskon' }),
    }
    this.promoService.getPromos(params).subscribe(
      (res: any) => {
        this.listHeader = res.data.list
      },
      (err: any) => {
        console.log(err)
      },
    )
  }
}
