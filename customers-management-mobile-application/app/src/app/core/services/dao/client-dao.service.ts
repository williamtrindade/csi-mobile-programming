import { Injectable } from '@angular/core';
import { Client } from 'src/app/core/model/client.model';

@Injectable({
  providedIn: 'root'
})
export class ClientDaoService {

  constructor() { }

  create(client: Client): void {
    console.log(client);
  }
}
