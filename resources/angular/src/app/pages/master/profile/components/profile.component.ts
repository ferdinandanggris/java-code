import { Component, EventEmitter, Output, OnInit } from '@angular/core'
import { Router } from '@angular/router'
import { Breadcrumb, BreadcrumbComponent } from 'angular-crumbs'
import { LandaService } from 'src/app/core/services/landa.service'
import { AuthService } from 'src/app/pages/auth/services/auth.service'
import { UserService } from '../../users/services/user-service.service'

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})
export class ProfileComponent implements OnInit {
  @Output() afterSave = new EventEmitter<boolean>()

  //Model user
  formModel: {
    id?: number
    nama: string
    email: string
    fotoUrl: string
    akses?: string[]
    password?: string
    foto?: any
    confirmPassword?: string
  }

  profileModel: any

  // variable imgSrc untuk menyimpan base64
  imgSrc: any
  // variabel oldEmail untuk menyimpan email lama
  oldEmail: any
  // variable passMatch untuk menyimpan status password valid
  passMatch: boolean = false

  constructor(
    private userService: UserService,
    private authService: AuthService,
    private landaService: LandaService,
    private router: Router,
  ) {}

  ngOnInit(): void {
    // pengisian object formModel untuk pencegahan undefined
    this.formModel = {
      nama: '',
      email: '',
      fotoUrl: '',
      password: '',
      confirmPassword: '',
    }
    this.getProfile()
  }

  getUserById(data) {
    this.userService.getUserById(data.id).subscribe((user: any) => {
      this.formModel = {
        id: user.data.id,
        nama: user.data.nama,
        email: user.data.email,
        fotoUrl: user.data.fotoUrl,
        akses: user.data.akses,
      }

      this.oldEmail = {
        email: user.data.email,
      }
    })
  }

  getProfile() {
    this.authService.getProfile().subscribe((data) => {
      this.getUserById(data)
    })
  }

  update() {
    this.passwordChecker()
    if (this.passMatch) {
      if (typeof this.imgSrc !== undefined) {
        this.formModel.foto = this.imgSrc
      } else {
        this.imgSrc = ''
      }
      console.log(this.formModel.confirmPassword)
      this.userService.updateUser(this.formModel).subscribe(
        (res: any) => {
          this.landaService.alertSuccess('Berhasil', res.message)
          this.afterSave.emit()
          this.authService.logout()
          this.router.navigate(['auth/login'])
        },
        (err) => {
          this.landaService.alertError('Mohon Maaf', err.error.errors)
        },
      )
    }
  }

  // Check password valid
  passwordChecker() {
    this.authService
      .login(this.oldEmail, this.formModel.confirmPassword)
      .subscribe(
        (res: any) => {
          this.passMatch = true
        },
        (err: any) => {
          this.landaService.alertError(
            'Mohon Maaf',
            'Password yang anda masukkan salah!',
          )
          this.passMatch = false
        },
      )
  }

  // Generate image ke Base64
  readURL(event: any) {
    if (event.target.files && event.target.files[0]) {
      const file = event.target.files[0]
      const reader = new FileReader()
      reader.onload = (e) => (this.imgSrc = reader.result)

      reader.readAsDataURL(file)
    }
  }
}
