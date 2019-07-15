Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4169DFE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAAC89DE3;
	Mon, 15 Jul 2019 21:24:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01189DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:56 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so17251707qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VP9IeNH8+0hzSw8zvLaidxh/2TB/v/uszDHfxMQ8Ijk=;
 b=TuG+1W3SBzjDYGFNfIle9TdD3Q4N4ujn2DOY+LZTgkoz/RTawPFaF2qwwvPW9+U7GR
 87hKNbw9zW8xTV++cBv88R/7UjJ7X4+C9V++r1FouA8QMxwaV6Yb7QDUfCbYokR34RfR
 CWRFuHSuFN8BrVdjE0gV/UqUgbJaeJO7SYFMgLMvdTfCR5qUcq9IC6czmS2WwUL93Dtk
 ljyjuhWdRgx2NZEnpiCY0vDGn1U3i1UFy7mMPWtJ3TweQKM5Y+ZW+7iZffk/x0wtMYp7
 VDB23J1A/WJkO4Jgnz7rQnVRf+ZJaUlV2aZThtiG9T8QFpIKBlSXo5RmehR0JoPZHtNp
 C/aQ==
X-Gm-Message-State: APjAAAWSxj8bogyvAPv8XgJ9bp+fhcQfPk0+5byl4imuEskq68en6VhZ
 S91heRWZq1tNa5RiyjRk9Syk8wJn
X-Google-Smtp-Source: APXvYqzYAp/CJlAq3JuiE5SPjf7o0u8hrv6yNRkNqZb0M4fYUF3lAZmZMKAhGU28JsJl8Y8xgYVAPw==
X-Received: by 2002:ac8:2410:: with SMTP id c16mr19671514qtc.108.1563225895040; 
 Mon, 15 Jul 2019 14:24:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 011/102] drm/amdgpu: use new mmhub interfaces for Arcturus
Date: Mon, 15 Jul 2019 16:23:06 -0500
Message-Id: <20190715212437.31793-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VP9IeNH8+0hzSw8zvLaidxh/2TB/v/uszDHfxMQ8Ijk=;
 b=GU0G/4rJI20oX82UBT5Ug7llH1o/k3La0m5nweST+SKA6AxoL0JsH+qemRFq/i37Oi
 /LVkq1BhW3Ww9AbXAqOhtyz5NtzmrOxBDH9vKDoW3E50LsEQ4w6kN5G3um+43WAnvtRs
 yBlkEwlBT17HZ2p3jB+O9dGgyaiwcP+d7ElS41BAxKRq4BG0BAwvTjXtRb27OOQ/SLwb
 GR6BhUHcmnEq7Z6w60WWgNsgaYvMs1Wi5PvVC0pX6GvxP09rG/vVOQdncYCCfj9IHBwU
 5cPZZ3fmSZNXXuNiVi3qC6XMpu0HWuo1yDO9yqzSeJgC0P5f9R8IKc0sXjlOB17SmLOm
 y1DA==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IFNub3cgWmhhbmcgPCBTbm93LlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMzUgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBmZDIyZWFiYTgw
