import {
  Component,
  EventEmitter,
  OnInit,
  Output,
  ViewChild,
} from '@angular/core'
import Swal from 'sweetalert2'
import { NgbModal } from '@ng-bootstrap/ng-bootstrap'
import { DataTableDirective } from 'angular-datatables'
import { PromoService } from '../../services/promo.service'
import { LandaService } from 'src/app/core/services/landa.service'

@Component({
  selector: 'app-daftar-promo',
  templateUrl: './daftar-promo.component.html',
  styleUrls: ['./daftar-promo.component.scss'],
})
export class DaftarPromoComponent implements OnInit {
  @Output() afterSave = new EventEmitter<boolean>()
  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  listPromos: []
  dtOptions: any
  promoImage: any
  titleCard: string
  modelId: number
  isOpenForm: boolean = false

  searchParams: {
    nama?: string
    type?: string
  }

  constructor(
    private promosService: PromoService,
    private modalService: NgbModal,
    private landaService: LandaService,
  ) {}

  ngOnInit(): void {
    this.emptySearchParams()
    this.getPromo()
  }

  emptySearchParams() {
    this.searchParams = {
      nama: '',
      type: '',
    }
  }

  showImage(modal, promo) {
    this.promoImage = promo
    this.modalService.open(modal, { size: 'sm', backdrop: 'static' })
  }

  showSearch(modal) {
    this.titleCard = 'Pencarian Promo'
    this.modelId = 0
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  search() {
    this.afterSave.emit()
    this.reloadDataTable()
    this.getPromo()
  }

  getPromo() {
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
        this.promosService.getPromos(params).subscribe(
          (res: any) => {
            this.listPromos = res.data.list
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

  createPromo() {
    this.titleCard = 'Tambah Promo'
    this.modelId = 0
    this.showForm(true)
  }

  showForm(show) {
    this.isOpenForm = show
  }

  updatePromo(promoModel) {
    this.titleCard = 'Edit Promo: ' + promoModel.nama
    this.modelId = promoModel.id_promo
    this.showForm(true)
  }

  reloadDataTable(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.draw()
    })
  }

  deletePromo(promoId) {
    Swal.fire({
      title: 'Apakah kamu yakin ?',
      text:
        'Promo tidak dapat melakukan pesanan setelah kamu menghapus datanya',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#34c38f',
      cancelButtonColor: '#f46a6a',
      confirmButtonText: 'Ya, Hapus data ini !',
    }).then((result) => {
      if (result.value) {
        this.promosService.deletePromo(promoId).subscribe(
          (res: any) => {
            this.reloadDataTable()
            this.getPromo()
            this.landaService.alertSuccess('Berhasil', res.message)
          },
          (err) => {
            console.log(err)
          },
        )
      }
    })
  }
}
