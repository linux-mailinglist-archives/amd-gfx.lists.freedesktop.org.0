Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6777D3747
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCCA6EB9B;
	Fri, 11 Oct 2019 01:46:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F66EB99
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:00 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c21so11606282qtj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocY8P4N7dEURxLDhm7UYIrE9JyCBjwzytg7krPwlpM0=;
 b=FS6lqbTJ2PDOCB9E+AtJp1uYmragjuKWoaI+wTyUxrK/UcfMfQcwOzXmXWRXtIP9go
 MJo+UYEW7AlkMnx2Doi42DQZmB/2EO8cb7NVNz85SeOmoRfLwE5JIvJjuaCN/jkea31p
 712PL2l7CcTlAPzZzVcRPVOWaqqeY1GfjzqLzbUeOW6peXO0wXOBBXJC2ifmlbKa9q+U
 NoWFr4OnVcq9XG2Xg2ic/ypfeNpijWjj4xXfJrgY5nTupZMAROZ8Pn/dnu8shXG3+Ebr
 ATnI8wH+DMx2WRAL7GjdVC2LNdXrAc222j1gikcO+9M5UJWHahsOZ9DakuTGeqb/yyRt
 CrTg==
X-Gm-Message-State: APjAAAXbwVb+zKZAyAM4t549AT/IH+aLtQvYtSKjzUcG9z1Xd5av/3Ta
 mG3vN7zuEwWAOXL/pk02hMugxf55
X-Google-Smtp-Source: APXvYqwBuYtFZGB/PYsJqkuzCbbtlmfifkVDdpcfuHEFCmuDZVAIenbFc+ptrvf71zCMSFoloodnlQ==
X-Received: by 2002:ac8:44d9:: with SMTP id b25mr14645899qto.300.1570758358880; 
 Thu, 10 Oct 2019 18:45:58 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 14/19] drm/amdgpu: disentangle runtime pm and vga_switcheroo
Date: Thu, 10 Oct 2019 20:45:31 -0500
Message-Id: <20191011014536.10869-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ocY8P4N7dEURxLDhm7UYIrE9JyCBjwzytg7krPwlpM0=;
 b=HphJrdLJquMXlzhOgIuVSBPPHdgmnLtgJ6yCkQ5N5OxaIUFnKMf5kYIiiyb4nOYvTO
 20u8w7t6mawI1lYpohujWzbdvrEOUOniDqaoCFZUB2H7NfgSvno0RU6u4AIZTXp3s6f0
 BQg/wXkWUtU2e4yXRoK6HQcwgqKlHujai800cHRzcdGLdp5yRroQYrrmzSQ/ZkqOEuxU
 j0vFbV1hS+Qx8xDZYd5DvJC5vtDTcBAKCLgR2xYW4oWmnRTzlkN3Zgb6H58NHIvxbY0p
 VcIwnqLEcluY3KL/ekyRiWBefoQEw31KFFpjltJvzVT310wUM/fAOF9aSh1tF9infiJC
 wgGA==
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

