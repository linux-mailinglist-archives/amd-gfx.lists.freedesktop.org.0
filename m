Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CF48F97
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E688089CB2;
	Mon, 17 Jun 2019 19:32:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6F89CF6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:35 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12188985qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPh3dXIfc/weorEqFHg4ruqVxSJNcqHAmpp5S0dczms=;
 b=IC7UqPh5UDYv2C9rdeCCDLGXSWWkcVO1ly571m4CL8srStzcxYLfF7ifkxPx8SHvS4
 6poPMtNvycnZJnMVuObtd3Zd/70uPqjT+Y47/KboATMfs0IVzwCVcsAjJyoFkJOyxJI6
 92CgPlNQq05CVxYDoRpyRl4DZxINUSIZctMZGRiXE6kmNGLkjQB8/CGjQ5Ai8BrRMX0I
 cskAHd5NSenrvzHD/KrYQ71ntL+sCubtS4MGVU3rbyAx8lZYPsXtLU0tSy+VgJJ5DuAi
 Bm3JBifMZvj0nB+12AhnXNecvRsSKPFGbtI5iULMPadkODOAtSooDwKhMCm78UWPKH8v
 5RjQ==
X-Gm-Message-State: APjAAAXMpib2cRu5FxKBX9llbt+9axeL4Yo0RWSVdiPkdDR+7qJvvQdy
 19ecOMHIwPZWZUrq6w28MMuOC/KTfpA=
X-Google-Smtp-Source: APXvYqy6RfK0gP5Wp1KX2IzKiZq/pwt0y9SQ0vpRJbbPxuKikcDIWD+Ot/5AZtnzqnIf2qDvtZzTTA==
X-Received: by 2002:ac8:444c:: with SMTP id m12mr60664qtn.306.1560799953823;
 Mon, 17 Jun 2019 12:32:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 289/459] drm/amdgpu/VCN2.0: add direct SRAM read and write
Date: Mon, 17 Jun 2019 14:30:56 -0500
Message-Id: <20190617193106.18231-90-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPh3dXIfc/weorEqFHg4ruqVxSJNcqHAmpp5S0dczms=;
 b=VkoX178PR9BTGJP+ZAD589grSy2RrR0hDlwdP/T4wbtPfPQkYMEeo4T3SOT+RiWPsx
 Mm12WfToPCRVp++vb8Wibz6lYQkfyH+65hMdE1FGbFr1gmHhYaYsDr77LV2h5mRajRhX
 jpYVOPhPwX9GthOiFGR6wpGwc1nLGSWObnaOCBrrTIgnM0qyPD9JfQQmfw5J6b9HhRgl
 ScmYicRfbbiqfTwPug+RPWdxATWq2G2oItUDYMaeHKBOeFP4nI7+iLxSJoZmDdDk2wtE
 t5miiGGP3Qv55vlZHyvqPS1IK2K54JYT60V0li6AnxIbugfDSMFlQDu9WK+1gNc0/sjD
 /Ppg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVGhpcyB3aWxsIGJlIHRoZSBiYXNpYyBh
