<h1>#Requirement<br></h1>
1. flutter version 3.13.0<br>
<br>
<h1>#Instalasi</h1><br>
1. flutter doctor<br>
2. flutter pub get<br>
<h1>#Build APK</h1><br>
1. flutter build apk --release<br>
<h1>Struktur Aplikasi</h1>
Saya menggunakan clean code<br>
1. app ( semua program ada di dalam folder app )<br>
2. config ( base url dan name apps )<br>
3. data ( models dan juga providers (providers itu adalah untuk code pemanggilan API))<br>
4. middleware ( kondisi sudah login atau belum )<br>
5. modules ( disini ada view, bindings, dan controllers ) -> dibuat permodule<br>
6. routes ( untuk pengaturan page dan juga contorller (Routingnya))<br>
7. utils ( didalam folder ini ada local storage dan juga color resources )<br>
8. widgets ( splash screen dan atribut lainnya )
9. code utama ada di Main.dart