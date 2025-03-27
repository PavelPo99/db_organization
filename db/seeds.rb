Author.destroy_all
Journal.destroy_all


author = Author.create!([
  { full_name: "Лазебников Альберт Радикович", orcid: '0001-0002-0003-0004' },
  { full_name: "Никитаева Валентина Руслановна", orcid: '0006-0007-0008-0009' },
  { full_name: "Лунегова Маргарита Яновна", orcid: '0010-0011-0012-0013' }
])

journal = Journal.create!([
  { name: "Артифекс", issn: '1050-124X' },
  { name: "МиндФьюжн", issn: '0317-8471' },
  { name: "Синергия", issn: '1000-5466' }
])
