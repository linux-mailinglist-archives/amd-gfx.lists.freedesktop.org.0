Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180D748E04
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0BE894FE;
	Mon, 17 Jun 2019 19:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14906894DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:09 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g18so6942799qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtZm13etajiZm3BoHOULlwJXD84SeSzXM8giupwLpWc=;
 b=YdRW/eNDdoFArghephWYWJ/RSPZt88992UF4UhRtOmhr6mmMUhejE2IzgoNBi4BQ3b
 uV2MdqhXtIpj9usjTbZDmwjqZZUNRcvW37/EVYjTky+kH2dmKD7lP1zsH3U9j+GlMQOT
 UqAENYnTww4LNw8eHKCe4c48/JlDL2x0Y1iMzDmph0sS2/wBenHaSgOjBtLhFQe+jDBa
 vFXJPKeM9PtTR5vozPV7mw8Rr3OBcd0k04UM2Ei2tLMN71by04wWzyWwL9jFu8+zyXhn
 zHrVRGxitPQB4f8OWbU/KvTU+24dI4+CWXkE6oqeeRq3oda4MlxSsY7uJb9RXNMeOu81
 vWmA==
X-Gm-Message-State: APjAAAWdKcsmLuZg2ASHskCI3UBXSR1LG/Y86YcTqFq/MD9q5QqfzRm0
 6QwOZq+fvZ+bTclPwahi0Rg9ENQqFoo=
X-Google-Smtp-Source: APXvYqwsfthMXsQLTDEJ7K10qYfyHdjiqUmRmfyYB55biocDObazgJXAwz0au0Vy8C7exPp10KPJJg==
X-Received: by 2002:a37:6258:: with SMTP id w85mr77936057qkb.40.1560799088070; 
 Mon, 17 Jun 2019 12:18:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 067/459] drm/amdgpu/psp: support init psp sos microcode with
 build-in toc
Date: Mon, 17 Jun 2019 14:10:28 -0500
Message-Id: <20190617191700.17899-56-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtZm13etajiZm3BoHOULlwJXD84SeSzXM8giupwLpWc=;
 b=joQ5djqI6XyWZuAICqSNhKr5xLBnTnBcr9gZoTKfnh8zY83WzGEj9LuLfa4OANU8KH
 JjS/OghphjKJ7fU9Cg4k6nO78CHgkflZ6z9ymnGU5Wm1eVWz4gyCfw0q+RMAloV+qK8g
 iPWVPV7PmDYwj0qBr5G7Cv0VxdF35IVdJ/8i7SNVRVGL4UZJe2eK08rEXVZe1wyun2S/
 NzCUf+6IMEE9IJTyopr1ZpUvNGcZ4re/TXagSNCRAEVxyoi9Lv4J4iqesRYMSSqDbFO5
 1aQ4v6l95L5xPD1X11MAZyci10mbAE4UllFDQNjaeV5w78u6z/VookBTiA9wt6mgCrVQ
 OfIA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKcHNwX2Zpcm13YXJl
