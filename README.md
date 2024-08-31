# Cortex.ai

## Infrastructure

Vérifier l'état de l'infrastructure :

```bash
terraform state list
```

Si l'infrastructure est déployée, vous devriez voir les ressources Terraform.

Sinon, déployer l'infrastructure :

```bash
terraform apply
```

> **Une fois l'infrastructure déployée, l'adresse IP publique de l'instance EC2 est affichée.**

<br>

Lorsque vous aurez terminé, pensez à détruire l'infrastructure :

```bash
terraform destroy
```

## Déploiement

```bash
scp -i ~/.ssh/cortex-key /home/clementpellen/cortex.tar ec2-user@<ip_address>:/home/ec2-user
```