T3JpZ2luYWxseSB3ZSBvbmx5IHN1cHBvcnRlZCBydW50aW1lIHBtIG9uIFBYL0hHIGxhcHRvcHMK
c28gdmdhX3N3aXRjaGVyb28gYW5kIHJ1bnRpbWUgcG0gYXJlIHNvcnQgb2YgZW50YW5nbGVkLgoK
QXR0ZW1wdCB0byBsb2dpY2FsbHkgc2VwYXJhdGUgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggMGY0ZTY1ZDNiZmFmLi5j
MGNiNjgxNDU3YmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKQEAgLTI2NjIsNyArMjY2Miw3IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCSAgICAgICB1aW50MzJfdCBmbGFncykKIHsKIAlpbnQgciwg
aTsKLQlib29sIHJ1bnRpbWUgPSBmYWxzZTsKKwlib29sIGJvY28gPSBmYWxzZTsKIAl1MzIgbWF4
X01CcHM7CiAKIAlhZGV2LT5zaHV0ZG93biA9IGZhbHNlOwpAQCAtMjgzMywxMSArMjgzMywxNCBA
QCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXZn
YV9jbGllbnRfcmVnaXN0ZXIoYWRldi0+cGRldiwgYWRldiwgTlVMTCwgYW1kZ3B1X2RldmljZV92
Z2Ffc2V0X2RlY29kZSk7CiAKIAlpZiAoYW1kZ3B1X2RldmljZV9zdXBwb3J0c19ib2NvKGRkZXYp
KQotCQlydW50aW1lID0gdHJ1ZTsKLQlpZiAoIXBjaV9pc190aHVuZGVyYm9sdF9hdHRhY2hlZChh
ZGV2LT5wZGV2KSkKKwkJYm9jbyA9IHRydWU7CisJaWYgKGFtZGdwdV9oYXNfYXRweCgpICYmCisJ
ICAgIChhbWRncHVfaXNfYXRweF9oeWJyaWQoKSB8fAorCSAgICAgYW1kZ3B1X2hhc19hdHB4X2Rn
cHVfcG93ZXJfY250bCgpKSAmJgorCSAgICAhcGNpX2lzX3RodW5kZXJib2x0X2F0dGFjaGVkKGFk
ZXYtPnBkZXYpKQogCQl2Z2Ffc3dpdGNoZXJvb19yZWdpc3Rlcl9jbGllbnQoYWRldi0+cGRldiwK
LQkJCQkJICAgICAgICZhbWRncHVfc3dpdGNoZXJvb19vcHMsIHJ1bnRpbWUpOwotCWlmIChydW50
aW1lKQorCQkJCQkgICAgICAgJmFtZGdwdV9zd2l0Y2hlcm9vX29wcywgYm9jbyk7CisJaWYgKGJv
Y28pCiAJCXZnYV9zd2l0Y2hlcm9vX2luaXRfZG9tYWluX3BtX29wcyhhZGV2LT5kZXYsICZhZGV2
LT52Z2FfcG1fZG9tYWluKTsKIAogCWlmIChhbWRncHVfZW11X21vZGUgPT0gMSkgewpAQCAtMzAx
NCw3ICszMDE3LDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAogZmFpbGVkOgogCWFtZGdwdV92Zl9lcnJvcl90cmFuc19hbGwoYWRldik7Ci0J
aWYgKHJ1bnRpbWUpCisJaWYgKGJvY28pCiAJCXZnYV9zd2l0Y2hlcm9vX2ZpbmlfZG9tYWluX3Bt
X29wcyhhZGV2LT5kZXYpOwogCiAJcmV0dXJuIHI7CkBAIC0zMDYxLDkgKzMwNjQsMTIgQEAgdm9p
ZCBhbWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlrZnJl
ZShhZGV2LT5iaW9zKTsKIAlhZGV2LT5iaW9zID0gTlVMTDsKLQlpZiAoIXBjaV9pc190aHVuZGVy
Ym9sdF9hdHRhY2hlZChhZGV2LT5wZGV2KSkKKwlpZiAoYW1kZ3B1X2hhc19hdHB4KCkgJiYKKwkg
ICAgKGFtZGdwdV9pc19hdHB4X2h5YnJpZCgpIHx8CisJICAgICBhbWRncHVfaGFzX2F0cHhfZGdw
dV9wb3dlcl9jbnRsKCkpICYmCisJICAgICFwY2lfaXNfdGh1bmRlcmJvbHRfYXR0YWNoZWQoYWRl
di0+cGRldikpCiAJCXZnYV9zd2l0Y2hlcm9vX3VucmVnaXN0ZXJfY2xpZW50KGFkZXYtPnBkZXYp
OwotCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19QWCkKKwlpZiAoYW1kZ3B1X2RldmljZV9zdXBw
b3J0c19ib2NvKGFkZXYtPmRkZXYpKQogCQl2Z2Ffc3dpdGNoZXJvb19maW5pX2RvbWFpbl9wbV9v
cHMoYWRldi0+ZGV2KTsKIAl2Z2FfY2xpZW50X3JlZ2lzdGVyKGFkZXYtPnBkZXYsIE5VTEwsIE5V
TEwsIE5VTEwpOwogCWlmIChhZGV2LT5yaW9fbWVtKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
