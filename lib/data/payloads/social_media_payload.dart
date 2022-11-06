library about_me_payload;

import 'package:rennan_portifolio/data/model/social_media.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';

List<SocialMedia> listSocialMedias = const [
  SocialMedia(
    imagePath: ManagerPath.iconWpp,
    url:
        "https://api.whatsapp.com/send?phone=+5592992674798&text=Ol%C3%A1%20Rennan%20tudo%20bem?%20eu%20encontrei%20o%20seu%20contato%20pelo%20seu%20site%20de%20portf%C3%B3lio.",
  ),
  SocialMedia(
    imagePath: ManagerPath.iconEmail,
    url: "mailto:julio.rennan.developer@gmail.com",
  ),
  SocialMedia(
    imagePath: ManagerPath.iconLinkedin,
    url: "https://www.linkedin.com/in/julio-rennan-a-m-de-souza-4ab63b1aa/",
  ),
  SocialMedia(
    imagePath: ManagerPath.iconGit,
    url: "https://github.com/JulioRennan",
  ),
];
