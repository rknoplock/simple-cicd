# 🚀 Simple CI/CD Pipeline

Este repositório contém um pipeline de **CI/CD automatizado** utilizando **GitHub Actions**, **Docker Hub** e **Kubernetes**. O objetivo é realizar **integração contínua (CI)** e **entrega contínua (CD)** de forma eficiente e automatizada.

---

## 🏗️ Visão Geral do Pipeline

### 1️⃣ Continuous Integration (CI)

**Gatilho:** Quando um push é feito para as branches `staging` ou `production`.

**O que acontece?**
- ✅ Código é clonado e dependências são instaladas.
- ✅ Execução dos testes automatizados (HTMLHint).
- ✅ Build da imagem com Docker.
- ✅ Push da imagem para o Docker Hub.

### 2️⃣ Continuous Delivery (CD)

**O que acontece?**
- ✅ Criação automática de uma tag e release no GitHub.
- ✅ Deploy automático no cluster Kubernetes.
- ✅ Restart do deployment via `kubectl rollout restart`.

---

## 🛠️ Como Funciona?

### 📌 Pipeline CI/CD
- Arquivo de configuração: `.github/workflows/ci.yml`

**Etapas:**
1. Validação do código (HTML).
2. Build e push da imagem Docker com tag `staging` ou `production`.
3. Criação de release com tag baseada na branch e horário.
4. Reinício do deployment Kubernetes baseado no nome do repositório + ambiente (`meu-app-staging` ou `meu-app-prod`).

---

## 🔐 Configuração no GitHub Secrets

Para que o pipeline funcione corretamente, configure os seguintes **secrets** no GitHub:

| Secret Name        | Descrição                                             |
|--------------------|-------------------------------------------------------|
| `DOCKER_USERNAME`  | Seu nome de usuário do Docker Hub.                    |
| `DOCKER_PASSWORD`  | Token ou senha do Docker Hub.                         |
| `KUBECONFIG_DATA`  | Arquivo kubeconfig codificado em base64.              |
| `GITHUB_TOKEN`     | Token de acesso padrão do GitHub (usado automaticamente). |

> 💡 Para gerar o `KUBECONFIG_DATA`:
> ```bash
> base64 ~/.kube/config
> ```

---

## 🚀 Como Usar

```bash
# Clone este repositório
git clone https://github.com/seu-usuario/meu-projeto.git
cd meu-projeto