bmQgdXNlZCBmb3IgRFBHIG1vZGUKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggfCA0OCArKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y24uaAppbmRleCA3YWU3MjgwYmFjNWYuLjViMzg3OThmOGJjMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaApAQCAtNDUsNiArNDUsMTEg
QEAKICNkZWZpbmUgVkNOX0VOQ19DTURfUkVHX1dSSVRFCQkweDAwMDAwMDBiCiAjZGVmaW5lIFZD
Tl9FTkNfQ01EX1JFR19XQUlUCQkweDAwMDAwMDBjCiAKKyNkZWZpbmUgVkNOX1ZJRF9TT0NfQURE
UkVTU18yXzAgCTB4MWZhMDAKKyNkZWZpbmUgVkNOX0FPTl9TT0NfQUREUkVTU18yXzAgCTB4MWY4
MDAKKyNkZWZpbmUgVkNOX1ZJRF9JUF9BRERSRVNTXzJfMAkJMHgwCisjZGVmaW5lIFZDTl9BT05f
SVBfQUREUkVTU18yXzAJCTB4MzAwMDAKKwogI2RlZmluZSBSUkVHMzJfU09DMTVfRFBHX01PREUo
aXAsIGluc3QsIHJlZywgbWFzaywgc3JhbV9zZWwpIAkJCQlcCiAJKHsJV1JFRzMyX1NPQzE1KGlw
LCBpbnN0LCBtbVVWRF9EUEdfTE1BX01BU0ssIG1hc2spOyAJCQlcCiAJCVdSRUczMl9TT0MxNShp
cCwgaW5zdCwgbW1VVkRfRFBHX0xNQV9DVEwsIAkJCQlcCkBAIC02Niw2ICs3MSw0OSBAQAogCQkJ
KHNyYW1fc2VsIDw8IFVWRF9EUEdfTE1BX0NUTF9fU1JBTV9TRUxfX1NISUZUKSk7IAkJXAogCX0g
d2hpbGUgKDApCiAKKyNkZWZpbmUgU09DMTVfRFBHX01PREVfT0ZGU0VUXzJfMChpcCwgaW5zdCwg
cmVnKSAJCQkJCQlcCisJKHsJCQkJCQkJCQkJCVwKKwkJdWludDMyX3QgaW50ZXJuYWxfcmVnX29m
ZnNldCwgYWRkcjsJCQkJCQlcCisJCWJvb2wgdmlkZW9fcmFuZ2UsIGFvbl9yYW5nZTsJCQkJCQkJ
XAorCQkJCQkJCQkJCQkJXAorCQlhZGRyID0gKGFkZXYtPnJlZ19vZmZzZXRbaXAjI19IV0lQXVtp
bnN0XVtyZWcjI19CQVNFX0lEWF0gKyByZWcpOwkJXAorCQlhZGRyIDw8PSAyOyAJCQkJCQkJCQlc
CisJCXZpZGVvX3JhbmdlID0gKCgoKDB4RkZGRkYgJiBhZGRyKSA+PSAoVkNOX1ZJRF9TT0NfQURE
UkVTU18yXzApKSAmJiAJCVwKKwkJCQkoKDB4RkZGRkYgJiBhZGRyKSA8ICgoVkNOX1ZJRF9TT0Nf
QUREUkVTU18yXzAgKyAweDI2MDApKSkpKTsJXAorCQlhb25fcmFuZ2UgICA9ICgoKCgweEZGRkZG
ICYgYWRkcikgPj0gKFZDTl9BT05fU09DX0FERFJFU1NfMl8wKSkgJiYgCQlcCisJCQkJKCgweEZG
RkZGICYgYWRkcikgPCAoKFZDTl9BT05fU09DX0FERFJFU1NfMl8wICsgMHg2MDApKSkpKTsJXAor
CQlpZiAodmlkZW9fcmFuZ2UpIAkJCQkJCQkJXAorCQkJaW50ZXJuYWxfcmVnX29mZnNldCA9ICgo
MHhGRkZGRiAmIGFkZHIpIC0gKFZDTl9WSURfU09DX0FERFJFU1NfMl8wKSArIAlcCisJCQkJKFZD
Tl9WSURfSVBfQUREUkVTU18yXzApKTsJCQkJCVwKKwkJZWxzZSBpZiAoYW9uX3JhbmdlKQkJCQkJ
CQkJXAorCQkJaW50ZXJuYWxfcmVnX29mZnNldCA9ICgoMHhGRkZGRiAmIGFkZHIpIC0gKFZDTl9B
T05fU09DX0FERFJFU1NfMl8wKSArIAlcCisJCQkJKFZDTl9BT05fSVBfQUREUkVTU18yXzApKTsJ
CQkJCVwKKwkJZWxzZQkJCQkJCQkJCQlcCisJCQlpbnRlcm5hbF9yZWdfb2Zmc2V0ID0gKDB4RkZG
RkYgJiBhZGRyKTsJCQkJCVwKKwkJCQkJCQkJCQkJCVwKKwkJaW50ZXJuYWxfcmVnX29mZnNldCA+
Pj0gMjsJCQkJCQkJXAorCX0pCisKKyNkZWZpbmUgUlJFRzMyX1NPQzE1X0RQR19NT0RFXzJfMChv
ZmZzZXQsIG1hc2tfZW4pIAkJCQkJCVwKKwkoeyAJCQkJCQkJCQkJCVwKKwkJV1JFRzMyX1NPQzE1
KFZDTiwgMCwgbW1VVkRfRFBHX0xNQV9DVEwsIAkJCQkJXAorCQkJKDB4MCA8PCBVVkRfRFBHX0xN
QV9DVExfX1JFQURfV1JJVEVfX1NISUZUIHwgCQkJCVwKKwkJCW1hc2tfZW4gPDwgVVZEX0RQR19M
TUFfQ1RMX19NQVNLX0VOX19TSElGVCB8IAkJCQlcCisJCQlvZmZzZXQgPDwgVVZEX0RQR19MTUFf
Q1RMX19SRUFEX1dSSVRFX0FERFJfX1NISUZUKSk7IAkJCVwKKwkJUlJFRzMyX1NPQzE1KFZDTiwg
MCwgbW1VVkRfRFBHX0xNQV9EQVRBKTsgCQkJCQlcCisJfSkKKworI2RlZmluZSBXUkVHMzJfU09D
MTVfRFBHX01PREVfMl8wKG9mZnNldCwgdmFsdWUsIG1hc2tfZW4sIGluZGlyZWN0KQkJCQlcCisJ
ZG8geyAJCQkJCQkJCQkJCVwKKwkJaWYgKCFpbmRpcmVjdCkgeyAJCQkJCQkJCVwKKwkJCVdSRUcz
Ml9TT0MxNShWQ04sIDAsIG1tVVZEX0RQR19MTUFfREFUQSwgdmFsdWUpOyAJCQlcCisJCQlXUkVH
MzJfU09DMTUoVkNOLCAwLCBtbVVWRF9EUEdfTE1BX0NUTCwgCQkJCVwKKwkJCQkoMHgxIDw8IFVW
RF9EUEdfTE1BX0NUTF9fUkVBRF9XUklURV9fU0hJRlQgfCAJCQlcCisJCQkJIG1hc2tfZW4gPDwg
VVZEX0RQR19MTUFfQ1RMX19NQVNLX0VOX19TSElGVCB8IAkJCVwKKwkJCQkgb2Zmc2V0IDw8IFVW
RF9EUEdfTE1BX0NUTF9fUkVBRF9XUklURV9BRERSX19TSElGVCkpOyAJCVwKKwkJfSAJCQkJCQkJ
CQkJXAorCX0gd2hpbGUgKDApCisKIGVudW0gZW5naW5lX3N0YXR1c19jb25zdGFudHMgewogCVVW
RF9QR0ZTTV9TVEFUVVNfX1VWRE1fVVZEVV9QV1JfT04gPSAweDJBQUFBMCwKIAlVVkRfUEdGU01f
U1RBVFVTX19VVkRNX1VWRFVfUFdSX09OXzJfMCA9IDB4QUFBQTAsCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
