Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4465BD7F
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jul 2019 16:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEC689AC9;
	Mon,  1 Jul 2019 14:00:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01989AC9
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jul 2019 14:00:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m29so14749577qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jul 2019 07:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzo725VBe1KyXy3sN1BG4PXWTINV8M3YsRUS4Fr2xCo=;
 b=OxxHPB+2Q8vJkQgmlQ35txGfHOQMQmBdvWrncT4D+PP9pfpFFKWaajLB8Pvf5TtL3C
 BKFi06XMd7kRNbSg5JiodXOLLgfWGZF9yg8iqiTa5/i9w/+HgdY5eEi4rBoxz0+umCAV
 7bWYUINb/zzUzPI228MeBp7XtW/7VjLn5agC/Jjfm+c0/ylORVkiuakxT3dzWAjcex2A
 HITyV7lP7GKJov988QWfuN4NhJXI2Dnk39nLJiTPuIcsiNBSBFOxQHo4RRYTo6LC6PrH
 MCPF1m4qLcXNZR/yLRn3JZDlQIm/3keHccBsw36MJP3EoK/uY67jIjeo3TfNKxDNxOgd
 4kAg==
X-Gm-Message-State: APjAAAURntp0GuyUxy6WwIzU+nKDX0R4EuPYHIDRnLdxK/FnkcpkVuUk
 +0gWVjp74XSmD3Ui0VFK5kNIfoP5lcQ=
X-Google-Smtp-Source: APXvYqz6n0leyjAkkWiKoQGdlyvhM8XJz42eeAANyPuUnLaA0CWOUr9/rcBGi5wz2/wOlXRqKPoUqA==
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr20553572qta.169.1561989627889; 
 Mon, 01 Jul 2019 07:00:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 18sm4883297qke.131.2019.07.01.07.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 07:00:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
Date: Mon,  1 Jul 2019 09:00:18 -0500
Message-Id: <20190701140019.9881-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tzo725VBe1KyXy3sN1BG4PXWTINV8M3YsRUS4Fr2xCo=;
 b=U+EYdLKlTBTJnp/bU4O6txqw8XcDGzIAoNydmI4h28PCbjylPB2X4ORzG7G5AsJT0c
 RnQ/4oInGbJ8HcMgJJa32DHtkJ5MD7jWvp6ySzbZWo9x9tmFwCfaz/bHLmx2utj9r9wy
 cYD3N+sM1rejaeWGkDtZMmQ+JvgcWO9zQjmSJMQe6WrMS2ck+xQEH9L9w2HLP53TCrFw
 dWOWbd+UE8Y6Fa0hCmoHGGL5j7N0lT/vanlPP/cQpKWdpJ1/OPW6GEdqcfY+9puzpL1v
 AoErfiCncgDhVaM6P76pbvoazNxDoBE+56DU88E2MzZ7fpm7TsBJg+8rCv7HXgAyCtdN
 5ztQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVjb21tZW5kZWQgYnkgdGhlIGh3IHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA5
YjQxM2Y2ZmE1ODguLjViZGQ3YzQyYjAwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCkBAIC0xOTYwLDI1ICsxOTYwLDYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY29uc3Rh
bnRzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJbXV0ZXhfdW5sb2NrKCZhZGV2
LT5zcmJtX211dGV4KTsKIAogCWdmeF92OV8wX2luaXRfY29tcHV0ZV92bWlkKGFkZXYpOwotCi0J
bXV0ZXhfbG9jaygmYWRldi0+Z3JibV9pZHhfbXV0ZXgpOwotCS8qCi0JICogbWFraW5nIHN1cmUg
dGhhdCB0aGUgZm9sbG93aW5nIHJlZ2lzdGVyIHdyaXRlcyB3aWxsIGJlIGJyb2FkY2FzdGVkCi0J
ICogdG8gYWxsIHRoZSBzaGFkZXJzCi0JICovCi0JZ2Z4X3Y5XzBfc2VsZWN0X3NlX3NoKGFkZXYs
IDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYpOwotCi0JV1JFRzMyX1NPQzE1X1JM
QyhHQywgMCwgbW1QQV9TQ19GSUZPX1NJWkUsCi0JCSAgIChhZGV2LT5nZnguY29uZmlnLnNjX3By
aW1fZmlmb19zaXplX2Zyb250ZW5kIDw8Ci0JCQlQQV9TQ19GSUZPX1NJWkVfX1NDX0ZST05URU5E
X1BSSU1fRklGT19TSVpFX19TSElGVCkgfAotCQkgICAoYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmlt
X2ZpZm9fc2l6ZV9iYWNrZW5kIDw8Ci0JCQlQQV9TQ19GSUZPX1NJWkVfX1NDX0JBQ0tFTkRfUFJJ
TV9GSUZPX1NJWkVfX1NISUZUKSB8Ci0JCSAgIChhZGV2LT5nZnguY29uZmlnLnNjX2hpel90aWxl
X2ZpZm9fc2l6ZSA8PAotCQkJUEFfU0NfRklGT19TSVpFX19TQ19ISVpfVElMRV9GSUZPX1NJWkVf
X1NISUZUKSB8Ci0JCSAgIChhZGV2LT5nZnguY29uZmlnLnNjX2Vhcmx5el90aWxlX2ZpZm9fc2l6
ZSA8PAotCQkJUEFfU0NfRklGT19TSVpFX19TQ19FQVJMWVpfVElMRV9GSUZPX1NJWkVfX1NISUZU
KSk7Ci0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7Ci0KIH0KIAogc3RhdGlj
IHZvaWQgZ2Z4X3Y5XzBfd2FpdF9mb3JfcmxjX3NlcmRlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
