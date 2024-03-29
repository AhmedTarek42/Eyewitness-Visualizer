import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1C23),
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFA2A2B5),
              )),
          title: const Text(
            'Settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFA2A2B5),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0.09,
              letterSpacing: 0.20,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Container(
                    width: width * 0.2 ,
                    height: height * 0.1,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.2 ,
                          height: height * 0.1,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Avatar.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('John Doe',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    'j.doe@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA2A2B5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 0.20,
                    ),
                  ),
                   SizedBox(
                    height: height / 60,
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'General',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.89,
                    height: height * 0.15,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/FaceID.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Profile picture',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 109,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/iCloud.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 167,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.89,
                    height: height * 0.2,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Sorting.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'First Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 132,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Chart.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Last Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 134,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/PhoneCall.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 162,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 33, bottom: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Security',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.91,
                    height: height * 0.15,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0x334E4E61),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x26CFCFFC)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/AppIcon.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 137,
                            ),
                            const Text(
                              'Edit',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/LightTheme.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Delete your account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.10,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              'Permanently',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFA2A2B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 0.11,
                                letterSpacing: 0.20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFFA2A2B5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
