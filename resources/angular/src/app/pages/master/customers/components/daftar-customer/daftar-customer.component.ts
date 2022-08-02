import { Component, OnInit, ViewChild } from '@angular/core'
import { NgbModal } from '@ng-bootstrap/ng-bootstrap'
import { DataTableDirective } from 'angular-datatables'
import { LandaService } from 'src/app/core/services/landa.service'
import Swal from 'sweetalert2'
import { CustomerService } from '../../services/customer.service'

@Component({
  selector: 'customer-daftar',
  templateUrl: './daftar-customer.component.html',
  styleUrls: ['./daftar-customer.component.scss'],
})
export class DaftarCustomerComponent implements OnInit {
  // Datatable
  @ViewChild(DataTableDirective) dtElement: DataTableDirective
  dtInstance: Promise<DataTables.Api>
  dtOptions: any
  listCustomer: []
  titleModal: string
  modelId: number
  titleCard : string
  searchModel : {
    nama ?: string
  }

  constructor(
    private customerService: CustomerService,
    private landaService: LandaService,
    private modalService: NgbModal,
  ) {}

  ngOnInit(): void {
    this.emptySearch()
    this.getCustomer()
  }

  trackByIndex(index: number): any {
    return index
  }

  emptySearch(){
    this.searchModel ={
      nama : ''
    }
  }

  getCustomer() {
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
        }
        this.customerService.getCustomers(params).subscribe(
          (res: any) => {
            this.listCustomer = res.data.list
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
    // this.customerService.getCustomers([]).subscribe((res: any) => {
    //     this.listCustomer = res.data.list;
    // }, (err: any) => {
    //     console.log(err);
    // });
  }

  createCustomer(modal) {
    this.titleModal = 'Tambah Customer'
    this.modelId = 0
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  updateCustomer(modal, customerModel) {
    this.titleModal = 'Edit Customer: ' + customerModel.nama
    this.modelId = customerModel.id
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  deleteCustomer(userId) {
    Swal.fire({
      title: 'Apakah kamu yakin ?',
      text:
        'Customer tidak dapat melakukan pesanan setelah kamu menghapus datanya',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#34c38f',
      cancelButtonColor: '#f46a6a',
      confirmButtonText: 'Ya, Hapus data ini !',
    }).then((result) => {
      if (result.value) {
        this.customerService.deleteCustomer(userId).subscribe(
          (res: any) => {
            this.landaService.alertSuccess('Berhasil', res.message)
            this.getCustomer()
          },
          (err) => {
            console.log(err)
          },
        )
      }
    })
  }

  reloadDataTable(): void {
    this.dtElement.dtInstance.then((dtInstance: DataTables.Api) => {
      dtInstance.draw()
    })
  }

  showSearch(modal){
    this.titleCard = 'Form Pencarian'
    this.modalService.open(modal, { size: 'lg', backdrop: 'static' })
  }

  search(){
    console.log('tes');
    
    this.getCustomer()
    this.reloadDataTable()
  }
}
