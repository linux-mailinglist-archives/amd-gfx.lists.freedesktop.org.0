Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C3948F92
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4289D4D;
	Mon, 17 Jun 2019 19:32:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244689D46
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x18so6933542qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wDK+lv4uXwNcw5SHcTIsV15TSr+usoJvClAfsLL+lxU=;
 b=hbH1Ff3qL2yRNDoSS+HGKAaS+Rnxsdek+g9KZKfp2s1bmMwwN98fpowMcuzZ3Tra3x
 6OaJA9yXyfpSmdF7PTrWjTtnWVK7PxCFDfOFNGEVATzO2TJfTKAKq3ZRHDfROdAAhdEf
 4Kv05DcCVazVZqzwvwdJ1uc4LoZmbsIhM0lXu9SowM/xuL5hMAd+z1aPCbBGY7rZpOZf
 uQrphIY5/YleNhsiEtNButtxISQhf31y0P/RVe8NQM+23m6ZyjlKiZrwIOd3OAnO1HJv
 uNwyYYWW8bp4kVbR1pIi2/QBBIc5iz6FdFb2ZvFR/PA3LqAwqLSh6aNu+w3fyk46O33p
 TctA==
X-Gm-Message-State: APjAAAVs2KeS7F3S7uxkYcrmN5UgL++DEI+rxQIUVLu8Ei8YS93ASW/j
 V7g382SzfQpZPwf6CiRlvsxTm0FFeGc=
X-Google-Smtp-Source: APXvYqwcQT0Xwm14YvafKNFaWLuhUAOd0jUSDjefKBupaYDiHP7irhyS2hT6JPMXqbTm6GinoDJbzg==
X-Received: by 2002:a05:620a:12a2:: with SMTP id
 x2mr64275917qki.133.1560799951233; 
 Mon, 17 Jun 2019 12:32:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 286/459] drm/amd/powerplay: move od_default_setting callback
 to asic file
Date: Mon, 17 Jun 2019 14:30:53 -0500
Message-Id: <20190617193106.18231-87-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wDK+lv4uXwNcw5SHcTIsV15TSr+usoJvClAfsLL+lxU=;
 b=XL+gOHrw41ynuZGnTYv0yhh4+hCwFNLcSIV+vM5MMaX6DlQKhVwF2qp1m+Fh/CKdWv
 kXwnXR2JdK1uEVKM2J+QpDkgcKIKygmlNu5qQtqaj2Ons3N/sy8EkLX8MRZvunwQ6fAe
 7lDhjWmXHUjhKbpEQx7HLerCuzzwLWpzH7ZVWXSOWUdH8Ik3CmkkUVG6glgAaqu4gQOY
 NHH2oRgL8KSLi/oNeqP3zJAOBhBgHPfLwhDlYk889vY1JnEiaRIQJba4T+ejgLA56MsD
 pJotSUraz6uQ7SnDQPdxHsVz0Ln2mwEsqDI4tWTWpDlbckrXEqGmgkkvef9hQxZUQuy3
 LbEA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBzZXQgZGVmYXVsdCBv
