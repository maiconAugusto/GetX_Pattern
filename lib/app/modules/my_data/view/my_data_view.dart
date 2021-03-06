import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/custom_button/button.dart';
import 'package:get_x/app/core/components/simmer_my_data/simmer_my_data.dart';
import 'package:get_x/app/modules/my_data/controllers/my_data_controller.dart';

class MyDataView extends GetView<MyDataController> {
  const MyDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text(
          'Cadastro',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Obx(() {
        return controller.loading.value == true
            ? const SimmerMyData()
            : SingleChildScrollView(
                child: Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Obx(() {
                            return InkWell(
                                onTap: () {
                                  controller.getPhoto();
                                },
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: controller
                                                  .photoBaseb4.value.isEmpty ==
                                              true
                                          ? const SizedBox()
                                          : Image.memory(
                                              controller.photoBaseb4.value,
                                              height: 80,
                                              width: 80,
                                            )),
                                ));
                          }),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Informe seu nome.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nome ?? obrigat??rio.';
                                    }
                                  },
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Nome',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey[400]))),
                              const SizedBox(height: 30),
                              Text(
                                'Informe a data de nascimento.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Data de nascimento ?? obrigat??rio.';
                                    }
                                  },
                                  controller: controller.dateBirthController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [controller.maskedBirthDate],
                                  decoration: InputDecoration(
                                      hintText: 'Data de nascimento',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey[400]))),
                              const SizedBox(height: 30),
                              Text(
                                'Informe seu telefone.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: controller.phoneController,
                                keyboardType: TextInputType.emailAddress,
                                inputFormatters: [controller.maskedPhone],
                                decoration: const InputDecoration(
                                    hintText: 'WhatsApp',
                                    hintStyle: TextStyle(fontSize: 14)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'N??mero para contato ?? obrigat??rio.';
                                  }
                                },
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Informe seu CPF.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: controller.cpfController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [controller.maskedCPF],
                                decoration: const InputDecoration(
                                    hintText: 'CPF',
                                    hintStyle: TextStyle(fontSize: 14)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'CPF ?? obrigat??rio.';
                                  }
                                },
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Informe seu CEP.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: controller.cepController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [controller.maskedCep],
                                onChanged: (String cep) {
                                  controller.getAddress(cep);
                                },
                                decoration: const InputDecoration(
                                    hintText: 'CEP',
                                    hintStyle: TextStyle(fontSize: 14)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'CEP ?? obrigat??rio.';
                                  }
                                },
                              ),
                              const SizedBox(height: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Informe sua cidade.',
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: controller.cityController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        hintText: 'Cidade',
                                        hintStyle: TextStyle(fontSize: 14)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Cidade ?? obrigat??rio.';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'Informe a rua.',
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: controller.streetController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        hintText: 'Rua',
                                        hintStyle: TextStyle(fontSize: 14)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Rua ?? obrigat??rio.';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'Informe o n??mero da casa.',
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller:
                                        controller.houseNumberController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                        hintText: 'N??mero',
                                        hintStyle: TextStyle(fontSize: 14)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'N??mero ?? obrigat??rio.';
                                      }
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Informe sua ocupa????o.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: controller.ocupationController,
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                                decoration: const InputDecoration(
                                    hintText: 'Ocupa????o',
                                    hintStyle: TextStyle(fontSize: 14)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Ocupa????o ?? obrigat??rio.';
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Agora fale um pouco sobre voc??.',
                                style: TextStyle(
                                    color: Colors.blueGrey[600],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                  maxLength: 150,
                                  controller: controller.descriptionController,
                                  maxLines: 3,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      hintText: 'Descri????o',
                                      hintStyle: TextStyle(fontSize: 14))),
                              const SizedBox(height: 10),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Obx(() {
                            return CustomButton(
                              isLoading: controller.loading.value,
                              onPressed: () {
                                controller.updateData();
                              },
                              title: 'Salvar',
                            );
                          }),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )));
      }),
    );
  }
}
