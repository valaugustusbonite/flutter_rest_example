import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rest_api/api/user.api.dart';
import 'package:rest_api/model/user.dart';
import 'package:rest_api/modules/components/user_card.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userAPIService = UserAPIService();
    final _data = useState<List<User>>([]);
    final _isLoading = useState(false);

    _getUsers() async {
      _isLoading.value = true;
      try {
        final returnedData = await userAPIService.getUsers();
        _data.value = returnedData;
      } catch (e) {
        throw Exception(e);
      }
      _isLoading.value = false;
    }

    useEffect(() {
      _getUsers();

      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            if (_isLoading.value) {
              return const CircularProgressIndicator();
            }
            if (!_isLoading.value && _data.value.isEmpty) {
              return const Text('No Items');
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _data.value.length,
                      itemBuilder: (context, index) {
                        final items = _data.value;
                        return UserCard(
                          user: items[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }
}