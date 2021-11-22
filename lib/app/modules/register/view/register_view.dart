import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/custom_button/button.dart';
import 'package:get_x/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              border: Border.all(color: Colors.blue),
                              image: DecorationImage(
                                image: FileImage(
                                  controller.profileImage,
                                  scale: 1,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: controller.profileImage.path == ''
                                ? const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.blue,
                                    size: 25,
                                  )
                                : null,
                          ));
                    }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Informe seu nome.',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nome é obrigatório.';
                              }
                            },
                            controller: controller.nameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                hintText: 'Nome',
                                hintStyle: TextStyle(fontSize: 14))),
                        const SizedBox(height: 10),
                        Text(
                          'Informe seu e-mail.',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: TextStyle(fontSize: 14)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'E-mail é obrigatório.';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Informe seu telefone.',
                          style: TextStyle(
                              color: Colors.grey[900],
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
                              return 'Número para contato é obrigatório.';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Informe seu CPF.',
                          style: TextStyle(
                              color: Colors.grey[900],
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
                              return 'CPF é obrigatório.';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Informe seu CEP.',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: controller.cepController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [controller.maskedCep],
                          onChanged: (String value) {
                            controller.getAddress(value);
                          },
                          decoration: const InputDecoration(
                              hintText: 'CEP',
                              hintStyle: TextStyle(fontSize: 14)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CEP é obrigatório.';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Informe sua ocupação.',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: controller.ocupationController,
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          decoration: const InputDecoration(
                              hintText: 'Ocupação',
                              hintStyle: TextStyle(fontSize: 14)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ocupação é obrigatório.';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Agora fale um pouco sobre você.',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            maxLength: 150,
                            controller: controller.descriptionController,
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: 'Descrição',
                                hintStyle: TextStyle(fontSize: 14))),
                        const SizedBox(height: 10),
                      ],
                    ),
                    CustomButton(
                      isLoading: false,
                      onPressed: () {
                        controller.registerUser(context);
                      },
                      title: 'Cadastrar',
                    )
                  ],
                ),
              ))),
    );
  }
}
