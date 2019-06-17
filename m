Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58D48E1F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EBC896EC;
	Mon, 17 Jun 2019 19:18:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD46896DD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:33 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x18so6903516qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GnN6j6pg/L67uSzt1yWsi+VgK5taSN/ykF6guyLLi8=;
 b=PLpkfJnoUPzaAIL95DNvOIyCbQkGiKChfQHQgk47EmIBAPDUaWtpbnt+3UWa/Y7J4I
 69v+noAVjpf9qaRpei4rA+rNZHJyLUJJ+dId0/x28sqMrAeRvNNHp08mGNjXsi6EWsiv
 vKtwUy1grww7UsbH//an0bWHFs+HUwp05lp564G0gQlTSjwJ9iBboDP8zxV9aLfkEngf
 0Y6T1RkJS3VR8PlQ3g0FjmOp0dIfaS5/JInJwntDyivHZFBIiiI3S38eYavgANK1eUqW
 SB4JrambzfEtEna7ejOY1OK0xpsb2X6ve5evfyrVax1egXCyHNXSzqlL0DkSiMrsxw+q
 Pypg==
X-Gm-Message-State: APjAAAUKZ/gejDm/YkECQXEt4NtK4f7bw5ZbuyYwNykRb0kIPqW25N+i
 xFBJ+Foz15o1CfulEI9d1jWlGyQUcpQ=
X-Google-Smtp-Source: APXvYqwxj3TscziRG0cZPP9s7kkUBFQZDpw6DHzdkhPc4lw8wDTg+uYeTwmmKJgTaOXchLSx4QtM6A==
X-Received: by 2002:a37:be41:: with SMTP id o62mr79997546qkf.356.1560799111904; 
 Mon, 17 Jun 2019 12:18:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 094/459] drm/amdgpu: program for resuming preempted ib
Date: Mon, 17 Jun 2019 14:10:55 -0500
Message-Id: <20190617191700.17899-83-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GnN6j6pg/L67uSzt1yWsi+VgK5taSN/ykF6guyLLi8=;
 b=K/Q4/yJGD64dPcJBApSF+kgHir76DjtqThfhEgGCNSGNqvczEhEiR6uP6NvWWxoAOp
 4Fo6qsUjvPf0msNYMq3Gt1C8y02DLz9KX/6X86pZL1MT78kwvxF669dycYV69K5BZQb+
 cWFEaXhn5dr29oTmhVG+AzJg+PHQO6jBpJ5C04ThfMBb/Sx4fXIRIwxTBI2AlbOtyQge
 5G/yFp0urh6H45ObSmXQ+OR5WiUknypb3Vx5PbDrKiPFqAKCgswDr/rnWX9R47Bm+GPL
 +3+YeFsuU3Jvv7noGzzbSU0Qo7obBXH53YBAKHsSzJYeF65fBxVSqjjmMB8TjHKGP4nH
 dzaw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkZvciBuZXcgc3VibWlzc2lvbiBp
YiwgQ0UvREUgbWV0YWRhdGEgc2hvdWxkIGJlIHByb2dyYW1tZWQgdG8gMDsKZm9yIHBhcnRpYWxs
eSBleGVjdXRpb24gaWIsIENFL0RFIG1ldGFkYXRhIHNob3VsZCBiZSByZXN0b3JlZC4KCkFja2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEph
Y2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3NhLmMgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmlydC5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYwppbmRleCBmNjYwNjI4ZTZhZjkuLjM1YThkM2M5
NmZjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYwpAQCAtNDcsNiAr
NDcsNyBAQCBpbnQgYW1kZ3B1X2FsbG9jYXRlX3N0YXRpY19jc2Eoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfYm8gKipibwogCQlyZXR1cm4gLUVOT01FTTsKIAogCW1l
bXNldChwdHIsIDAsIHNpemUpOworCWFkZXYtPnZpcnQuY3NhX2NwdV9hZGRyID0gcHRyOwogCXJl
dHVybiAwOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmlydC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuaAppbmRl
eCBkY2EyNWRlZWU3NWMuLmY1MTA3NzMxZTljNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmlydC5oCkBAIC0yNTMsNiArMjUzLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgYW1kZ2lt
X3ZmMnBmX2luZm9fdjIgYW1kZ2ltX3ZmMnBmX2luZm8gOwogc3RydWN0IGFtZGdwdV92aXJ0IHsK
IAl1aW50MzJfdAkJCWNhcHM7CiAJc3RydWN0IGFtZGdwdV9ibwkJKmNzYV9vYmo7CisJdm9pZAkJ
CQkqY3NhX2NwdV9hZGRyOwogCWJvb2wgY2hhaW5lZF9pYl9zdXBwb3J0OwogCXVpbnQzMl90CQkJ
cmVnX3ZhbF9vZmZzOwogCXN0cnVjdCBhbWRncHVfaXJxX3NyYwkJYWNrX2lycTsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
