import 'package:rafeeqa/core/model/vaccination_model.dart';

const List<VaccinationModel> vaccinations = [
  // ================= At birth =================
  VaccinationModel(
    id: 1,
    name: "Hepatitis B (first 24 hours)",
    age: 0,
    routeOfAdministration: "Injection",
    reason: "Protects against viral hepatitis B.",
    nameAr: "التهاب الكبد B (أول 24 ساعة)",
    routeOfAdministrationAr: "حقنة",
    reasonAr: "الوقاية من التهاب الكبد الفيروسي B.",
  ),
  VaccinationModel(
    id: 2,
    name: "BCG (Tuberculosis)",
    age: 0,
    routeOfAdministration: "Intradermal injection",
    reason: "Protects against severe forms of tuberculosis in children.",
    nameAr: "BCG (الدرن)",
    routeOfAdministrationAr: "حقنة داخل الجلد",
    reasonAr: "الوقاية من أشكال الدرن الخطيرة لدى الأطفال.",
  ),
  VaccinationModel(
    id: 3,
    name: "Sabin zero (OPV 0)",
    age: 0,
    routeOfAdministration: "Oral drops",
    reason: "Protects against polio.",
    nameAr: "سابين صفر",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "الوقاية من شلل الأطفال.",
  ),

  // ================= 2 months =================
  VaccinationModel(
    id: 4,
    name: "Pentavalent (1st dose)",
    age: 2,
    routeOfAdministration: "Injection",
    reason:
        "Protects against diphtheria, whooping cough (pertussis), tetanus, hepatitis B and Haemophilus influenzae type b.",
    nameAr: "الخماسي (الجرعة الأولى)",
    routeOfAdministrationAr: "حقنة",
    reasonAr:
        "الوقاية من الدفتيريا والسعال الديكي والتيتانوس والتهاب الكبد B وعدوى المستدمية النزلية B.",
  ),
  VaccinationModel(
    id: 5,
    name: "Sabin (OPV)",
    age: 2,
    routeOfAdministration: "Oral drops",
    reason: "Protects against polio.",
    nameAr: "سابين",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "الوقاية من شلل الأطفال.",
  ),
  VaccinationModel(
    id: 6,
    name: "Salk (IPV) (1st dose)",
    age: 2,
    routeOfAdministration: "Injection",
    reason: "Protects against polio.",
    nameAr: "سولك (الجرعة الأولى)",
    routeOfAdministrationAr: "حقنة",
    reasonAr: "الوقاية من شلل الأطفال.",
  ),

  // ================= 4 months =================
  VaccinationModel(
    id: 7,
    name: "Pentavalent (2nd dose)",
    age: 4,
    routeOfAdministration: "Injection",
    reason:
        "Completes the primary doses and strengthens immunity against diphtheria, whooping cough, tetanus, hepatitis B and Haemophilus influenzae type b.",
    nameAr: "الخماسي (الجرعة الثانية)",
    routeOfAdministrationAr: "حقنة",
    reasonAr:
        "استكمال الجرعات الأساسية وتقوية المناعة ضد الدفتيريا والسعال الديكي والتيتانوس والتهاب الكبد B وعدوى المستدمية النزلية B.",
  ),
  VaccinationModel(
    id: 8,
    name: "Sabin (OPV)",
    age: 4,
    routeOfAdministration: "Oral drops",
    reason: "Completes the primary doses and strengthens immunity against polio.",
    nameAr: "سابين",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "استكمال الجرعات الأساسية وتقوية المناعة ضد شلل الأطفال.",
  ),
  VaccinationModel(
    id: 9,
    name: "Salk (IPV) (2nd dose)",
    age: 4,
    routeOfAdministration: "Injection",
    reason: "Completes the primary doses and strengthens immunity against polio.",
    nameAr: "سولك (الجرعة الثانية)",
    routeOfAdministrationAr: "حقنة",
    reasonAr: "استكمال الجرعات الأساسية وتقوية المناعة ضد شلل الأطفال.",
  ),

  // ================= 6 months =================
  VaccinationModel(
    id: 10,
    name: "Pentavalent (3rd dose)",
    age: 6,
    routeOfAdministration: "Injection",
    reason:
        "Completes the primary doses and strengthens immunity against diphtheria, whooping cough, tetanus, hepatitis B and Haemophilus influenzae type b.",
    nameAr: "الخماسي (الجرعة الثالثة)",
    routeOfAdministrationAr: "حقنة",
    reasonAr:
        "استكمال الجرعات الأساسية وتقوية المناعة ضد الدفتيريا والسعال الديكي والتيتانوس والتهاب الكبد B وعدوى المستدمية النزلية B.",
  ),
  VaccinationModel(
    id: 11,
    name: "Sabin (OPV)",
    age: 6,
    routeOfAdministration: "Oral drops",
    reason: "Completes the primary doses and strengthens immunity against polio.",
    nameAr: "سابين",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "استكمال الجرعات الأساسية وتقوية المناعة ضد شلل الأطفال.",
  ),
  VaccinationModel(
    id: 12,
    name: "Salk (IPV) (3rd dose)",
    age: 6,
    routeOfAdministration: "Injection",
    reason: "Completes the primary doses and strengthens immunity against polio.",
    nameAr: "سولك (الجرعة الثالثة)",
    routeOfAdministrationAr: "حقنة",
    reasonAr: "استكمال الجرعات الأساسية وتقوية المناعة ضد شلل الأطفال.",
  ),

  // ================= 9 months =================
  VaccinationModel(
    id: 13,
    name: "Sabin (OPV)",
    age: 9,
    routeOfAdministration: "Oral drops",
    reason: "Boosts protection against polio.",
    nameAr: "سابين",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "تعزيز الحماية ضد شلل الأطفال.",
  ),

  // ================= 12 months =================
  VaccinationModel(
    id: 14,
    name: "Sabin (OPV)",
    age: 12,
    routeOfAdministration: "Oral drops",
    reason: "Protects against polio.",
    nameAr: "سابين",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "الوقاية من شلل الأطفال.",
  ),
  VaccinationModel(
    id: 15,
    name: "MMR (1st dose)",
    age: 12,
    routeOfAdministration: "Injection",
    reason: "Protects against measles, mumps and rubella (German measles).",
    nameAr: "MMR (الجرعة الأولى)",
    routeOfAdministrationAr: "حقنة",
    reasonAr: "الوقاية من الحصبة والنكاف والحصبة الألماني.",
  ),

  // ================= 18 months =================
  VaccinationModel(
    id: 16,
    name: "Sabin (OPV) (booster)",
    age: 18,
    routeOfAdministration: "Oral drops",
    reason: "Booster dose to strengthen protection against polio.",
    nameAr: "سابين (جرعة تنشيطية)",
    routeOfAdministrationAr: "نقط بالفم",
    reasonAr: "جرعة تنشيطية لتعزيز الحماية ضد شلل الأطفال.",
  ),
  VaccinationModel(
    id: 17,
    name: "MMR (booster)",
    age: 18,
    routeOfAdministration: "Injection",
    reason:
        "Booster dose to strengthen protection against measles, mumps and rubella (German measles).",
    nameAr: "MMR (جرعة تنشيطية)",
    routeOfAdministrationAr: "حقنة",
    reasonAr:
        "جرعة تنشيطية لتعزيز الحماية ضد الحصبة والنكاف والحصبة الألماني.",
  ),
  VaccinationModel(
    id: 18,
    name: "DTP - triple bacterial vaccine (booster)",
    age: 18,
    routeOfAdministration: "Injection",
    reason:
        "Booster dose to strengthen protection against diphtheria, tetanus and whooping cough.",
    nameAr: "الثلاثي البكتيري (جرعة تنشيطية)",
    routeOfAdministrationAr: "حقنة",
    reasonAr:
        "جرعة تنشيطية لتعزيز الحماية ضد الدفتيريا والتيتانوس والسعال الديكي.",
  ),
];