import { Component, OnInit } from '@angular/core';
import { Client } from 'src/app/core/model/client.model';
import { ClientDaoService } from 'src/app/core/services/dao/client-dao.service';

@Component({
  selector: 'app-create',
  templateUrl: './create.page.html',
  styleUrls: ['./create.page.scss'],
})
export class CreatePage implements OnInit {

  client = new Client();

  constructor(private clientDAO: ClientDaoService) { }

  ngOnInit() {
  }

  createClient(): void {
    this.clientDAO.create(this.client);
  }

}
