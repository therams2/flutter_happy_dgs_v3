part of 'widgets.dart';

class BtnTarifas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10 ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon( Icons.monetization_on, color: Colors.black87 ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Tariffs()
                );
          },
        ),
      ),
    );
  }
}

class Tariffs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPets(),
        builder: (BuildContext context, AsyncSnapshot<TariffResponse> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }else{
            return  _ListaTarifas(snapshot.data!.tariffs);
          }
        },
    );
  }

  Future<TariffResponse> getPets() async {

    final uri = Uri.parse('${ Environment.apiUrl }/tariff/data');
    final resp = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json'
        });
    return tariffResponseFromJson(resp.body);
  }
}

class _ListaTarifas extends StatelessWidget {
  final List<Tariff> tarifas;
  _ListaTarifas(this.tarifas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tarifas.length,
        itemBuilder: (BuildContext context, int i){
          final tarifa = tarifas[i];
          print(tarifa);
          return ListTile(
            title: Text("${tarifa.name}"),
            subtitle: Text("${tarifa.description}"),
            trailing: Text("${tarifa.alias}")
          );
        });
  }
}

