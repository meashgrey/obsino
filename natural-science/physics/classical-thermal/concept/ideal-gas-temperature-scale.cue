package concept

ideal_gas_temperature_scale: {
  content: #"""
    The ideal-gas temperature scale uses the behavior of an ideal gas to define
    temperature independently of the properties of a particular thermometer
    substance. For a fixed amount of ideal gas, its pressure-volume product is
    proportional to absolute temperature:

    $ p V prop T space.en ("for fixed amount of gas") $

    Comparing two equilibrium states of the same gas sample gives a temperature
    ratio. Historically, the triple point of water was assigned the value
    $273.16 "K"$ to set the scale:

    $ T_3 = T_"triple point of water" = 273.16 "K" $

    Thus, in the ideal-gas limit:

    $ T/T_3 = (p V) / (p_3 V_3) $

    The triple-point value is now historical: since 2019, the kelvin has been
    defined by fixing the Boltzmann constant. The ideal-gas scale remains a useful
    way to understand thermodynamic temperature and how gas thermometers work.
  """#
  related: [
    "concept/temperature",
    "concept/ideal-gas",
    "law/ideal-gas-law"
  ]
}
