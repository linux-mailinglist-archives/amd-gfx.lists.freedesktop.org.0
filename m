Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FA48DCD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2697892DE;
	Mon, 17 Jun 2019 19:17:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539C6892DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:26 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12163919qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wp42RdrlOyeLd6KuYUHSRAeg62ANKYxsJafhELU/Qw8=;
 b=KE/kycWy2wUPljcfQ2Xece8qT/+deFkgBSzMp8FLDv3gnpyZpnVgpgitbO8eXTtnbl
 +o55LQwUMXOzbFqvWfDqvF24lkeOsBoPAodUfM6ahEsYEeTUJXLb88JsER+b9cM79pML
 EceEWQC8exDi3Ye6jMXTVYqDGQMIptJ/xgoi5Ee4IiQ4h9gQp06qYXLgZrWPDCJN06Gw
 SbduyWTaFTxXZk2YCuAwTW2TQkxADAlxzPZCSokHPvyAufv2ijxi6zZhVg+1hLYV90ho
 1b97BAUXReLbeZznm314P/6WHVQu6YZUZwiLqwZjIIYSNyfaIsQ2qXJwWoIsVKg3r5yY
 W+QA==
X-Gm-Message-State: APjAAAX7RfUkBvG9GxUdqeQdD/pncBLp+/1+yM3gSsIo30hNVm+baoRv
 W/zRrW56JNqYxDFrKsAOaGjraXIGhNs=
X-Google-Smtp-Source: APXvYqzNznn9BuZDzZn5MqD4afAUtPJ6aR/k4MLVjShe5/fcp9qq2wCbfRG2AiT0DcOt+m+dNG9OCg==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr1643938qvh.225.1560799045318; 
 Mon, 17 Jun 2019 12:17:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 024/459] drm/amdgpu: parse the new members added by gpu_info
 ucode v1_1
Date: Mon, 17 Jun 2019 14:09:45 -0500
Message-Id: <20190617191700.17899-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wp42RdrlOyeLd6KuYUHSRAeg62ANKYxsJafhELU/Qw8=;
 b=ePa0fahmQwnXGIwikVT+ka5dvLE/fWHrWs15GxhcRgE+aVD2S33Sq/pE6LdojI40pj
 7IDuHp0aTrzaW67sc/Hr3qpi5/2vufwoQDdymRGpG8DSSjWu07d2yz9evMEtaa2UFhqF
 U9DjdhiBpNtHzzNimmgNfePASr08RVVWu9e8MrTYvBu1VPb/IPAlU0v7pUwJSbfvU8xr
 suuYd+6r3+/MlGvENoPUM39B1/1/V5tfCYgGH6alDA+EA6a/kGe1ZZv0qRpuXkhwVBwg
 fZ/GcB8mXO/HA/DHUftq2VShra4OX1kcVdOEmgZS+Baxg2HE3zGi8Z6dUGwKPF7uFFi8
 G9Rw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKaW5kZXggMDBhNjY4ODE3Y2IwLi42ZjIyZTc3ZjkwOGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE0MjcsNiArMTQyNywxNSBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kZXZpY2VfcGFyc2VfZ3B1X2luZm9fZncoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJCWFkZXYtPmdmeC5jdV9pbmZvLm1heF9zY3JhdGNoX3Nsb3RzX3Blcl9jdSA9
CiAJCQlsZTMyX3RvX2NwdShncHVfaW5mb19mdy0+Z2NfbWF4X3NjcmF0Y2hfc2xvdHNfcGVyX2N1
KTsKIAkJYWRldi0+Z2Z4LmN1X2luZm8ubGRzX3NpemUgPSBsZTMyX3RvX2NwdShncHVfaW5mb19m
dy0+Z2NfbGRzX3NpemUpOworCQlpZiAoaGRyLT52ZXJzaW9uX21pbm9yID09IDEpIHsKKwkJCWNv
bnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8xICpncHVfaW5mb19mdyA9CisJCQkJKGNv
bnN0IHN0cnVjdCBncHVfaW5mb19maXJtd2FyZV92MV8xICopKGFkZXYtPmZpcm13YXJlLmdwdV9p
bmZvX2Z3LT5kYXRhICsKKwkJCQkJCQkJCWxlMzJfdG9fY3B1KGhkci0+aGVhZGVyLnVjb2RlX2Fy
cmF5X29mZnNldF9ieXRlcykpOworCQkJYWRldi0+Z2Z4LmNvbmZpZy5udW1fc2NfcGVyX3NoID0K
KwkJCQlsZTMyX3RvX2NwdShncHVfaW5mb19mdy0+bnVtX3NjX3Blcl9zaCk7CisJCQlhZGV2LT5n
ZnguY29uZmlnLm51bV9wYWNrZXJfcGVyX3NjID0KKwkJCQlsZTMyX3RvX2NwdShncHVfaW5mb19m
dy0+bnVtX3BhY2tlcl9wZXJfc2MpOworCQl9CiAJCWJyZWFrOwogCX0KIAlkZWZhdWx0OgotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
