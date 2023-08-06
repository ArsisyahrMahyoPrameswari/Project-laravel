@extends('layouts.main')

@section('content')

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Checkout Confirm</h3></div>
                    <div class="card-body">
                        <h3 class="font-weight-light my-4">Silahkan dilengkapi lokasi pengiriman barang :</h3>
                        <hr>                       
                        <h5 class="font-weight-light my-4">atau hub. 08813581249 </h5>
                        <hr>
                        <h5 class="font-weight-light my-4">No. Nota : {{$nota}} </h5>

                        <form action="{{ route('transaction.confirm_checkout') }}" method="POST">
                        @csrf
                            <input type="hidden" name="nota" value="{{$nota}}">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="namaPengirim" type="text" name="an_nama" placeholder="Enter your first name" required />
                                        <label for="inputFirstName">Nama Pengirim</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">                                      
                                        <select class="form-control" name="metode" id="metode" required>
                                            <option value="" disabled selected> Pilih</option>
                                            <option value="transfer"> Transfer Rekening</option>
                                            <option value="cod"> COD</option>
                                        </select>
                                        <label for="metode">Metode Pembayaran</label>
                                    </div>
                                </div>
                            </div>             
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input class="form-control" id="inputFirstName" type="text" name="alamat" placeholder="Enter your first name" required />
                                        <label for="inputFirstName">Alamat Lengkap Pengirim</label>
                                    </div>
                                </div>                                
                            </div>                           
                            <div class="mt-4 mb-0">
                                <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Proses</button></div>
                            </div>
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</main>

@endsection