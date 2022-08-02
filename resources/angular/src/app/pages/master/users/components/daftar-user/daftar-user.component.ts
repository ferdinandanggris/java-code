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

import { UserService } from '../../services/user-service.service'

@Component({
  selector: 'user-daftar',
  templateUrl: './daftar-user.component.html',
  styleUrls: ['./daftar-user.component.scss'],
})
export class DaftarUserComponent implements OnInit {
  // Datatable
  @Output() afterDel = new EventEmitter<boolean>()
  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  dtOptions: any
  titleCard : string
  listUser: any
  titleModal: string
  modelId: number
  searchModel :{
    nama ?:string
  }

  constructor(
    private userService: UserService,
    private landaService: LandaService,
    private modalService: NgbModal,
  ) {}

  ngOnInit(): void {
    this.emptySearch()
    this.getUser()
  }

  trackByIndex(index: number): any {
    return index
  }

  emptySearch(){
    this.searchModel = {
      nama : '9'
    }

  }

  getUser() {
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
          filter: JSON.stringify(this.searchModel),
          offset: dataTablesParameters.start,
          limit: dataTablesParameters.length,
          page: page,
        }
        this.userService.getUsers(params).subscribe(
          (res: any) => {
            this.listUser = res.data.list

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

  createUser(modal) {
    this.titleModal = 'Tambah User'
    this.modelId = 0
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  updateUser(modal, userModel) {
    this.titleModal = 'Edit User: ' + userModel.nama
    this.modelId = userModel.id
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  deleteUser(userId) {
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
        this.userService.deleteUser(userId).subscribe(
          (res: any) => {
            this.reloadDataTable()
            this.getUser()
            this.landaService.alertSuccess('Berhasil', res.message)
          },
          (err) => {
            console.log(err)
          },
        )
      }
    })
  }


  showSearch(modal){
    this.titleCard = 'Form Pencarian'
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  search(){
    console.log('tes');
    
    this.getUser()
    this.reloadDataTable()
  }
}