ZTIuLmEwZmRmY2I1ZDMzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBA
IC00NCw2ICs0NCw3IEBACiAjaW5jbHVkZSAiZ2Z4aHViX3YxXzAuaCIKICNpbmNsdWRlICJtbWh1
Yl92MV8wLmgiCiAjaW5jbHVkZSAiZ2Z4aHViX3YxXzEuaCIKKyNpbmNsdWRlICJtbWh1Yl92OV80
LmgiCiAKICNpbmNsdWRlICJpdnNyY2lkL3ZtYy9pcnFzcmNzX3ZtY18xXzAuaCIKIApAQCAtODAz
LDggKzgwNCwxMiBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF92cmFtX2d0dF9sb2NhdGlvbihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJc3RydWN0IGFtZGdwdV9nbWMgKm1jKQogewog
CXU2NCBiYXNlID0gMDsKLQlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkKLQkJYmFzZSA9IG1t
aHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOworCWlmICghYW1kZ3B1X3NyaW92X3ZmKGFk
ZXYpKSB7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKKwkJCWJhc2Ug
PSBtbWh1Yl92OV80X2dldF9mYl9sb2NhdGlvbihhZGV2KTsKKwkJZWxzZQorCQkJYmFzZSA9IG1t
aHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOworCX0KIAkvKiBhZGQgdGhlIHhnbWkgb2Zm
c2V0IG9mIHRoZSBwaHlzaWNhbCBub2RlICovCiAJYmFzZSArPSBhZGV2LT5nbWMueGdtaS5waHlz
aWNhbF9ub2RlX2lkICogYWRldi0+Z21jLnhnbWkubm9kZV9zZWdtZW50X3NpemU7CiAJYW1kZ3B1
X2dtY192cmFtX2xvY2F0aW9uKGFkZXYsIG1jLCBiYXNlKTsKQEAgLTk3MCw3ICs5NzUsMTAgQEAg
c3RhdGljIGludCBnbWNfdjlfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAogCWdmeGh1
Yl92MV8wX2luaXQoYWRldik7Ci0JbW1odWJfdjFfMF9pbml0KGFkZXYpOworCWlmIChhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKKwkJbW1odWJfdjlfNF9pbml0KGFkZXYpOworCWVs
c2UKKwkJbW1odWJfdjFfMF9pbml0KGFkZXYpOwogCiAJc3Bpbl9sb2NrX2luaXQoJmFkZXYtPmdt
Yy5pbnZhbGlkYXRlX2xvY2spOwogCkBAIC0xMTkwLDcgKzExOTgsMTAgQEAgc3RhdGljIGludCBn
bWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAocikK
IAkJcmV0dXJuIHI7CiAKLQlyID0gbW1odWJfdjFfMF9nYXJ0X2VuYWJsZShhZGV2KTsKKwlpZiAo
YWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMpCisJCXIgPSBtbWh1Yl92OV80X2dhcnRf
ZW5hYmxlKGFkZXYpOworCWVsc2UKKwkJciA9IG1taHViX3YxXzBfZ2FydF9lbmFibGUoYWRldik7
CiAJaWYgKHIpCiAJCXJldHVybiByOwogCkBAIC0xMjExLDcgKzEyMjIsMTAgQEAgc3RhdGljIGlu
dCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJdmFs
dWUgPSB0cnVlOwogCiAJZ2Z4aHViX3YxXzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0KGFkZXYs
IHZhbHVlKTsKLQltbWh1Yl92MV8wX3NldF9mYXVsdF9lbmFibGVfZGVmYXVsdChhZGV2LCB2YWx1
ZSk7CisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKQorCQltbWh1Yl92OV80
X3NldF9mYXVsdF9lbmFibGVfZGVmYXVsdChhZGV2LCB2YWx1ZSk7CisJZWxzZQorCQltbWh1Yl92
MV8wX3NldF9mYXVsdF9lbmFibGVfZGVmYXVsdChhZGV2LCB2YWx1ZSk7CiAJZ21jX3Y5XzBfZmx1
c2hfZ3B1X3RsYihhZGV2LCAwLCAwKTsKIAogCURSTV9JTkZPKCJQQ0lFIEdBUlQgb2YgJXVNIGVu
YWJsZWQgKHRhYmxlIGF0IDB4JTAxNmxsWCkuXG4iLApAQCAtMTI1Miw3ICsxMjY2LDEwIEBAIHN0
YXRpYyBpbnQgZ21jX3Y5XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiBzdGF0aWMgdm9pZCBnbWNf
djlfMF9nYXJ0X2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJZ2Z4aHVi
X3YxXzBfZ2FydF9kaXNhYmxlKGFkZXYpOwotCW1taHViX3YxXzBfZ2FydF9kaXNhYmxlKGFkZXYp
OworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKKwkJbW1odWJfdjlfNF9n
YXJ0X2Rpc2FibGUoYWRldik7CisJZWxzZQorCQltbWh1Yl92MV8wX2dhcnRfZGlzYWJsZShhZGV2
KTsKIAlhbWRncHVfZ2FydF90YWJsZV92cmFtX3VucGluKGFkZXYpOwogfQogCkBAIC0xMzE3LDYg
KzEzMzQsOSBAQCBzdGF0aWMgaW50IGdtY192OV8wX3NldF9jbG9ja2dhdGluZ19zdGF0ZSh2b2lk
ICpoYW5kbGUsCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKiloYW5kbGU7CiAKKwlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVS
VVMpCisJCXJldHVybiAwOworCiAJcmV0dXJuIG1taHViX3YxXzBfc2V0X2Nsb2NrZ2F0aW5nKGFk
ZXYsIHN0YXRlKTsKIH0KIApAQCAtMTMyNCw2ICsxMzQ0LDkgQEAgc3RhdGljIHZvaWQgZ21jX3Y5
XzBfZ2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwgdTMyICpmbGFncykKIHsKIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRs
ZTsKIAorCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKKwkJcmV0dXJuOwor
CiAJbW1odWJfdjFfMF9nZXRfY2xvY2tnYXRpbmcoYWRldiwgZmxhZ3MpOwogfQogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
