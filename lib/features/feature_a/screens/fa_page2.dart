import 'package:counter_provider_eg/app/controller/provider/app_provider.dart';
import 'package:counter_provider_eg/features/feature_a/controller/event/fa_increase_counter_event.dart';
import 'package:counter_provider_eg/features/feature_a/controller/model/FeatureACounter.dart';
import 'package:counter_provider_eg/features/feature_a/controller/provider/feature_a_provider.dart';
import 'package:counter_provider_eg/features/feature_a/screens/fa_page3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaPage2 extends StatelessWidget {
  static const String routeName = "/fa/page2";

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    FeatureAProvider fap = appProvider.featureProviderFactory.currentFeatureProvider as FeatureAProvider;
    //FeatureAProvider fap = Provider.of<FeatureAProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature A - Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'In FA-Page 1, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureACounter>(
              stream: fap.store.p1CounterStateStream,

                /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureACounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text(
              'In FA-Page 2, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureACounter>(
              stream: fap.store.p2CounterStateStream,

              /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureACounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text(
              'In FA-Page 3, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureACounter>(
              stream: fap.store.p3CounterStateStream,

              /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureACounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FaPage3.routeName);
                },
                child: const Text("Next")
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          fap.emitEvent(FaP2IncreaseCounterEvent(1));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}