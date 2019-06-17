Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5F648E0F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDE7895E7;
	Mon, 17 Jun 2019 19:18:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384EA8955D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:23 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s15so12157137qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7wFYz8dOdhRUb/h7AeLk+HQTsvMjizu0mkMR/lYonro=;
 b=STLrWjZc/p/0NIRjeTrUMzk5zn8nUk0DsMG77LQ/1MYlC2f1igidECTPr5L93Nfu7W
 QvGNEI0f/fjUSqWOSLUUm0KrLKqOeAwsLB75mM7lwxn+5qicfX1/PAmpsKgCqQJYa0FN
 a724BzSxKf48fl5JSUrCu7v6v+wdlMuqb2SNBjyD9DDivd34IMcn8bV1AeRu56DQ2xNb
 DfIGcNqTDopUKj+ZBoC2AgPfSjxfI3ltKmycnFYTxUSGWMkK7Exy9CBOonUiLqeSyELO
 ImwPVLnk/xoY+ErNGb18hBO7IKPfGUPB0vJ19GDJOQL4JAqRYlBeLbQtlnmmvSIoG46a
 eYSg==
X-Gm-Message-State: APjAAAXVRQxhVqNZkkwnGj8GLHjiwoI1xuQNu6foDP1LOrs/anRB5Hm3
 uPNuYoSdNkCJMxqz76q2J0TydGmm7Fk=
X-Google-Smtp-Source: APXvYqzOttu8bHYPNS38HdTJ/K3f9lRyxQE6gS1YVrROSzAlDejuyX+shxCtZKni1rxPrlwkJ85DXA==
X-Received: by 2002:a0c:92ab:: with SMTP id b40mr22587999qvb.129.1560799102218; 
 Mon, 17 Jun 2019 12:18:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 083/459] drm/amdgpu: load smc ucode at first with psp while
 rlc auto load is supported
Date: Mon, 17 Jun 2019 14:10:44 -0500
Message-Id: <20190617191700.17899-72-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7wFYz8dOdhRUb/h7AeLk+HQTsvMjizu0mkMR/lYonro=;
 b=gLs3RZI+Ui2ouGojmLeZYSXoWlLRkcDVl1++ya8NsXTKZs5SiVg7TpwOsemRat/dYF
 89+3PUTsXcZ7oFwxHecO+XlFFOhz+ZTnWh7SWrWU1rC5iqffJXbVbLtrlbC9i2G74dz3
 iPiICLP04uBcviVSWBi+9skKt7qg6qbnmnMJRjYK+FPfBBVmGCetxHK5xuZARu+dedXv
 W9EgN7joZsjVNH49KPJ7mCkJz2G3HzMxa0W668lruW604c9xakBEG5knpwvCCNUqiocH
 cAod6CBGsAul3fh5tHfl46mka4ZHvJTRrfHCIyXsZncoi1jcljH1UIH3YesXTLTkwx1b
 nW1A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggbG9hZGVzIHNt
YyB1Y29kZSBhdCBmaXJzdCB3aXRoIHBzcCB3aGlsZSBybGMgYXV0byBsb2FkIGlzIHN1cHBvcnRl
ZApvbiBuYXZpMTAuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgMzUgKysrKysrKysrKysr
KysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGQ2MDA5
NzcyYWQ4ZC4uYmJjM2IwNDg4OTgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jCkBAIC05MTksMTkgKzkxOSw0NSBAQCBzdGF0aWMgaW50IHBzcF9wcmVwX2xvYWRfaXBf
ZndfY21kX2J1ZihzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2RlLAogCXJldHVybiBy
ZXQ7CiB9CiAKK3N0YXRpYyBpbnQgcHNwX2V4ZWN1dGVfbnBfZndfbG9hZChzdHJ1Y3QgcHNwX2Nv
bnRleHQgKnBzcCwKKwkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2Rl
KQoreworCWludCByZXQgPSAwOworCisJcmV0ID0gcHNwX3ByZXBfbG9hZF9pcF9md19jbWRfYnVm
KHVjb2RlLCBwc3AtPmNtZCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKworCXJldCA9IHBz
cF9jbWRfc3VibWl0X2J1Zihwc3AsIHVjb2RlLCBwc3AtPmNtZCwKKwkJCQkgcHNwLT5mZW5jZV9i
dWZfbWNfYWRkcik7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgaW50IHBzcF9ucF9md19s
b2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogewogCWludCBpLCByZXQ7CiAJc3RydWN0IGFt
ZGdwdV9maXJtd2FyZV9pbmZvICp1Y29kZTsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSogYWRldiA9
IHBzcC0+YWRldjsKIAorCWlmIChwc3AtPmF1dG9sb2FkX3N1cHBvcnRlZCkgeworCQl1Y29kZSA9
ICZhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfU01DXTsKKwkJaWYgKCF1Y29k
ZS0+ZncpCisJCQlnb3RvIG91dDsKKworCQlyZXQgPSBwc3BfZXhlY3V0ZV9ucF9md19sb2FkKHBz
cCwgdWNvZGUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKK291dDoKIAlmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+ZmlybXdhcmUubWF4X3Vjb2RlczsgaSsrKSB7CiAJCXVjb2RlID0g
JmFkZXYtPmZpcm13YXJlLnVjb2RlW2ldOwogCQlpZiAoIXVjb2RlLT5mdykKIAkJCWNvbnRpbnVl
OwogCiAJCWlmICh1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1NNQyAmJgotCQkg
ICAgcHNwX3NtdV9yZWxvYWRfcXVpcmsocHNwKSkKKwkJICAgIChwc3Bfc211X3JlbG9hZF9xdWly
ayhwc3ApIHx8IHBzcC0+YXV0b2xvYWRfc3VwcG9ydGVkKSkKIAkJCWNvbnRpbnVlOwogCQlpZiAo
YW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmCiAJCSAgICh1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BV
X1VDT0RFX0lEX1NETUEwCkBAIC05NDUsMTIgKzk3MSw3IEBAIHN0YXRpYyBpbnQgcHNwX25wX2Z3
X2xvYWQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJCQkvKiBza2lwIG1lYyBKVCB3aGVuIGF1
dG9sb2FkIGlzIGVuYWJsZWQgKi8KIAkJCWNvbnRpbnVlOwogCi0JCXJldCA9IHBzcF9wcmVwX2xv
YWRfaXBfZndfY21kX2J1Zih1Y29kZSwgcHNwLT5jbWQpOwotCQlpZiAocmV0KQotCQkJcmV0dXJu
IHJldDsKLQotCQlyZXQgPSBwc3BfY21kX3N1Ym1pdF9idWYocHNwLCB1Y29kZSwgcHNwLT5jbWQs
Ci0JCQkJCSBwc3AtPmZlbmNlX2J1Zl9tY19hZGRyKTsKKwkJcmV0ID0gcHNwX2V4ZWN1dGVfbnBf
ZndfbG9hZChwc3AsIHVjb2RlKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
