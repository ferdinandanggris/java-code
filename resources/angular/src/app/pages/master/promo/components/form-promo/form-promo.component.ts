import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  SimpleChange,
} from '@angular/core'
import { NgbModal } from '@ng-bootstrap/ng-bootstrap'
import { LandaService } from 'src/app/core/services/landa.service'
import { PromoService } from '../../services/promo.service'

@Component({
  selector: 'app-form-promo',
  templateUrl: './form-promo.component.html',
  styleUrls: ['./form-promo.component.scss'],
})
export class FormPromoComponent implements OnInit {
  @Input() promoId: number
  @Output() afterSave = new EventEmitter<boolean>()
  @Output() afterDel = new EventEmitter<boolean>()
  formModel: {
    id_promo: number
    nama: string
    type: string
    diskon?: number
    nominal?: number
    kadaluarsa: number
    syarat_ketentuan: string
    foto?: string
    fotoUrl?: string
  }
  mode: string
  imgSrc: any

  constructor(
    private modalService: NgbModal,
    private promoService: PromoService,
    private landaService: LandaService,
  ) {}

  ngOnInit(): void {}
  ngOnChanges(changes: SimpleChange) {
    this.emptyForm()
  }

  emptyForm() {
    this.mode = 'add'
    this.formModel = {
      id_promo: 0,
      nama: '',
      type: 'diskon',
      kadaluarsa: 1,
      syarat_ketentuan: '',
      fotoUrl: 'assets/img/no-image.png',
    }

    if (this.promoId > 0) {
      this.mode = 'edit'
      this.getPromo(this.promoId)
    }
  }

  resetType(type) {
    if (type === 'diskon') {
      this.formModel.nominal = 0
    } else {
      this.formModel.diskon = 0
    }
  }

  getPromo(id) {
    this.promoService.getPromoById(id).subscribe(
      (res: any) => {
        this.formModel = res.data
        console.log(res.data)
      },
      (err) => {
        console.log(err)
      },
    )
  }

  back() {
    this.afterSave.emit()
  }

  save() {
    if (typeof this.imgSrc !== undefined) {
      this.formModel.foto = this.imgSrc
    } else {
      this.imgSrc = ''
    }
    if (this.mode == 'add') {
      this.promoService.createPromo(this.formModel).subscribe(
        (res: any) => {
          this.landaService.alertSuccess('Berhasil', res.message)
          this.afterSave.emit()
        },
        (err) => {
          this.landaService.alertError('Mohon Maaf', err.error.errors)
        },
      )
    } else {
      this.promoService.updatePromo(this.formModel).subscribe(
        (res: any) => {
          this.landaService.alertSuccess('Berhasil', res.message)
          this.afterSave.emit()
        },
        (err) => {
          this.landaService.alertError('Mohon Maaf', err.error.errors)
        },
      )
    }
  }

  readURL(event: any) {
    if (event.target.files && event.target.files[0]) {
      const file = event.target.files[0]
      const reader = new FileReader()
      reader.onload = (e) => (this.imgSrc = reader.result)

      reader.readAsDataURL(file)
    }
  }
}
