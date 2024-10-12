// lang/translations.dart
enum TranslationKey {
  areyousure,
  delete,
  welcome,
  name,
  ziwei,
  bazi,
  sex,
  bd,
  time,
   edit,
  enterUname,
  pickatime,
  enterUrBd,
  cancel,
  addnewMember,
  unselected,
  
  // Add more keys as needed
}

const Map<TranslationKey, String> translationsEn = {
  TranslationKey.delete: 'delete',
  TranslationKey.areyousure: 'Are you sure?',
  TranslationKey.bazi: 'Bazi',
  TranslationKey.ziwei: 'Ziwei',
  TranslationKey.name: 'Name: ',
  TranslationKey.sex: 'Sex',
  TranslationKey.bd: 'B-day',
  TranslationKey.time: 'Time',
  TranslationKey.edit: 'Edit',
  TranslationKey.pickatime: 'Birth Time',
  TranslationKey.enterUname: 'Your name',
  TranslationKey.enterUrBd: 'Enter Bday',
  TranslationKey.addnewMember: 'Add New Member',
  TranslationKey.unselected: 'Unselected',
  TranslationKey.cancel: 'Cancel',
};

const Map<TranslationKey, String> translationsZh = {
  TranslationKey.delete: '刪除',
  TranslationKey.welcome: '欢迎',
  TranslationKey.bazi: '八字',
  TranslationKey.areyousure: '確定刪除此人?',
  TranslationKey.ziwei: '紫薇',
  TranslationKey.sex: '性別',
  TranslationKey.bd: '生日',
  TranslationKey.time: '時間',

  TranslationKey.name: '姓名: ',
  TranslationKey.edit: '更改資料',
  TranslationKey.enterUname: '請輸入姓名',
  TranslationKey.enterUrBd: '請輸入生日',
  TranslationKey.pickatime: '出生時間',
  TranslationKey.cancel: '取消',
   TranslationKey.addnewMember: '加新資料',
   TranslationKey.unselected: '還未選',
 
};

// Function to get translation based on the selected language
String translate(TranslationKey key, bool isEnglish) {
  final translation = isEnglish ? translationsEn[key] : translationsZh[key];
  return translation ??
      'Translation not found'; // Default text if translation is missing
}
