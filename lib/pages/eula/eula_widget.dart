import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eula_model.dart';
export 'eula_model.dart';

class EulaWidget extends StatefulWidget {
  const EulaWidget({Key? key}) : super(key: key);

  @override
  _EulaWidgetState createState() => _EulaWidgetState();
}

class _EulaWidgetState extends State<EulaWidget> {
  late EulaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EulaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xfff5f5f5),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(Icons.arrow_back),
                            padding: EdgeInsets.all(8.0),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                            child: Text(
                              'ПОЛИТИКА\nКОНФИДЕНЦИАЛЬНОСТИ',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: 'Ermilov',
                                fontSize:
                                    MediaQuery.of(context).size.width < 350
                                        ? 12
                                        : 18,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                      )),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15.0)),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Text(
                    '1. Общие положения',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'ИП Мащенко А.Н. («компания», или «мы») обрабатывает и защищает персональные данные зарегистрированных и незарегистрированных пользователей Мигом – всех, кто обращается к нашему сайту и мобильным приложениям, а также связывается с Компанией по номерам телефона, указанным на сайте («пользователи», или «вы»).',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    'Предоставляя нам персональные данные, вы соглашаетесь на их обработку в соответствии с этой политикой.',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '2. Определения',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Персональные данные – любая информация, относящаяся к прямо или косвенно определённому, или определяемому физическому лицу (субъекту персональных данных).\n\nОбработка персональных данных – осуществление действий или совокупности действий в отношении персональных данных, включая сбор, запись, систематизацию, накопление, хранение, уточнение, обновление и изменение, извлечение, использование, предоставление, доступ, блокирование, удаление и уничтожение – как с использованием, так и без использования средств автоматизированной обработки данных.\n\nМы можем обрабатывать ваши данные перечисленными способами в целях, закрепленных в разделе 4 настоящей Политики. Оператор персональных данных – государственный орган, муниципальный орган, юридическое или физическое лицо, самостоятельно или совместно с другими лицами организующие и (или) осуществляющие обработку персональных данных, а также определяющие цели обработки персональных данных, состав персональных данных, подлежащих обработке, действия (операции), совершаемые с персональными данными.Компания является оператором по отношению к персональным данным, которые мы можем получить в связи с использованием вами Мигом (включая сайт и мобильные приложения).',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    '3. Какие данные мы обрабатываем',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Text(
                    'Вы предоставляете нам персональные данные, когда:\nрегистрируетесь на Мигом;\nиспользуете Мигом и услуги компании (в том числе без регистрации, например, когда вы совершаете звонки на телефонные номера, к которым подключена защита номера);\nоплачиваете услуги компании;\nподписываетесь на рассылки;\nучаствуете в мероприятиях, исследованиях и опросах;\nпишете или звоните нам (например, когда обращаетесь в поддержку или через форму для заявлений правообладателей);\nобщаетесь с другими пользователями;\nпользуетесь правами или выполняете обязанности на основании наших условий и правил:\n  - условий использования Мигом\n - договора оказания услуг.\nМы можем получить ваши персональные данные от наших партнёров в связи с исполнением договора, по которому вы являетесь стороной или выгодоприобретателем.\nВаше устройство автоматически передает технические данные: информацию, сохраненную в файлах куки (cookies), информацию о браузере и его настройках, дате и времени доступа к Мигом, адресах запрашиваемых страниц, действиях на сайте или в приложении, технических характеристиках устройства, IP-адресе и т.п.\nМы обрабатываем только общие категории персональных данных. Мы не обрабатываем биометрические персональные данные и специальные категории персональных данных.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '4. Цели обработки персональных данных',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Мы обрабатываем персональные данные пользователей Мигом следующим образом:',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color(0xff646464),
                        width: 2,
                      ),
                      verticalInside: BorderSide(
                        color: Color(0xff646464),
                        width: 2,
                      ),
                    ),
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Цели обработки',
                            style: TextStyle(
                              color: Color(0xff09090a),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SF Pro Display',
                              fontSize: 20,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Данные, которые можем обрабатывать (если применимо)',
                            style: TextStyle(
                              color: Color(0xff09090a),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SF Pro Display',
                              fontSize: 20,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Предоставление вам возможности пользоваться Мигом и услугами компании: создавать профиль, размещать объявления, оплачивать услуги, и т.п., а также, с вашего согласия – предоставлять вам возможность пользоваться услугами наших партнёров. Обеспечение стабильной работы и безопасности Мигом, улучшение пользовательского опыта, качества услуг и маркетинговых мероприятий. Предупреждение и пресечение нарушения законодательства, Условий использования Мигом и других наших правил и условий, в том числе защита пользователей от мошеннических и иных недобросовестных действий. Выполнение обязанностей, предусмотренных законодательством (например, для бухгалтерского учёта, налоговой отчётности, ответов на запросы государственных органов)',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Фамилия, имя, отчество, номер телефона, адрес электронной почты, учетная запись социальной сети, ИНН ИП, адрес, сведения о платежах, паспортные данные, данные водительского удостоверения, фото-, видеоизображение, сведения, подтверждающие ваши полномочия или указанную вами информацию, иные сведения, указанные вами в связи с использованием сервисов Мигом или наших партнеров, записи разговоров, сведения, собираемые метрическими программами',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Предоставление ответов на ваши обращения',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Фамилия, имя, отчество, номер телефона, адрес электронной почты, адрес',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Организация вашего участия в мероприятиях, исследованиях и опросах компании и наших партнеров',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Фамилия, имя, отчество, номер телефона, адрес электронной почты, должность, место работы; фото-, видеоизображение, если мероприятие проходит очно или по видеосвязи',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Если вы обращаетесь к нам как представитель государственного органа или СМИ, мы обрабатываем данные, указанные в обращении (фамилия, имя, отчество, адрес электронной почты, номер телефона, должность, место работы) в целях выполнения обязанностей, предусмотренных законодательством, и ответа на ваше обращение. Если вы обращаетесь к нам как правообладатель, мы обрабатываем данные, указанные в обращении (фамилия, имя, отчество, адрес электронной почты, номер телефона, паспортные данные, сведения, подтверждающие наличие исключительного права и ваши полномочия) в целях выполнения обязанностей, предусмотренных законодательством, и ответа на ваше обращение.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '5. Правовые основания обработки',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Мы обрабатываем ваши персональные данные:с вашего согласия. Вы даёте согласие на обработку ваших персональных данных при регистрации и каждом случае входа на Мигом, а также в процессе использования Мигом. Например, когда вы выполняете инструкции в интерфейсах Мигом, нажимаете на специальные кнопки, продолжаете звонок или совершаете иные действия. Вы даете согласие на 1 год с даты удаления вашего профиля на Мигом либо, если вы являетесь незарегистрированным пользователем, - с даты достижения цели обработки персональных данных.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '6. Передача третьим лицам',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Мы можем передавать персональные данные или поручать их обработку третьим лицам, если это необходимо для предоставления вам сервисов Мигом либо, в случае предоставления иных сервисов – с вашего отдельного согласия. Мы можем передать ваши персональные данные нашим партнёрам, которые участвуют в предоставлении вам тех или иных сервисов, а также государственным органам, если мы обязаны предоставить им ваши персональные данные в соответствии с законом.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '7. Размещение данных на Мигом',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Когда вы публикуете на Мигом объявления, отзывы или информацию в своём профиле, персональные данные в составе такой информации становятся доступными неопределённому кругу лиц. Вы раскрываете такие данные самостоятельно без предоставления нам как оператору персональных данных отдельного согласия. Компания не распространяет ваши персональные данные. Мы обрабатываем такие данные в целях исполнения договора с вами, заключенного по вашей инициативе. Цель, с которой пользователи размещают данные на Мигом – установить контакт с потенциальным покупателем (клиентом, работодателем), который заинтересован в заключении сделки по объявлению. Пользователи не вправе обрабатывать данные других пользователей для любых иных целей. Это означает, что:\nвы не можете звонить или отправлять сообщения пользователям, чтобы предлагать свои товары или услуги;\nВы не можете копировать данные пользователей, чтобы размещать их на других сервисах;\nвы не можете использовать информацию пользователей Мигом в целях скоринга.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '8. Безопасность',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Ответственное отношение к персональным данным – стандарт работы компании.\n\nДля защиты персональных данных мы:\nиздали и опубликовали на сайте политику обработки данных. Утвердили локальные акты по вопросам обработки и защиты персональных данных. Работники знакомятся с этими документами в свой первый день в компании.\nназначили лицо, ответственное за организацию обработки персональных данных.\nпроводим тренинги для работников по теме персональных данных.\nрегулярно проверяем процессы и документы компании на их соответствие закону.\nоцениваем риски и вред, который можем причинить, если нарушим закон о персональных данных. С учетом проведенной оценки подбираем подходящие меры для соблюдения закона.\nпредоставляем доступ к персональным данным только тем сотрудникам Компании, которым он действительно необходим для выполнения обязанностей.\nприменяем правовые, организационные и технические меры, чтобы обеспечить безопасность персональных данных.\nПринимая меры по защите персональных данных, мы основываемся на:\nтребованиях законодательства;\nустановленном уровне защищенности персональных данных;\nактуальных угрозах, определенных моделью угроз;\nбазовом наборе мер защиты, установленном нормативными правовыми актами для соответствующего уровня защищенности;\nриск-ориентированном подходе при выборе оптимальных мер;\nприоритете законных интересов пользователей.\nКомпания соответствует требованиям стандарта PCI DSS, что подтверждает полученный нами сертификат. Ваши данные надёжно защищены.\n',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '9. Хранение персональных данных',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Мы осуществляем запись, систематизацию, накопление, хранение, уточнение (обновление, изменение), извлечение ваших персональных данных с использованием баз данных, находящихся на территории России. Для хранения данных мы используем центры обработки данных, находящиеся на территории г. Москва. Мы храним ваши данные в соответствии со сроками обработки данных, необходимыми для достижения целей обработки, указанных в разделе 4 настоящей Политики.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '10. Сроки обработки данных',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Мы прекращаем обработку ваших персональных данных в сроки, установленные законом: по достижении целей обработки, указанных в разделе 4 настоящей Политики, либо при утрате необходимости в их достижении (если нет других оснований для обработки, предусмотренных законодательством). Например, для выполнения возложенных на нас обязанностей, предупреждения и пресечения нарушений законов, наших правил, защиты пользователей от мошеннических и иных недобросовестных действий, а также для предоставления ответов на обращения, мы должны обрабатывать данные в течение сроков, определенных в соответствии с законодательством (процессуальным, налоговым, гражданским, о бухгалтерском учете, пр.). Такие цели, как предоставление возможности пользоваться сервисами Мигом, обеспечение стабильной работы и безопасности сервисов, улучшение пользовательского опыта, качества сервисов, услуг и маркетинговых мероприятий, направление маркетинговых сообщений, будут достигнуты при прекращении обязательств, вытекающих из договоров с нами. по истечении срока согласия или при отзыве согласия (если нет других оснований для обработки, предусмотренных законодательством). Например, в случае обработки для рассмотрения организации участия в мероприятиях, исследованиях и опросах. Также мы прекратим обработку ваших данных:\nпри выявлении неправомерной обработки, если обеспечить правомерность невозможно;\nпри ликвидации компании.\nПо истечении установленных сроков, мы автоматически удаляем данные из информационных систем. Если данные обрабатываются без использования средств автоматической обработки (например, бумажные обращения) – уничтожаем такие материальные носители.\n',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '11. Удаление профиля на Мигом',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Чтобы удалить ваш профиль на Мигом и все данные в нем, войдите в раздел «Настройки» на сайте или в приложении – «Удаление профиля» – «Удалить». Если у вас подключен тариф или есть деньги на кошельке Мигом, для удаления профиля обратитесь в службу поддержки; если есть незавершенные сделки – подождите их завершения. Мы прекратим обработку ваших персональных данных и удалим их в соответствии с требованиями российского законодательства. Мы не сможем восстановить ваши данные, даже если позже вы передумаете. Закон требует, чтобы мы хранили информацию о пользователе как минимум в течение года после удаления профиля.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '12. Как отозвать согласие на обработку персональных данных',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Чтобы отозвать согласие на обработку персональных данных или получить информацию по вопросам персональных данных, обратитесь в службу поддержки.',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    '13. Наши реквизиты',
                    style: TextStyle(
                      color: Color(0xff09090a),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'ИП Мащенко А.Н.\nmigom.inc@gmail.com',
                    style: TextStyle(
                      color: Color(0xff646464),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
