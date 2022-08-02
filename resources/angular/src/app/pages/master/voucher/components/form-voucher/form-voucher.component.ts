import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  SimpleChange,
} from '@angular/core'
import * as moment from 'moment'
import { Moment } from 'moment'
import { LandaService } from 'src/app/core/services/landa.service'
import { PromoService } from '../../../promo/services/promo.service'
import { UserService } from '../../../users/services/user-service.service'
import { VoucherService } from '../../services/voucher.service'

@Component({
  selector: 'app-form-voucher',
  templateUrl: './form-voucher.component.html',
  styleUrls: ['./form-voucher.component.scss'],
})
export class FormVoucherComponent implements OnInit {
  @Input() voucherId: number

  @Output() afterSave = new EventEmitter<boolean>()
  mode: string
  listUser: []
  listPromoByVoucher: []
  formModel: {
    promo?: {
      id_promo?: number
      nama?: string
      fotoUrl?: string
      nominal?: number
      kadaluarsa?: number
    }
    user?: {
      id?: number
      nama?: string
    }
    id_diskon?: number
    nominal?: number
    info_voucher: string
    periode_mulai?: string
    periode_selesai?: string
    type?: number
    status: any
    catatan?: string
    id_promo?: number
    id_user?: number
  }

  public daterange: any = {}
  public options: any = {
    locale: { format: 'YYYY-MM-DD' },
    alwaysShowCalendars: false,
    singleDatePicker: true,
    showDropdowns: true,
    opens: 'left',
  }

  constructor(
    private voucherService: VoucherService,
    private userService: UserService,
    private promoService: PromoService,
    private landaService: LandaService,
  ) {}

  ngOnInit(): void {
    this.getUsers()
    this.getPromoByVoucher()
  }
  ngOnChanges(changes: SimpleChange) {
    this.emptyForm()
  }

  getVoucher(id) {
    this.voucherService.getVoucherById(id).subscribe(
      (res: any) => {
        this.formModel = res.data
        this.formModel.status = res.data.status.toString()
        console.log(res.data)
      },
      (err) => {
        console.log(err)
      },
    )
  }

  emptyForm() {
    this.mode = 'add'
    this.formModel = {
      promo: {
        nama: '',
        nominal: 0,
        fotoUrl: 'assets/img/no-image.png',
      },
      user: {
        nama: '',
      },
      info_voucher: 'test',
      type: 0,
      status: '0',
      nominal: 0,
      catatan: '',
      periode_mulai: moment().format('YYYY-MM-DD'),
    }
    if (this.voucherId > 0) {
      this.mode = 'edit'
      this.getVoucher(this.voucherId)
    }
  }

  back() {
    this.afterSave.emit()
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

  getPromoByVoucher() {
    const params = {
      filter: JSON.stringify({ type: 'voucher' }),
    }
    this.promoService.getPromos(params).subscribe(
      (res: any) => {
        this.listPromoByVoucher = res.data.list
      },
      (err) => {
        console.log(err)
      },
    )
  }

  showPromo(fotoUrl, nominal, kadaluarsa) {
    this.formModel.promo.fotoUrl = fotoUrl
    this.formModel.promo.nominal = nominal
    this.formModel.promo.kadaluarsa = kadaluarsa
    this.formModel.nominal = nominal
  }

  showUser(userId) {
    this.formModel.user.id = userId
  }

  addDays(periode_mulai, kadaluarsa: number) {
    var futureDate = moment(periode_mulai)
      .add(kadaluarsa, 'days')
      .format('YYYY-MM-DD')
    return futureDate
  }

  save() {
    try {
      let date = this.addDays(
        this.formModel.periode_mulai,
        this.formModel.promo.kadaluarsa,
      )

      this.formModel.periode_selesai = date
      this.formModel.id_promo = this.formModel.promo.id_promo
      this.formModel.id_user = this.formModel.user.id
      // console.log(this.formModel)

      if (this.mode == 'add') {
        this.voucherService.createVoucher(this.formModel).subscribe(
          (res: any) => {
            this.landaService.alertSuccess('Berhasil', res.message)
            this.afterSave.emit()
          },
          (err) => {
            this.landaService.alertError('Mohon Maaf', err.error.errors)
          },
        )
      } else {
        this.voucherService.updateVoucher(this.formModel).subscribe(
          (res: any) => {
            this.landaService.alertSuccess('Berhasil', res.message)
            this.afterSave.emit()
          },
          (err) => {
            this.landaService.alertError('Mohon Maaf', err.error.errors)
          },
        )
      }
    } catch (error) {
      this.landaService.alertError('Mohon Maaf', 'Isi Form dengan benar!')
    }
  }

  selectedDate(value: any, datepicker?: any) {
    this.formModel.periode_mulai = moment(value.start._d).format('YYYY-MM-DD')
  }
}