ZF9zZXR0aW5nIGlzIGFzaWMgcmVsYXRlZCBmdW5jdGlvbiwKc28gbW92ZSB0aGljIGNvZGUgdG8g
dmVnYTIwX3BwdCBmaWxlLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgICAgfCAgMiArLQogLi4u
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgIDcgKystCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgfCA0NCAtLS0tLS0tLS0t
LS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgICAg
fCA0MCArKysrKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCsp
LCA1MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVf
c211LmMKaW5kZXggY2ExNmVhZDQ2Mzc5Li5hMDFhY2UxYmRhMzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTkwMSw3ICs5MDEsNyBAQCBzdGF0aWMg
aW50IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCXJl
dHVybiByZXQ7CiAJfQogCi0JcmV0ID0gc211X3NldF9vZDhfZGVmYXVsdF9zZXR0aW5ncyhzbXUs
IGluaXRpYWxpemUpOworCXJldCA9IHNtdV9zZXRfZGVmYXVsdF9vZF9zZXR0aW5ncyhzbXUsIGlu
aXRpYWxpemUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDIxNTVmOTQzNWM3Mi4uODJj
MmMwMjM0N2FjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211LmgKQEAgLTYwOSw2ICs2MDksNyBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7CiAJCQkJ
CSAgICAgdWludDMyX3QgKnZhbHVlKTsKIAlpbnQgKCpnZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9y
YW5nZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHN0cnVjdCBzbXVfdGVtcGVyYXR1cmVfcmFu
Z2UgKnJhbmdlKTsKIAlpbnQgKCpnZXRfdWNsa19kcG1fc3RhdGVzKShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgKmNsb2Nrc19pbl9raHosIHVpbnQzMl90ICpudW1fc3RhdGVzKTsK
KwlpbnQgKCpzZXRfZGVmYXVsdF9vZF9zZXR0aW5ncykoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGJvb2wgaW5pdGlhbGl6ZSk7CiB9OwogCiBzdHJ1Y3Qgc211X2Z1bmNzCkBAIC02NzIsOCArNjcz
LDYgQEAgc3RydWN0IHNtdV9mdW5jcwogCWludCAoKm5vdGlmeV9zbXVfZW5hYmxlX3B3ZSkoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpOwogCWludCAoKnNldF93YXRlcm1hcmtzX2Zvcl9jbG9ja19y
YW5nZXMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCQkgICAgICAgc3RydWN0IGRtX3Bw
X3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXNfc29jMTUgKmNsb2NrX3Jhbmdlcyk7Ci0JaW50ICgq
c2V0X29kOF9kZWZhdWx0X3NldHRpbmdzKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKLQkJCQkJ
Ym9vbCBpbml0aWFsaXplKTsKIAlpbnQgKCpjb252X3Bvd2VyX3Byb2ZpbGVfdG9fcHBsaWJfd29y
a2xvYWQpKGludCBwb3dlcl9wcm9maWxlKTsKIAlpbnQgKCpnZXRfY3VycmVudF9ycG0pKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqc3BlZWQpOwogCXVpbnQzMl90ICgqZ2V0X2Zh
bl9jb250cm9sX21vZGUpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKQEAgLTczMyw4ICs3MzIs
OCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCiAJKChzbXUpLT5mdW5jcy0+c3lzdGVtX2ZlYXR1cmVzX2Nv
bnRyb2wgPyAoc211KS0+ZnVuY3MtPnN5c3RlbV9mZWF0dXJlc19jb250cm9sKChzbXUpLCAoZW4p
KSA6IDApCiAjZGVmaW5lIHNtdV9pbml0X21heF9zdXN0YWluYWJsZV9jbG9ja3Moc211KSBcCiAJ
KChzbXUpLT5mdW5jcy0+aW5pdF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzID8gKHNtdSktPmZ1bmNz
LT5pbml0X21heF9zdXN0YWluYWJsZV9jbG9ja3MoKHNtdSkpIDogMCkKLSNkZWZpbmUgc211X3Nl
dF9vZDhfZGVmYXVsdF9zZXR0aW5ncyhzbXUsIGluaXRpYWxpemUpIFwKLQkoKHNtdSktPmZ1bmNz
LT5zZXRfb2Q4X2RlZmF1bHRfc2V0dGluZ3MgPyAoc211KS0+ZnVuY3MtPnNldF9vZDhfZGVmYXVs
dF9zZXR0aW5ncygoc211KSwgKGluaXRpYWxpemUpKSA6IDApCisjZGVmaW5lIHNtdV9zZXRfZGVm
YXVsdF9vZF9zZXR0aW5ncyhzbXUsIGluaXRpYWxpemUpIFwKKwkoKHNtdSktPnBwdF9mdW5jcy0+
c2V0X2RlZmF1bHRfb2Rfc2V0dGluZ3MgPyAoc211KS0+cHB0X2Z1bmNzLT5zZXRfZGVmYXVsdF9v
ZF9zZXR0aW5ncygoc211KSwgKGluaXRpYWxpemUpKSA6IDApCiAjZGVmaW5lIHNtdV9nZXRfY3Vy
cmVudF9ycG0oc211LCBzcGVlZCkgXAogCSgoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSA/
IChzbXUpLT5mdW5jcy0+Z2V0X2N1cnJlbnRfcnBtKChzbXUpLCAoc3BlZWQpKSA6IDApCiAjZGVm
aW5lIHNtdV9zZXRfZmFuX3NwZWVkX3JwbShzbXUsIHNwZWVkKSBcCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCmluZGV4IGJiM2RhZjI3MWI3NC4uM2YxMTc2NDIwYjBl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMTM1Nyw0
OSArMTM1Nyw2IEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX2dmeF9vZmZfY29udHJvbChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGlj
IGludCBzbXVfdjExXzBfc2V0X29kOF9kZWZhdWx0X3NldHRpbmdzKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAotCQkJCQkgICAgICBib29sIGluaXRpYWxpemUpCi17Ci0Jc3RydWN0IHNtdV90YWJs
ZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+c211X3RhYmxlOwotCXN0cnVjdCBzbXVf
dGFibGUgKnRhYmxlID0gJnRhYmxlX2NvbnRleHQtPnRhYmxlc1tTTVVfVEFCTEVfT1ZFUkRSSVZF
XTsKLQlpbnQgcmV0OwotCi0JLyoqCi0JICogVE9ETzogRW5hYmxlIG92ZXJkcml2ZSBmb3IgbmF2
aTEwLCB0aGF0IHJlcGxpZXMgb24gc21jL3BwdGFibGUKLQkgKiBzdXBwb3J0LgotCSAqLwotCWlm
IChzbXUtPmFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCkKLQkJcmV0dXJuIDA7Ci0KLQlp
ZiAoaW5pdGlhbGl6ZSkgewotCQlpZiAodGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlKQot
CQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQkJdGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlID0g
a3phbGxvYyh0YWJsZS0+c2l6ZSwgR0ZQX0tFUk5FTCk7Ci0KLQkJaWYgKCF0YWJsZV9jb250ZXh0
LT5vdmVyZHJpdmVfdGFibGUpCi0JCQlyZXR1cm4gLUVOT01FTTsKLQotCQlyZXQgPSBzbXVfdXBk
YXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX09WRVJEUklWRSwKLQkJCQkgICAgICAgdGFibGVfY29u
dGV4dC0+b3ZlcmRyaXZlX3RhYmxlLCBmYWxzZSk7Ci0JCWlmIChyZXQpIHsKLQkJCXByX2Vycigi
RmFpbGVkIHRvIGV4cG9ydCBvdmVyIGRyaXZlIHRhYmxlIVxuIik7Ci0JCQlyZXR1cm4gcmV0Owot
CQl9Ci0KLQkJc211X3NldF9kZWZhdWx0X29kOF9zZXR0aW5ncyhzbXUpOwotCX0KLQotCXJldCA9
IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfT1ZFUkRSSVZFLAotCQkJICAgICAgIHRh
YmxlX2NvbnRleHQtPm92ZXJkcml2ZV90YWJsZSwgdHJ1ZSk7Ci0JaWYgKHJldCkgewotCQlwcl9l
cnIoIkZhaWxlZCB0byBpbXBvcnQgb3ZlciBkcml2ZSB0YWJsZSFcbiIpOwotCQlyZXR1cm4gcmV0
OwotCX0KLQotCXJldHVybiAwOwotfQotCiBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVu
dF9ycG0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJICAgICB1aW50MzJfdCAqY3VycmVu
dF9ycG0pCiB7CkBAIC0xNjg1LDcgKzE2NDIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNtdV9m
dW5jcyBzbXVfdjExXzBfZnVuY3MgPSB7CiAJLnNldF9kZWVwX3NsZWVwX2RjZWZjbGsgPSBzbXVf
djExXzBfc2V0X2RlZXBfc2xlZXBfZGNlZmNsaywKIAkuZGlzcGxheV9jbG9ja192b2x0YWdlX3Jl
cXVlc3QgPSBzbXVfdjExXzBfZGlzcGxheV9jbG9ja192b2x0YWdlX3JlcXVlc3QsCiAJLnNldF93
YXRlcm1hcmtzX2Zvcl9jbG9ja19yYW5nZXMgPSBzbXVfdjExXzBfc2V0X3dhdGVybWFya3NfZm9y
X2Nsb2NrX3JhbmdlcywKLQkuc2V0X29kOF9kZWZhdWx0X3NldHRpbmdzID0gc211X3YxMV8wX3Nl
dF9vZDhfZGVmYXVsdF9zZXR0aW5ncywKIAkuZ2V0X2N1cnJlbnRfcnBtID0gc211X3YxMV8wX2dl
dF9jdXJyZW50X3JwbSwKIAkuZ2V0X2Zhbl9jb250cm9sX21vZGUgPSBzbXVfdjExXzBfZ2V0X2Zh
bl9jb250cm9sX21vZGUsCiAJLnNldF9mYW5fY29udHJvbF9tb2RlID0gc211X3YxMV8wX3NldF9m
YW5fY29udHJvbF9tb2RlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jCmluZGV4IGRmZjg1MzAzYzE1ZS4uNDNmOWUyYWNiOGU2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC0xNjg5LDYgKzE2ODksNDQgQEAgc3RhdGlj
IGludCB2ZWdhMjBfZ2V0X21ldHJpY3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAK
IAlyZXR1cm4gcmV0OwogfQorCitzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGVmYXVsdF9vZF9zZXR0
aW5ncyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkJICBib29sIGluaXRpYWxpemUpCit7
CisJc3RydWN0IHNtdV90YWJsZV9jb250ZXh0ICp0YWJsZV9jb250ZXh0ID0gJnNtdS0+c211X3Rh
YmxlOworCWludCByZXQ7CisKKwlpZiAoaW5pdGlhbGl6ZSkgeworCQlpZiAodGFibGVfY29udGV4
dC0+b3ZlcmRyaXZlX3RhYmxlKQorCQkJcmV0dXJuIC1FSU5WQUw7CisKKwkJdGFibGVfY29udGV4
dC0+b3ZlcmRyaXZlX3RhYmxlID0ga3phbGxvYyhzaXplb2YoT3ZlckRyaXZlVGFibGVfdCksIEdG
UF9LRVJORUwpOworCisJCWlmICghdGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlKQorCQkJ
cmV0dXJuIC1FTk9NRU07CisKKwkJcmV0ID0gc211X3VwZGF0ZV90YWJsZShzbXUsIFNNVV9UQUJM
RV9PVkVSRFJJVkUsCisJCQkJICAgICAgIHRhYmxlX2NvbnRleHQtPm92ZXJkcml2ZV90YWJsZSwg
ZmFsc2UpOworCQlpZiAocmV0KSB7CisJCQlwcl9lcnIoIkZhaWxlZCB0byBleHBvcnQgb3ZlciBk
cml2ZSB0YWJsZSFcbiIpOworCQkJcmV0dXJuIHJldDsKKwkJfQorCisJCXJldCA9IHZlZ2EyMF9z
ZXRfZGVmYXVsdF9vZDhfc2V0dHRpbmdzKHNtdSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0
OworCX0KKworCXJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfT1ZFUkRSSVZF
LAorCQkJICAgICAgIHRhYmxlX2NvbnRleHQtPm92ZXJkcml2ZV90YWJsZSwgdHJ1ZSk7CisJaWYg
KHJldCkgeworCQlwcl9lcnIoIkZhaWxlZCB0byBpbXBvcnQgb3ZlciBkcml2ZSB0YWJsZSFcbiIp
OworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IHZlZ2Ey
MF9nZXRfb2RfcGVyY2VudGFnZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkgICAgZW51
bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUpCiB7CkBAIC0zMjI4LDExICszMjY2LDExIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB2ZWdhMjBfcHB0X2Z1bmNzID0gewogCS5wcmlu
dF9jbGtfbGV2ZWxzID0gdmVnYTIwX3ByaW50X2Nsa19sZXZlbHMsCiAJLmZvcmNlX2Nsa19sZXZl
bHMgPSB2ZWdhMjBfZm9yY2VfY2xrX2xldmVscywKIAkuZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9s
YXRlbmN5ID0gdmVnYTIwX2dldF9jbG9ja19ieV90eXBlX3dpdGhfbGF0ZW5jeSwKLQkuc2V0X2Rl
ZmF1bHRfb2Q4X3NldHRpbmdzID0gdmVnYTIwX3NldF9kZWZhdWx0X29kOF9zZXR0dGluZ3MsCiAJ
LmdldF9vZF9wZXJjZW50YWdlID0gdmVnYTIwX2dldF9vZF9wZXJjZW50YWdlLAogCS5nZXRfcG93
ZXJfcHJvZmlsZV9tb2RlID0gdmVnYTIwX2dldF9wb3dlcl9wcm9maWxlX21vZGUsCiAJLnNldF9w
b3dlcl9wcm9maWxlX21vZGUgPSB2ZWdhMjBfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKIAkuc2V0
X29kX3BlcmNlbnRhZ2UgPSB2ZWdhMjBfc2V0X29kX3BlcmNlbnRhZ2UsCisJLnNldF9kZWZhdWx0
X29kX3NldHRpbmdzID0gdmVnYTIwX3NldF9kZWZhdWx0X29kX3NldHRpbmdzLAogCS5vZF9lZGl0
X2RwbV90YWJsZSA9IHZlZ2EyMF9vZG5fZWRpdF9kcG1fdGFibGUsCiAJLmRwbV9zZXRfdXZkX2Vu
YWJsZSA9IHZlZ2EyMF9kcG1fc2V0X3V2ZF9lbmFibGUsCiAJLmRwbV9zZXRfdmNlX2VuYWJsZSA9
IHZlZ2EyMF9kcG1fc2V0X3ZjZV9lbmFibGUsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
