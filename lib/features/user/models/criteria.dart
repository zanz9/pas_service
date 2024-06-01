class ICriteria {
  IProfessional professional = IProfessional();
  IPersonal personal = IPersonal();
  IBusiness business = IBusiness();
  IIntegral integral = IIntegral();

  fromFirestore(Map<String, dynamic> data) {
    professional = professional.fromFirestore(data['professional'] ?? {});
    personal = personal.fromFirestore(data['personal'] ?? {});
    business = business.fromFirestore(data['business'] ?? {});
    integral = integral.fromFirestore(data['integral'] ?? {});

    return this;
  }

  toFirestore() {
    return {
      'professional': professional.toFirestore(),
      'personal': personal.toFirestore(),
      'business': business.toFirestore(),
      'integral': integral.toFirestore(),
    };
  }
}

class IProfessional {
  double knowledge = 0;
  double ability = 0;
  double skills = 0;
  double experience = 0;
  double qualification = 0;
  double resultOfWork = 0;

  IProfessional();

  fromFirestore(Map<String, dynamic> data) {
    knowledge = data['knowledge'] ?? 0;
    ability = data['ability'] ?? 0;
    skills = data['skills'] ?? 0;
    experience = data['experience'] ?? 0;
    qualification = data['qualification'] ?? 0;
    resultOfWork = data['result of work'] ?? 0;

    return this;
  }

  toFirestore() {
    return {
      'knowledge': knowledge,
      'ability': ability,
      'skills': skills,
      'experience': experience,
      'qualification': qualification,
      'result of work': resultOfWork,
    };
  }

  getAVG() {
    return (knowledge +
            ability +
            skills +
            experience +
            qualification +
            resultOfWork) /
        6;
  }
}

class IPersonal {
  double theAbilityToSelfEsteem = 0;
  double morality = 0;
  double honesty = 0;
  double justice = 0;
  double psychologicalStability = 0;

  IPersonal();

  fromFirestore(Map<String, dynamic> data) {
    theAbilityToSelfEsteem = data['the ability to self-esteem'] ?? 0;
    morality = data['morality'] ?? 0;
    honesty = data['honesty'] ?? 0;
    justice = data['justice'] ?? 0;
    psychologicalStability = data['psychological stability'] ?? 0;

    return this;
  }

  toFirestore() {
    return {
      'the ability to self-esteem': theAbilityToSelfEsteem,
      'morality': morality,
      'honesty': honesty,
      'justice': justice,
      'psychological stability': psychologicalStability,
    };
  }

  getAVG() {
    return (theAbilityToSelfEsteem +
            morality +
            honesty +
            justice +
            psychologicalStability) /
        5;
  }
}

class IBusiness {
  double organization = 0;
  double responsibility = 0;
  double initiative = 0;
  double enterprise = 0;

  IBusiness();

  fromFirestore(Map<String, dynamic> data) {
    organization = data['organization'] ?? 0;
    responsibility = data['responsibility'] ?? 0;
    initiative = data['initiative'] ?? 0;
    enterprise = data['enterprise'] ?? 0;

    return this;
  }

  toFirestore() {
    return {
      'organization': organization,
      'responsibility': responsibility,
      'initiative': initiative,
      'enterprise': enterprise,
    };
  }

  getAVG() {
    return (organization + responsibility + initiative + enterprise) / 4;
  }
}

class IIntegral {
  double authority = 0;
  double culture = 0;
  double thinking = 0;
  double speech = 0;

  IIntegral();

  fromFirestore(Map<String, dynamic> data) {
    authority = data['authority'] ?? 0;
    culture = data['culture'] ?? 0;
    thinking = data['thinking'] ?? 0;
    speech = data['speech'] ?? 0;

    return this;
  }

  toFirestore() {
    return {
      'authority': authority,
      'culture': culture,
      'thinking': thinking,
      'speech': speech,
    };
  }

  getAVG() {
    return (authority + culture + thinking + speech) / 4;
  }
}
