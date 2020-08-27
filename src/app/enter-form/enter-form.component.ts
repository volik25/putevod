import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { ApiService } from '../services/api.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'enter-form',
  templateUrl: './enter-form.component.html',
  styleUrls: ['./enter-form.component.less']
})
export class EnterFormComponent implements OnInit {
  @Input() modal = false;
  @Output() closed: EventEmitter<any> = new EventEmitter<any>();
  public enterForm: FormGroup;
  public showError: boolean;
  constructor( private auth: AuthService, private api: ApiService,
              private loadingService: LoadingService, private router: Router,
              private fb: FormBuilder, private activeModal: NgbActiveModal) {
    this.enterForm = this.fb.group({
      login: [null, [Validators.required]],
      password: [null, [Validators.required]],
    });
  }

  ngOnInit(): void {
  }

  public onEnterClick(): void {
    this.showError = false;
    if (this.enterForm.invalid) {
      for (let value of Object.values(this.enterForm.controls)) {
        if (value.invalid) {
          value.markAsDirty();
        }
      }
      return;
    }
    const subs = this.api.signIn(this.enterForm.getRawValue()).subscribe(
      (token) => {
        if (token) {
          this.auth.setToken(token);
          this.router.navigate(['/admin']);
        } else {
          this.showError = true;
        }
        this.loadingService.removeSubscription(subs);
      }
    )
    this.loadingService.addSubscription(subs);
  }
}
