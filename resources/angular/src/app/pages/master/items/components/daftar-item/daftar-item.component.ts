import {
  Component,
  EventEmitter,
  OnInit,
  Output,
  ViewChild,
} from '@angular/core'
import { NgbModal } from '@ng-bootstrap/ng-bootstrap'
import Swal from 'sweetalert2'

import { LandaService } from 'src/app/core/services/landa.service'
import { ItemService } from '../../services/item.service'
import { DataTableDirective } from 'angular-datatables'

@Component({
  selector: 'item-daftar',
  templateUrl: './daftar-item.component.html',
  styleUrls: ['./daftar-item.component.scss'],
})
export class DaftarItemComponent implements OnInit {
  // Datatable
  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  @Output() afterSave = new EventEmitter<boolean>()
  dtOptions: any
  listItems: []
  titleCard: string
  modelId: number
  isOpenForm: boolean = false
  searchParams: {
    nama?: string
    kategori?: string
    min_harga?: number
    max_harga?: number
    is_available?: number
  }

  constructor(
    private itemService: ItemService,
    private landaService: LandaService,
    private modalService: NgbModal,
  ) {}

  ngOnInit(): void {
    this.getItem()
    this.emptySearchParams()
  }

  emptySearchParams() {
    this.searchParams = {
      nama: '',
      kategori: '',
      is_available: -1,
    }
  }

  trackByIndex(index: number): any {
    return index
  }

  search() {
    // this.emptySearchParams()
    // this.searchParams.nama = ''
    this.afterSave.emit()
    this.reloadDataTable()
    this.getItem()
  }

  getItem() {
    this.dtOptions = {
      serverSide: true,
      processing: true,
      ordering: false,
      searching: false,
      pageLength: 5,

      pagingType: 'full_numbers',
      ajax: (dataTablesParameters: any, callback) => {
        const page =
          parseInt(dataTablesParameters.start) /
            parseInt(dataTablesParameters.length) +
          1
        const params = {
          filter: JSON.stringify(this.searchParams || {}),
          offset: dataTablesParameters.start,
          limit: dataTablesParameters.length,
          page: page,
          pageLength: 20,
        }
        this.itemService.getItems(params).subscribe(
          (res: any) => {
            this.listItems = res.data.list
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

  reloadDataTable(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.draw()
    })
  }

  showForm(show) {
    this.isOpenForm = show
  }

  showSearch(modal) {
    this.titleCard = 'Pencarian Item'
    this.modelId = 0
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  createItem() {
    this.titleCard = 'Tambah Item'
    this.modelId = 0
    this.showForm(true)
  }

  updateItem(itemModel) {
    this.titleCard = 'Edit Item: ' + itemModel.nama
    this.modelId = itemModel.id
    this.showForm(true)
  }

  deleteItem(userId) {
    Swal.fire({
      title: 'Apakah kamu yakin ?',
      text: 'Item tidak dapat melakukan pesanan setelah kamu menghapus datanya',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#34c38f',
      cancelButtonColor: '#f46a6a',
      confirmButtonText: 'Ya, Hapus data ini !',
    }).then((result) => {
      if (result.value) {
        this.itemService.deleteItem(userId).subscribe(
          (res: any) => {
            this.reloadDataTable()
            this.getItem()
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
