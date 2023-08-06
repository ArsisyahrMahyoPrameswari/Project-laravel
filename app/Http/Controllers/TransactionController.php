<?php

namespace App\Http\Controllers;

use App\Models\Trans;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class TransactionController extends Controller
{
    public function index(){

        $trans = Trans::all();

        return view('cart.list_transaction', compact('trans'));
    }

    public function checkout(){
        $user_id = auth()->user()->id;
        $cartItems = \Cart::getContent();
        $nota = $this->getNota();

        if($cartItems){          
            foreach($cartItems as $cart){
                Order::updateOrCreate(
                    ['nota' =>$nota,'user_id'=>$user_id,'product_id'=>$cart->id],
                    [                        
                        'harga_satuan' => $cart->price,
                        'jumlah_barang' => $cart->quantity,
                        'harga_total' => $cart->price *  $cart->quantity,
                    ]);       

               
            }
        }

        \Cart::clear();
        return view('cart.checkout', compact('nota'));
    }

    public function confirm_checkout(Request $request){
        $user_id = auth()->user()->id;
        
        $rnota = $request->nota;
        //dd($nota);

        $order = Order::where('nota',$rnota)->get();
        $nominal = 0;
       
        if($order){          
            foreach($order as $odr){
                $nominal = $nominal + $odr->harga_total;               
            }
            Trans::updateOrCreate(
                ['nota' =>$rnota,'user_id'=>$user_id,],
                [                        
                    'tglPembayaran' => null,
                    'metode' => $request->metode,
                    'nominal' => $nominal,
                    'alamat' => $request->alamat,
                    'an_nama' => $request->an_nama,
                    'status' => 'pending'
                ]);       
        }

           
        return redirect()->route('transaction.payment',['nota'=>$rnota])->with('success', 'Confirm Check Out Berhasil');
    }

     public function payment(Request $request){
        $user_id = auth()->user()->id;
        
        $nota = $request->nota ? $request->nota:'';    
        
        return view('cart.payment', compact('nota'));
    }

    public function confirm_payment(Request $request){
        $user_id = auth()->user()->id;        
        $rqnota = $request->nota ? $request->nota:'';     
        $trans = Trans::where('nota',$rqnota)->first();

        $status = ($request->status)? $request->status : $trans->status;       
        $fileName = ($trans->image !=null)? $trans->image:null;
        
       
        if($rqnota){          

            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $destinationPath = public_path('uploads/payment');
                $fileName = uniqid() . '.' . $file->getClientOriginalExtension();
                $file->move($destinationPath, $fileName);    }
                
            Trans::updateOrCreate(
                ['nota' =>$rqnota,'user_id'=>$user_id,],
                [                        
                    'tglPembayaran' => Carbon::now(),                   
                    'status' => $status,
                    'image' => $fileName
                ]);       
        }

           
        return redirect()->route('transaction.index')->with('success', 'Confirm Check Out Berhasil');
    }

     public function destroy(Request $request){
        $nota = $request->nota;
        $trans = Trans::where('nota',$nota)->first();
        $trans->delete();

        return redirect()->route('transaction.index');
    }

    private function getNota(){
        $nota = '';
        do  {              
            $nota = 'BT-'.substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 10);            
            return $nota;    
        } 
        while (! Order::where('nota',$nota)->count() > 0);        
    }
}
