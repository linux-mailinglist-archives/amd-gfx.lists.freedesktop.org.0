Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5988311
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 21:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282546EE86;
	Fri,  9 Aug 2019 19:00:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D56EE85
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 19:00:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z4so96896159qtc.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 12:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZ9BTaeox37ydkptrHm/QvQqxUO5fChCMn4N3tOrN+s=;
 b=qlJTyQFkuDHx/m/PGlfvZdvWTpwHTe5Zr+42sqJpnLr3GwMv3G40sTmonEL0N3VdjW
 EvV8ve6loSZbMhdiVWFGxaukOkcTAsYc+OpkqMtZatWCBYPa05lsybvpuX24lgjKYh7Q
 Z9f8kfWVO3UfZblCrvu48GAGT4TEZSwi82rvtM7L8Y+xdACWEPWM1dDnRNw2R9BtUW4e
 JdsSuPKwdwwGUMEBLycknWQ2YSbrMEyg9mHVgBuLEdTj9fRDBdHI0UVCH768t4MNxqVZ
 jMZT45PitM7+bcnB9/fsZoblnwiXUqLId0czoTFtZkMuvyV/mhYDTUtFcJAKSzpIWN5b
 LmYg==
X-Gm-Message-State: APjAAAWm3npSexi6qc9yB0nrW2MeOyYetOGIGXkvDaXhMrQyrXc+3Eng
 0H6stM0KQjVZTzWSvq3puiLICA+K
X-Google-Smtp-Source: APXvYqzwr/BpVBJbgC+Ywxme5DMyleoj7fmSlTsICIgV55d6oMqCPJjV8dRSCndNnITdP4AIZeEuxg==
X-Received: by 2002:aed:2c84:: with SMTP id g4mr16006762qtd.344.1565377201801; 
 Fri, 09 Aug 2019 12:00:01 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id i74sm5984619qke.133.2019.08.09.12.00.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 12:00:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: use kvmalloc for dc_state (v2)
Date: Fri,  9 Aug 2019 13:59:52 -0500
Message-Id: <20190809185952.3656-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZ9BTaeox37ydkptrHm/QvQqxUO5fChCMn4N3tOrN+s=;
 b=ZKYwVmiS5WLvis7GL9pV1fp8B+PpQK2HpOQRzKJmD8sojNjsJWL1qX2vdJxVawv3Vw
 GWCXxm8DyOkOD6eCZUsYTJEboX2AbI5lqpMq8otPTMAyHoMQh6SGzkDZCmMCRlE73jwW
 Fy0bDXczKp78LUeaL/goyOw0VLdwd085oTe6sDKO07Yy3i0xdr1gj6vRHe8bWvxBu1rg
 ECH7i5aIAjyx/xAu+lBn8n6ke0AYn9I6opZ5iW1iyhm3c2yr9OD85dUFyuQXiLYUcZrf
 g1l7ciiSp47UBA6GDQjxJGrmlF12lwF4J6L9Qz5gdOUcDm9SPBYk2IqLgcesP9HHINWG
 tUyA==
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

SXQncyBsYXJnZSBhbmQgZG9lc24ndCBuZWVkIGNvbnRpZ3VvdXMgbWVtb3J5LiAgRml4ZXMKYWxs
b2NhdGlvbiBmYWlsdXJlcyBpbiBzb21lIGNhc2VzLgoKdjI6IGt2ZnJlZSB0aGUgbWVtb3J5LgoK
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxMSArKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCAyNTJiNjIxZDkzYTku
LjIxZmI3ZWUxN2M5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
CkBAIC0yMyw2ICsyMyw3IEBACiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNs
dWRlIDxsaW51eC9tbS5oPgogCiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKIApAQCAtMTE4Myw4
ICsxMTg0LDggQEAgYm9vbCBkY19wb3N0X3VwZGF0ZV9zdXJmYWNlc190b19zdHJlYW0oc3RydWN0
IGRjICpkYykKIAogc3RydWN0IGRjX3N0YXRlICpkY19jcmVhdGVfc3RhdGUoc3RydWN0IGRjICpk
YykKIHsKLQlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQgPSBremFsbG9jKHNpemVvZihzdHJ1Y3Qg
ZGNfc3RhdGUpLAotCQkJCQkgICBHRlBfS0VSTkVMKTsKKwlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRl
eHQgPSBrdnphbGxvYyhzaXplb2Yoc3RydWN0IGRjX3N0YXRlKSwKKwkJCQkJICAgIEdGUF9LRVJO
RUwpOwogCiAJaWYgKCFjb250ZXh0KQogCQlyZXR1cm4gTlVMTDsKQEAgLTEyMDQsMTEgKzEyMDUs
MTEgQEAgc3RydWN0IGRjX3N0YXRlICpkY19jcmVhdGVfc3RhdGUoc3RydWN0IGRjICpkYykKIHN0
cnVjdCBkY19zdGF0ZSAqZGNfY29weV9zdGF0ZShzdHJ1Y3QgZGNfc3RhdGUgKnNyY19jdHgpCiB7
CiAJaW50IGksIGo7Ci0Jc3RydWN0IGRjX3N0YXRlICpuZXdfY3R4ID0ga21lbWR1cChzcmNfY3R4
LAotCQkJc2l6ZW9mKHN0cnVjdCBkY19zdGF0ZSksIEdGUF9LRVJORUwpOworCXN0cnVjdCBkY19z
dGF0ZSAqbmV3X2N0eCA9IGt2bWFsbG9jKHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLCBHRlBfS0VS
TkVMKTsKIAogCWlmICghbmV3X2N0eCkKIAkJcmV0dXJuIE5VTEw7CisJbWVtY3B5KG5ld19jdHgs
IHNyY19jdHgsIHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpKTsKIAogCWZvciAoaSA9IDA7IGkgPCBN
QVhfUElQRVM7IGkrKykgewogCQkJc3RydWN0IHBpcGVfY3R4ICpjdXJfcGlwZSA9ICZuZXdfY3R4
LT5yZXNfY3R4LnBpcGVfY3R4W2ldOwpAQCAtMTI0Miw3ICsxMjQzLDcgQEAgc3RhdGljIHZvaWQg
ZGNfc3RhdGVfZnJlZShzdHJ1Y3Qga3JlZiAqa3JlZikKIHsKIAlzdHJ1Y3QgZGNfc3RhdGUgKmNv
bnRleHQgPSBjb250YWluZXJfb2Yoa3JlZiwgc3RydWN0IGRjX3N0YXRlLCByZWZjb3VudCk7CiAJ
ZGNfcmVzb3VyY2Vfc3RhdGVfZGVzdHJ1Y3QoY29udGV4dCk7Ci0Ja2ZyZWUoY29udGV4dCk7CisJ
a3ZmcmVlKGNvbnRleHQpOwogfQogCiB2b2lkIGRjX3JlbGVhc2Vfc3RhdGUoc3RydWN0IGRjX3N0
YXRlICpjb250ZXh0KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
