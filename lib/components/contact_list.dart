import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListCard extends StatefulWidget {
  @override
  _ContactListCardState createState() => _ContactListCardState();
}

class _ContactListCardState extends State<ContactListCard> {
  final String font = 'ProductSans';
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
    int colorIndex = 0;
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact) {
      Color baseColor = colors[colorIndex];
      contactsColorMap[contact.displayName] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist = (contactsFiltered.length > 0 || contacts.length > 0);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.orangeAccent,
                ),
                child: TextField(
                  controller: searchController,
                  cursorColor: Colors.orangeAccent,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                    ),
                    labelText: "Search your contacts...",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusColor: Colors.orangeAccent,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                  ),
                ),
              ),
            ),
            listItemsExist == true
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: isSearching == true
                          ? contactsFiltered.length
                          : contacts.length,
                      itemBuilder: (context, index) {
                        Contact contact = isSearching == true
                            ? contactsFiltered[index]
                            : contacts[index];

                        var baseColor =
                            contactsColorMap[contact.displayName] as dynamic;

                        Color color1 = baseColor[800];
                        Color color2 = baseColor[400];
                        return ListTile(
                          title: Text(contact.displayName),
                          subtitle: Text(contact.phones.length > 0
                              ? contact.phones.elementAt(0).value
                              : ''),
                          leading: (contact.avatar != null &&
                                  contact.avatar.length > 0)
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(
                                    contact.avatar,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orangeAccent,
                                  ),
                                  child: CircleAvatar(
                                    child: Text(
                                      contact.initials(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    child: isSearching
                        ? Text('No search results to show')
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Loading...',
                                style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircularProgressIndicator(),
                            ],
                          ),
                  )
          ],
        ),
      ),
    );
  }
}
