class ConferenceSerializer < ActiveModel::Serializer
  attrs = Conference.column_names.map(&:to_sym) + [:when]

  attributes(*attrs)
end