X2hlYWRlcl92MV8xIGlzIHVzZWQgZm9yIHBzcCBzb3Mgd2l0aCBidWlsZC1pbiB0b2MKClNpZ25l
ZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IExlIE1hIDxMZS5NYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5oIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFf
MC5jICB8IDMxICsrKysrKysrKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmgKaW5kZXggOWNjNzQxODAwNjgyLi5jMjIyZWRmOTkyYmMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKQEAgLTE1Nyw3ICsxNTcsNyBAQCBzdHJ1Y3Qg
cHNwX2NvbnRleHQKIAl1aW50MzJfdAkJCXRvY19iaW5fc2l6ZTsKIAl1aW50OF90CQkJCSpzeXNf
c3RhcnRfYWRkcjsKIAl1aW50OF90CQkJCSpzb3Nfc3RhcnRfYWRkcjsKLQl1aW50OF90CQkJCSp0
b2Nfc3RhcnRfYWRkcgorCXVpbnQ4X3QJCQkJKnRvY19zdGFydF9hZGRyOwogCiAJLyogdG1yIGJ1
ZmZlciAqLwogCXN0cnVjdCBhbWRncHVfYm8JCSp0bXJfYm87CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jCmluZGV4IGUxOWQyMzNhODEwZC4uZDJmYmNhZDA1NGU0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtNTYsNiArNTYsNyBAQCBzdGF0aWMg
aW50IHBzcF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAlj
aGFyIGZ3X25hbWVbMzBdOwogCWludCBlcnIgPSAwOwogCWNvbnN0IHN0cnVjdCBwc3BfZmlybXdh
cmVfaGVhZGVyX3YxXzAgKnNvc19oZHI7CisJY29uc3Qgc3RydWN0IHBzcF9maXJtd2FyZV9oZWFk
ZXJfdjFfMSAqc29zX2hkcl92MV8xOwogCWNvbnN0IHN0cnVjdCBwc3BfZmlybXdhcmVfaGVhZGVy
X3YxXzAgKmFzZF9oZHI7CiAJY29uc3Qgc3RydWN0IHRhX2Zpcm13YXJlX2hlYWRlcl92MV8wICp0
YV9oZHI7CiAKQEAgLTgyLDE1ICs4MywzMSBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9pbml0X21p
Y3JvY29kZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAkJZ290byBvdXQ7CiAKIAlzb3NfaGRy
ID0gKGNvbnN0IHN0cnVjdCBwc3BfZmlybXdhcmVfaGVhZGVyX3YxXzAgKilhZGV2LT5wc3Auc29z
X2Z3LT5kYXRhOwotCWFkZXYtPnBzcC5zb3NfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KHNvc19o
ZHItPmhlYWRlci51Y29kZV92ZXJzaW9uKTsKLQlhZGV2LT5wc3Auc29zX2ZlYXR1cmVfdmVyc2lv
biA9IGxlMzJfdG9fY3B1KHNvc19oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7Ci0JYWRldi0+
cHNwLnNvc19iaW5fc2l6ZSA9IGxlMzJfdG9fY3B1KHNvc19oZHItPnNvc19zaXplX2J5dGVzKTsK
LQlhZGV2LT5wc3Auc3lzX2Jpbl9zaXplID0gbGUzMl90b19jcHUoc29zX2hkci0+aGVhZGVyLnVj
b2RlX3NpemVfYnl0ZXMpIC0KLQkJCQkJbGUzMl90b19jcHUoc29zX2hkci0+c29zX3NpemVfYnl0
ZXMpOwotCWFkZXYtPnBzcC5zeXNfc3RhcnRfYWRkciA9ICh1aW50OF90ICopc29zX2hkciArCisK
Kwlzd2l0Y2ggKHNvc19oZHItPmhlYWRlci5oZWFkZXJfdmVyc2lvbl9tYWpvcikgeworCWNhc2Ug
MToKKwkJYWRldi0+cHNwLnNvc19md192ZXJzaW9uID0gbGUzMl90b19jcHUoc29zX2hkci0+aGVh
ZGVyLnVjb2RlX3ZlcnNpb24pOworCQlhZGV2LT5wc3Auc29zX2ZlYXR1cmVfdmVyc2lvbiA9IGxl
MzJfdG9fY3B1KHNvc19oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7CisJCWFkZXYtPnBzcC5z
b3NfYmluX3NpemUgPSBsZTMyX3RvX2NwdShzb3NfaGRyLT5zb3Nfc2l6ZV9ieXRlcyk7CisJCWFk
ZXYtPnBzcC5zeXNfYmluX3NpemUgPSBsZTMyX3RvX2NwdShzb3NfaGRyLT5oZWFkZXIudWNvZGVf
c2l6ZV9ieXRlcykgLQorCQkJCWxlMzJfdG9fY3B1KHNvc19oZHItPnNvc19zaXplX2J5dGVzKTsK
KwkJYWRldi0+cHNwLnN5c19zdGFydF9hZGRyID0gKHVpbnQ4X3QgKilzb3NfaGRyICsKIAkJCQls
ZTMyX3RvX2NwdShzb3NfaGRyLT5oZWFkZXIudWNvZGVfYXJyYXlfb2Zmc2V0X2J5dGVzKTsKLQlh
ZGV2LT5wc3Auc29zX3N0YXJ0X2FkZHIgPSAodWludDhfdCAqKWFkZXYtPnBzcC5zeXNfc3RhcnRf
YWRkciArCisJCWFkZXYtPnBzcC5zb3Nfc3RhcnRfYWRkciA9ICh1aW50OF90ICopYWRldi0+cHNw
LnN5c19zdGFydF9hZGRyICsKIAkJCQlsZTMyX3RvX2NwdShzb3NfaGRyLT5zb3Nfb2Zmc2V0X2J5
dGVzKTsKKwkJaWYgKHNvc19oZHItPmhlYWRlci5oZWFkZXJfdmVyc2lvbl9taW5vciA9PSAxKSB7
CisJCQlzb3NfaGRyX3YxXzEgPSAoY29uc3Qgc3RydWN0IHBzcF9maXJtd2FyZV9oZWFkZXJfdjFf
MSAqKWFkZXYtPnBzcC5zb3NfZnctPmRhdGE7CisJCQlhZGV2LT5wc3AudG9jX2Jpbl9zaXplID0g
bGUzMl90b19jcHUoc29zX2hkcl92MV8xLT50b2Nfc2l6ZV9ieXRlcyk7CisJCQlhZGV2LT5wc3Au
dG9jX3N0YXJ0X2FkZHIgPSAodWludDhfdCAqKWFkZXYtPnBzcC5zeXNfc3RhcnRfYWRkciArCisJ
CQkJCWxlMzJfdG9fY3B1KHNvc19oZHJfdjFfMS0+dG9jX29mZnNldF9ieXRlcyk7CisJCX0KKwkJ
YnJlYWs7CisJZGVmYXVsdDoKKwkJZGV2X2VycihhZGV2LT5kZXYsCisJCQkiVW5zdXBwb3J0ZWQg
cHNwIHNvcyBmaXJtd2FyZVxuIik7CisJCWVyciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0OworCX0K
IAogCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19hc2QuYmlu
IiwgY2hpcF9uYW1lKTsKIAllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2LT5wc3AuYXNkX2Z3
LCBmd19uYW1lLCBhZGV2LT5kZXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
