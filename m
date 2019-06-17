Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DD48DEE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665C893E8;
	Mon, 17 Jun 2019 19:17:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A489388
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:47 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id m29so12207281qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGFUPkVakaSTNMu20F3B8HXPyFXxMvgv4waUrAvht/U=;
 b=nydoR3JExCWkqFrCgH+pRt+sh9bdNU3ClV6uyiJJK8usvs1EZwHnahSay0dXTSCgp6
 8DsZ5eRqqRlSNHRV4kEFuw2C9wTKkbRrYwu2BBooMqISqyBKYSlVxzaZqfF9RFxN77R1
 1d5FdrFYSjPrlzTNh5LYpBAu77SAlV7MHVlEwM/Df/fOmJt50QWSMUeb2sdO79gUgwuO
 SxRriNR07SneFBshP3bghguKOzYWV5DMnuYdg6W/0crNUwdJiagnCa2UTVX32JYmfeaa
 oJUPl04Ty7L7ORMEyn8/bKyfS9jn4t+LpV1pdb5j1F6pINsR54uMgocHBUEUXdIGJKWF
 28Zw==
X-Gm-Message-State: APjAAAW+8BG8NR4ae0HFfCPynXo2haiMoKpqWU40u9y43fH/RT+z9q8Q
 AB51l/UxtKdngyRkXN3JqkEFPmE/dgc=
X-Google-Smtp-Source: APXvYqxdNEPpP0LzJOyyC5DS50OVoRqGVvw0x2PjJr03x9UQr/O4kho5E0z1et2LW/tlDSF1UZ5IKA==
X-Received: by 2002:a0c:b010:: with SMTP id k16mr23279892qvc.170.1560799066038; 
 Mon, 17 Jun 2019 12:17:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 043/459] drm/amdgpu/gfx10: add special unmap_queues packet for
 preemption
Date: Mon, 17 Jun 2019 14:10:04 -0500
Message-Id: <20190617191700.17899-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGFUPkVakaSTNMu20F3B8HXPyFXxMvgv4waUrAvht/U=;
 b=ZrPaqZcq5n6901TQmpbX8xxpL1hSxEkn7iLacRz6Rh8b04jMP+YnaTnhyyrjRPm1lZ
 CfHk/zGv20mmhSshVfSQDbsvvkDstyXF4RBpWsvm60AMuzmrlHnK2LZiNuOhnYhdlOIf
 nTTiMkCtGX4ouGsH2+3Vb+d2lvNuRoTbqd4+qFrVGrqmngSt5vyew9ufobsb+xZ6jz/x
 8oyyxqQols0TPcKVW410ikp0CqAzk1gCFATn9MJY3fF6k2gcrFm7J8jrhxke+eN8euDy
 veIqXa1HDBeFv7SzePCiBJWMWP36d2NMPvuA2GMlwhGyfe+UWrUosF2lB39MI7mUbRTT
 tCWQ==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkNQIGludHJvZHVjZWQgYSBzcGVj
aWFsIHVubWFwX3F1ZXVlcyBwYWNrZXQgZm9yIGdmeCBwcmVlbXRpb24uCgpBY2tlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8g
PEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dmeC5jIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4Lmgg
fCAxMSArKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZnguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwppbmRleCBj
NzkzYjY5MTQ5NTcuLjBiNTk1YjYzNTIwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZnguYwpAQCAtNDQ1LDcgKzQ0NSw4IEBAIGludCBhbWRncHVfZ2Z4X2Rpc2FibGVfa2Nx
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWZvciAo
aSA9IDA7IGkgPCBhZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3M7IGkrKykKLQkJa2lxLT5wbWYt
PmtpcV91bm1hcF9xdWV1ZXMoa2lxX3JpbmcsICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldLCB0
cnVlKTsKKwkJa2lxLT5wbWYtPmtpcV91bm1hcF9xdWV1ZXMoa2lxX3JpbmcsICZhZGV2LT5nZngu
Y29tcHV0ZV9yaW5nW2ldLAorCQkJCQkgICBSRVNFVF9RVUVVRVMsIDAsIDApOwogCiAJcmV0dXJu
IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhraXFfcmluZyk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggNDI3MzBhZGJlZmNmLi5mOTY0MDdiYTk3NzAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTU1LDYgKzU1LDEzIEBAIHN0
cnVjdCBhbWRncHVfbWVjIHsKIAlERUNMQVJFX0JJVE1BUChxdWV1ZV9iaXRtYXAsIEFNREdQVV9N
QVhfQ09NUFVURV9RVUVVRVMpOwogfTsKIAorZW51bSBhbWRncHVfdW5tYXBfcXVldWVzX2FjdGlv
biB7CisJUFJFRU1QVF9RVUVVRVMgPSAwLAorCVJFU0VUX1FVRVVFUywKKwlESVNBQkxFX1BST0NF
U1NfUVVFVUVTLAorCVBSRUVNUFRfUVVFVUVTX05PX1VOTUFQLAorfTsKKwogc3RydWN0IGtpcV9w
bTRfZnVuY3MgewogCS8qIFN1cHBvcnQgQVNJQy1zcGVjaWZpYyBraXEgcG00IHBhY2tldHMqLwog
CXZvaWQgKCpraXFfc2V0X3Jlc291cmNlcykoc3RydWN0IGFtZGdwdV9yaW5nICpraXFfcmluZywK
QEAgLTYyLDcgKzY5LDkgQEAgc3RydWN0IGtpcV9wbTRfZnVuY3MgewogCXZvaWQgKCpraXFfbWFw
X3F1ZXVlcykoc3RydWN0IGFtZGdwdV9yaW5nICpraXFfcmluZywKIAkJCQkJc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nKTsKIAl2b2lkICgqa2lxX3VubWFwX3F1ZXVlcykoc3RydWN0IGFtZGdwdV9y
aW5nICpraXFfcmluZywKLQkJCQkgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBib29sIHJlc2V0
KTsKKwkJCQkgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAorCQkJCSBlbnVtIGFtZGdwdV91bm1h
cF9xdWV1ZXNfYWN0aW9uIGFjdGlvbiwKKwkJCQkgdTY0IGdwdV9hZGRyLCB1NjQgc2VxKTsKIAl2
b2lkICgqa2lxX3F1ZXJ5X3N0YXR1cykoc3RydWN0IGFtZGdwdV9yaW5nICpraXFfcmluZywKIAkJ
CQkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogCQkJCQl1NjQgYWRkciwKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
