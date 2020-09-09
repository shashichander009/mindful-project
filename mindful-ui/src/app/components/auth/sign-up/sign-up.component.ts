import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, AbstractControl, FormGroup } from '@angular/forms';


@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {
  currentPage = 1;

  userPicture: string = ''

  signUpForm = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    username: ['', [Validators.required, Validators.minLength(2)]],
    dateOfBirth: ['', Validators.required],
    passwords: this.formBuilder.group({
      password: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]]
    }, { validator: this.matchPassword }),
    profilePicture: [''],
    name: [''],
    bio: [''],
  })

  constructor(private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.setDefaultPicture()
  }

  get email() { return this.signUpForm.get('email')?.value }
  get username() { return this.signUpForm.get('username')?.value }
  get password() { return this.signUpForm.get('password')?.value }
  get confirmPassword() { return this.signUpForm.get('confirmPassword')?.value }

  matchPassword(f: FormGroup) {
    let password = f.get('password')?.value
    let confirmPassword = f.get('confirmPassword')?.value
    return password === confirmPassword ? null : { notSame: true }
  }

  onFormSubmit() {
    console.log(this.signUpForm.value)
  }

  changePage(page: number) {
    console.log(page)
    this.currentPage = page
  }

  setDefaultPicture() {
    this.userPicture = 'https://www.pinkvilla.com/files/styles/contentpreview/public/iron-man-star-robert-downey-jr-best-film.jpg'
  }

  showPreview(event: any) {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]);
      reader.onload = (e: any) => this.userPicture = e.target.result;
      // this.imageService.selectedImage$.next(event.target.files[0] as File);
    } else {
      // this.setImage();
      // this.imageService.selectedImage$.next(null);
      this.setDefaultPicture()
    }
  }

}
