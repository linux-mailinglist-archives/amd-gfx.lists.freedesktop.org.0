Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A748560C7E
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 22:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3906E550;
	Fri,  5 Jul 2019 20:41:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624C6E550
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 20:41:53 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 201so6678887qkm.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 13:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MdvdfLOVBZo/0c+njoK1oqwmKcIr+XuYvziBMVtBfg4=;
 b=Kmny4mjAMMfrbgAdcX4lVvUeoGKtWV8T0cz1pRjrSwYmW3LKx5DpvcJmfo3W0uDlCi
 50JMp6v+nc8MvLkYXbMMXDzrEqhftd3+zoqdif8fa35Xf/tu115PPJFjYHAAW5IzjPHb
 GoamC3Dw2A3biTA/JmXTbxJUpOXiCXuzLH8GFHdh41Fx5VefGkl505h64xMNbU7Jsbzo
 R0RHS/xiAZfMj/W2HeJfFszLQ12xiFsZ4nQ3uHVARgOf+fv2ey0uKj+hauPUiRS+dlr+
 Qjok2YN8UQKkxoo8wn5lJzzg4VjmO80E0pHeic+FIqxNzrc5k3pCKsYjUTKbGXjCt3jk
 SzuA==
X-Gm-Message-State: APjAAAW0EH0ClTgb/E4hYaiG6BdfG0hCHL+BZVL5+BdGZ2zO7ErZHqf6
 /iqTFMD0YS+953t2Gg1mf48W3D3INfs=
X-Google-Smtp-Source: APXvYqziXqxwGRR38ysK15cNp7BW1G/bH5KuoF8SAGrYk2FT+xG69DUOMVOmrwgswmvHfkDe9XvcQA==
X-Received: by 2002:a37:aa04:: with SMTP id t4mr4691443qke.359.1562359312252; 
 Fri, 05 Jul 2019 13:41:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.77.97])
 by smtp.gmail.com with ESMTPSA id e1sm4681835qtb.52.2019.07.05.13.41.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:41:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: properly guard DC support in navi code
Date: Fri,  5 Jul 2019 15:41:42 -0500
Message-Id: <20190705204142.10231-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MdvdfLOVBZo/0c+njoK1oqwmKcIr+XuYvziBMVtBfg4=;
 b=W6OPIHJxW6v+acAnYRMQlN02E7WBuPlXU5CvBaBQfePwP+Rnb1tuyAUaeRpQb86DfE
 nvAf/tAhMEcPN1oIjmax9axJ6z9hpvb1e3r8s5Vns7qteCNZjxzPppxI3A7vwWX3RRVV
 nnz8JgbMFkVWkAvlRuBBFaHaxtTZ7YHKq4wDCez4itcmrnevpU3uJq0BOmOaATO1ZBJJ
 VywAC7o/L2oEEpaaryh1cPeWUFxyaeh9fUtt1cgS7mIQ0VRHMdeXFm4ySREl8rySqgcw
 qHTb5Eau9eVmts7/Fl4KWU//cPgv7AE85O/NrVACVDjfIALdGrF/HYUt+13dKNAvr1mG
 FI6g==
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

TmVlZCB0byBhZGQgYXBwcm9wcmlhdGUgaWZkZWYuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IGEwOTBlM2ZkYzc2Mi4uZWUzOWNiNzQwZDQxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTM1Miw4ICszNTIsMTIgQEAgaW50IG52X3NldF9pcF9i
bG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmc211X3YxMV8wX2lwX2Jsb2NrKTsKIAkJaWYgKGFkZXYtPmVuYWJsZV92
aXJ0dWFsX2Rpc3BsYXkgfHwgYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQogCQkJYW1kZ3B1X2Rldmlj
ZV9pcF9ibG9ja19hZGQoYWRldiwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsKKyNpZiBkZWZpbmVk
KENPTkZJR19EUk1fQU1EX0RDKQogCQllbHNlIGlmIChhbWRncHVfZGV2aWNlX2hhc19kY19zdXBw
b3J0KGFkZXYpKQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRtX2lwX2Js
b2NrKTsKKyNlbHNlCisjCXdhcm5pbmcgIkVuYWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3IgZGlz
cGxheSBzdXBwb3J0IG9uIG5hdmkuIgorI2VuZGlmCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmc2RtYV92NV8wX2lwX2Jsb2NrKTsKIAkJaWYgKGFkZXYtPmZpcm13YXJlLmxv
YWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9ESVJFQ1QgJiYKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
