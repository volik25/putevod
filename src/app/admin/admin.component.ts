import { Component, OnInit, ViewChild } from '@angular/core';
import { ApiService } from '../services/api.service';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { Question } from '../models/questions';
import { Observable, of, Subscription } from 'rxjs';
import { LoadingService } from '../services/loading.service';
import { AlertService } from '../services/alert.service';
import { AlertType, PutevodAlertComponent } from '../alert/alert.component';

@Component({
  selector: 'admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.less']
})
export class AdminComponent implements OnInit {

  alert:PutevodAlertComponent;

  subs: Subscription = new Subscription();
  addForm:FormGroup;
  description = '';
  questions: Question[];
  item: Question;
  public Editor = ClassicEditor;
  public config = {
    language: 'ru',
    toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ]
  };
  public model = {
    editorData: this.description
  };
  constructor(private api: ApiService, private auth: AuthService, private router: Router, private fb: FormBuilder, 
              private loadingService: LoadingService, private as: AlertService) { }

  ngOnInit() {
    this.as.alert = this.alert;
    // this.as.alert.showAlert({
    //   type: AlertType.Warning,
    //   message: 'Страница загружена'
    // });
    this.initForm();
  }

  public initForm(){
    const subs = this.api.getQuestions().subscribe(questions => {
      this.questions = questions;
      this.loadingService.removeSubscription(subs);
    });
    this.addForm = this.fb.group({
      question:[null, Validators.required],
      answer:[null, Validators.required],
      img: [null],
      isFAQ: [false],
      isFAQuestion: [null]
    })
    this.loadingService.addSubscription(subs);
  }

  public setForm(id){
    if (id == 0) {
      this.addForm.reset();
      this.item = null;
    }
    else{
      this.item = this.questions.find(x => x.id == id);
      this.addForm.patchValue(this.item);
    }
  }

  public onReady( editor ) {
    editor.ui.getEditableElement().parentElement.insertBefore(
        editor.ui.view.toolbar.element,
        editor.ui.getEditableElement()
    );
  }

  removeImg() {
    this.addForm.get('img').setValue(null);
  }

  isUploadFileShown() {
    const value = this.addForm.get('img').value;
    return !value || value instanceof File;
  }

  save(){
    const form = this.addForm.getRawValue();
    this.subs = this.uploadImg(form.img).subscribe((data) => {
      form.img = data;
      if (this.item) {
        form.id = this.item.id;
        form.oldImg = this.item.img;
        const subscription = this.api.updateQuestion(form).subscribe(() => {
          delete form.oldImg;
          for (let i = 0; i < this.questions.length; i++) {
            if (this.questions[i].id == form.id) {
              this.questions[i] = form;
            }
          }
          this.loadingService.removeSubscription(subscription);
          // this.as.alert.showAlert({
          //   type: AlertType.Info,
          //   message: 'Вопрос обновлен'
          // })
        });
        this.loadingService.addSubscription(subscription);
      } else {
        const subscription = this.api.addQuestion(form).subscribe((id) => {
          this.initForm();
          this.loadingService.removeSubscription(subscription);
          // this.as.alert.showAlert({
          //   type: AlertType.Success,
          //   message: 'Вопрос добавлен'
          // })
        });
        this.loadingService.addSubscription(subscription);
      }
      this.loadingService.removeSubscription(this.subs);
    });
    this.loadingService.addSubscription(this.subs);
  }

  removeQuestion(id, img){
    const subscription = this.api.removeQuestion({id: id, filelink: img}).subscribe(() => {
      this.initForm();
      this.item = null;
      this.loadingService.removeSubscription(subscription);
      // this.as.alert.showAlert({
      //   type: AlertType.Success,
      //   message: 'Вопрос удален'
      // })
    });
    this.loadingService.addSubscription(subscription);
  }

  uploadImg(img): Observable<string> {
    if (img instanceof File) {
      const formData = new FormData();
      formData.append('qImage', img, img.name.replace(' ', '_'));
      return this.api.uploadImg(formData);
    } else {
      return of(img);
    }
  }

  public exit() {
    this.auth.exit();
    this.router.navigate(['/enter-form']);
  }

}
