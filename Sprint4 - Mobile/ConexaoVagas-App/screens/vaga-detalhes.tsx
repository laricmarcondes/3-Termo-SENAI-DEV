import React, { useEffect, useState } from 'react'
import { StyleSheet, Text, View } from 'react-native'
import { Vaga } from '../models/vaga'
import { MaterialCommunityIcons } from '@expo/vector-icons';
import VagaApi from '../api/vagas';
import BeneficioApi from '../api/beneficios';
import HabilidadeApi from '../api/habilidades';
import tailwind from 'tailwind-rn';
import Hr from '../components/hr';
import { Color } from '../styles/global';
import { Beneficio } from '../models/beneficio';
import { Habilidade } from '../models/habilidade';
import LoadingScreen from '../components/loadingscreen';

export default function VagaDetalhes({ route, navigate }: any) {
    const { id } = route.params;

    const [vaga, setVaga] = useState<Vaga>(new Vaga());
    const [beneficios, setBeneficios] = useState<Beneficio[]>([]);
    const [habilidades, setHabilidades] = useState<Habilidade[]>([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        Promise.all([
            VagaApi.buscarPorId(id).then(data => setVaga(data)),
            BeneficioApi.listar().then(data => setBeneficios(data)),
            HabilidadeApi.listar().then(data => setHabilidades(data))
        ])
        .then(() => setIsLoading(false))
        
    }, [])
    
    if (isLoading) {
        return <LoadingScreen/>
    }
    
    return (
        <View style={tailwind("m-2")}>
            <View style={tailwind("mt-4 mb-6")}>
                <Text style={tailwind("text-center text-xl")}>{vaga.titulo}</Text>
                <Text style={tailwind("text-center text-xs")}>{vaga.idEmpresaNavigation?.nomeFantasia}</Text>
            </View>
            <View style={tailwind("flex-row items-center")}>
                <MaterialCommunityIcons name="cash-usd" color="#517a3d"
                    size={24} />
                <Text style={tailwind("text-xl")}> R$ {vaga.salario}</Text>
            </View>
            <View style={tailwind("flex-row items-center")}>
                <MaterialCommunityIcons name="school" color="#DF6B66"
                    size={24} />
                <Text style={tailwind("text-xl")}> {vaga.qualificacao}</Text>
            </View>
            <View style={tailwind("flex-row items-center")}>
                <MaterialCommunityIcons name="clock" color="#7aa9f5"
                    size={24} />
                <Text style={tailwind("text-xl")}> Carga horária de {vaga.cargaHoraria}h</Text>
            </View>

            <Hr style={tailwind("my-3")} />
            <View>
                <View style={tailwind("mb-2")}>
                    <Text style={tailwind("font-bold")}>Descrição</Text>
                    <Text>{vaga.descricao}</Text>
                </View>
                {/* <View style={tailwind("mb-2")}>
                    <Text style={tailwind("font-bold")}>Qualificação:</Text>
                    <Text>{vaga.qualificacao}</Text>
                </View> */}
                <View style={tailwind("mb-2")}>
                    <Text style={tailwind("font-bold")}>Local de Trabalho</Text>
                    <Text>{vaga.idEnderecoNavigation?.localCompleto}</Text>
                </View>

                <View style={tailwind("mb-2")}>
                    <Text style={tailwind("font-bold")}>Benefícios</Text>
                    <View style={tailwind("flex-row flex-wrap")}>
                        {vaga.beneficioVaga?.map(bv => (
                            <Text
                                style={tailwind("bg-gray-400 p-2 rounded-full m-1 h-8")}
                                ellipsizeMode='tail'
                                numberOfLines={1}
                                key={bv.idBeneficio?.toString()}>
                                {beneficios.find((b: Beneficio) =>
                                    bv.idBeneficio == b.idBeneficio)?.nomeBeneficio}
                            </Text>
                        ))}
                    </View>
                </View>

                <View style={tailwind("mb-2")}>
                    <Text style={tailwind("font-bold")}>Habilidades</Text>
                    <View style={tailwind("flex-row flex-wrap")}>
                        {vaga.habilidadeVaga?.map(hv => (
                            <Text
                                style={tailwind("bg-gray-400 p-2 rounded-full m-1 h-8")}
                                ellipsizeMode='tail'
                                numberOfLines={1}
                                key={hv.idHabilidade?.toString()}>
                                {habilidades.find((h: Habilidade) =>
                                    hv.idHabilidade == h.idHabilidade)?.nomeHabilidade}
                            </Text>
                        ))}
                    </View>
                </View>


            </View>
        </View>
    )
}

const styles = StyleSheet.create({})
