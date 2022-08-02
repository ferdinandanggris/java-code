import {
  Component,
  EventEmitter,
  OnInit,
  Output,
  ViewChild,
} from '@angular/core'
import { NgbModal } from '@ng-bootstrap/ng-bootstrap'
import { DataTableDirective } from 'angular-datatables'
import { LandaService } from 'src/app/core/services/landa.service'
import Swal from 'sweetalert2'
import { PromoService } from '../../../promo/services/promo.service'
import { UserService } from '../../../users/services/user-service.service'
import { VoucherService } from '../../services/voucher.service'
import * as moment from 'moment'
@Component({
  selector: 'app-daftar-voucher',
  templateUrl: './daftar-voucher.component.html',
  styleUrls: ['./daftar-voucher.component.scss'],
})
export class DaftarVoucherComponent implements OnInit {
  @Output() afterSave = new EventEmitter<boolean>()
  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  dtOptions: any
  titleCard: string
  modelId: number
  listUser: []
  listPromoByVoucher: []
  listVoucher: []
  isOpenForm: boolean = false
  filters: {
    promo?: string
    rentang_waktu?: string
    status?: number
  }
  searchParams: {
    promo?: {
      id_promo?: any
      nama?: string
    }
    user?: {
      id?: any
      nama?: string
    }
    id_promo?: number
    id_user?: number
    id_diskon?: number
    nominal?: number
    periode_mulai?: string
    periode_selesai?: string
    type?: number
  }
  public daterange: any = {}
  public options: any = {
    locale: { format: 'YYYY-MM-DD' },
    alwaysShowCalendars: false,
  }

  constructor(
    private voucherService: VoucherService,
    private landaService: LandaService,
    private userService: UserService,
    private modalService: NgbModal,
    private promoService: PromoService,
  ) {}

  ngOnInit(): void {
    this.emptyForm()
    this.getPromoByVoucher()
    this.getVoucher()
    this.getUsers()
  }

  selectedDate(value: any, datepicker?: any) {
    this.searchParams.periode_mulai = moment(value.start._d).format(
      'YYYY-MM-DD',
    )
    this.searchParams.periode_selesai = moment(value.end._d).format(
      'YYYY-MM-DD',
    )
  }

  emptyForm() {
    this.searchParams = {
      promo: {
        id_promo: 0,
        nama: '',
      },
      user: {
        id: 0,
        nama: '',
      },
      periode_mulai: '',
      periode_selesai: '',
    }
  }

  getVoucher() {
    this.dtOptions = {
      serverSide: true,
      processing: true,
      ordering: false,
      searching: false,
      pagingType: 'full_numbers',
      ajax: (dataTablesParameters: any, callback) => {
        const page =
          parseInt(dataTablesParameters.start) /
            parseInt(dataTablesParameters.length) +
          1
        const params = {
          filter: JSON.stringify(this.searchParams),
          offset: dataTablesParameters.start,
          limit: dataTablesParameters.length,
          page: page,
        }
        this.voucherService.getVouchers(params).subscribe(
          (res: any) => {
            this.listVoucher = res.data.list
            console.log(res.data.list)

            callback({
              recordsTotal: res.data.meta.total,
              recordsFiltered: res.data.meta.total,
              data: [],
            })
          },
          (err: any) => {
            console.log(err)
          },
        )
      },
    }
  }

  createVoucher() {
    this.titleCard = 'Tambah Voucher'
    this.modelId = 0
    this.showForm(true)
  }

  updateVoucher(voucherModel) {
    this.titleCard = 'Edit Voucher: '
    this.modelId = voucherModel.id_voucher
    this.showForm(true)
  }

  showForm(show) {
    this.isOpenForm = show
  }

  reloadDataTable(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.draw()
    })
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

  deleteVoucher(id) {
    Swal.fire({
      title: 'Apakah kamu yakin ?',
      text: 'User ini tidak dapat login setelah kamu menghapus datanya',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#34c38f',
      cancelButtonColor: '#f46a6a',
      confirmButtonText: 'Ya, Hapus data ini !',
    }).then((result) => {
      if (result.value) {
        this.voucherService.deleteVoucher(id).subscribe(
          (res: any) => {
            this.reloadDataTable()
            this.getVoucher()
            this.landaService.alertSuccess('Berhasil', res.message)
          },
          (err) => {
            console.log(err)
          },
        )
      }
    })
  }

  showSearch(modal) {
    this.titleCard = 'Pencarian Voucher'
    this.modelId = 0
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  setSearchUser(userId) {
    this.searchParams.id_user = userId
  }

  setSearchPromo(promoId) {
    this.searchParams.id_promo = promoId
  }
  search() {
    console.log(this.searchParams)
    this.afterSave.emit()
    this.reloadDataTable()
    this.getUsers()
  }
}
