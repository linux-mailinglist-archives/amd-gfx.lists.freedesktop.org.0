Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04896B7D7C
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 17:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1F6F78E;
	Thu, 19 Sep 2019 15:04:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F7B6F78E
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 15:04:14 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n7so4626066qtb.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M8jzHiMtpS/ljpaoS4dIH27fsDYrnw/X90dJarqIO3k=;
 b=Ui2NNNgS1yihE1kxBsHwd5vaHzO0v9rVbZ2stpA6LfDxim5iC0TCiDOALxUb1RnwNr
 +bYYJy2VtsZTVNkbxVy+c2mAUvQ+/2apa5a2n+poQ1pIO/VIqK9OM5+M/s8fiKIV1bik
 H08tPnijDEGUWQQegnBY4C1BQjwjHMT6pVt6dcvJNxMEWRDUfT87V+fhrlo5DslP//92
 CQHo5C9ksiyg7GGxFuRNSHewYhDX8XbP4vD7UAPmcZzGQjvsluvJ9BJFzhY5L4qdj63e
 prOe/ThZuBJYuypJ07UwRBKwtM+yPDpr9edok0/jptwmkYkup5p/rU6a0h3aEepe3l9R
 kE4g==
X-Gm-Message-State: APjAAAWzKFXJp7ZvBhtQ1khjclRmgMFB/33ItYP/o3YUhOm8fAf5sPeJ
 sBUZdfLVD366FPOYoPb4EU7a1o7m
X-Google-Smtp-Source: APXvYqx/Qp4edjXQEXE/leeFZckBdiqHRCswrr37AjhmvTyWhwGZ3std1l4l5PQskjcnHdRod4xwqg==
X-Received: by 2002:ac8:2a75:: with SMTP id l50mr3645692qtl.137.1568905452907; 
 Thu, 19 Sep 2019 08:04:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id d23sm4808134qkc.127.2019.09.19.08.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 08:04:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/gfx10: add workaround for register aliasing bug
Date: Thu, 19 Sep 2019 10:03:42 -0500
Message-Id: <20190919150342.6872-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M8jzHiMtpS/ljpaoS4dIH27fsDYrnw/X90dJarqIO3k=;
 b=J6qfQXwBgH40jHN1RGSNP/xRABJVP3HAhb7JBEODEuFlbEnTi9wQsV/71MAEgZehPm
 niRZTYYg3l2EF7VL+4kiVlwrvrhN5tQgDt9mQ5nhl3lXezHeMrB66anSzF+S/Mg1uMYu
 fSM/CQG6AAaKgA46ZLsBqeOs0aF7zUOLG5HNvRP1tCtvD7vLjZpoEqyU4leXSHf8lBnR
 QZILID+Yhiv8H2drfDg+ViSw3FLbznyiIpGeiQfkPM6ol0rMerIjFd4+AXR3vz/3MoKg
 2bda6TAUYOiWnpD1nzGJyjfpsaB/1yllJUwvYQ+Z68ujCH6KXoItRyDbWbKy7ar1v8ok
 1exQ==
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

V2UgbmVlZCBhIHNwZWNpYWwgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgZm9yIHVwZGF0aW5nCm1tVVRD
TDFfQ0dUVF9DTEtfQ1RSTCBnb2xkZW4gc2V0dGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA5NiArKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggZGIyODgyMzg5MWFjLi4yNGY1ZTkyOGU3
YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC0zNTMsMzIgKzM1
Myw5MiBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2V0X2tpcV9wbTRfZnVuY3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJYWRldi0+Z2Z4LmtpcS5wbWYgPSAmZ2Z4X3YxMF8wX2tpcV9w
bTRfZnVuY3M7CiB9CiAKKy8qKgorICogZ2Z4X3YxMF8wX3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVu
Y2UgLSBwcm9ncmFtIGFuIGFycmF5IG9mIHJlZ2lzdGVycy4KKyAqCisgKiBAYWRldjogYW1kZ3B1
X2RldmljZSBwb2ludGVyCisgKiBAcmVnczogcG9pbnRlciB0byB0aGUgcmVnaXN0ZXIgYXJyYXkK
KyAqIEBhcnJheV9zaXplOiBzaXplIG9mIHRoZSByZWdpc3RlciBhcnJheQorICoKKyAqIFByb2dy
YW1zIGFuIGFycmF5IG9yIHJlZ2lzdGVycyB3aXRoIGFuZCBhbmQgb3IgbWFza3MuCisgKiBUaGlz
IGlzIGEgaGVscGVyIGZvciBzZXR0aW5nIGdvbGRlbiByZWdpc3RlcnMuCisgKi8KKworc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2Uoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCisJCQkJCQljb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiAqcmVncywK
KwkJCQkJCWNvbnN0IHUzMiBhcnJheV9zaXplKQoreworCWNvbnN0IHN0cnVjdCBzb2MxNV9yZWdf
Z29sZGVuICplbnRyeTsKKwl1MzIgdG1wLCByZWcsIGdjcmQgPSAwOworCWludCBpOworCisJZm9y
IChpID0gMDsgaSA8IGFycmF5X3NpemU7ICsraSkgeworCQllbnRyeSA9ICZyZWdzW2ldOworCQly
ZWcgPSAgYWRldi0+cmVnX29mZnNldFtlbnRyeS0+aHdpcF1bZW50cnktPmluc3RhbmNlXVtlbnRy
eS0+c2VnbWVudF0gKyBlbnRyeS0+cmVnOworCisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9OQVZJMTAgfHwKKwkJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxNCB8fAorCQkg
ICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEyKSB7CisJCQkvKiBOYXZpMXggaGFzIGFu
IGFsaWFzaW5nIGJ1ZyBiZXR3ZWVuIHRoZXNlIHR3byByZWdpc3RlcnMuCisJCQkgKiBXcml0ZXMg
dG8gbW1VVENMMV9DR1RUX0NMS19DVFJMIHdpbGwgY2hhbmdlIGJvdGgKKwkJCSAqIG1tVVRDTDFf
Q0dUVF9DTEtfQ1RSTCBhbmQgbW1HQ1JEX1NBX1RBUkdFVFNfRElTQUJMRS4KKwkJCSAqIFJlYWRz
IGZyb20gbW1VVENMMV9DR1RUX0NMS19DVFJMIHdpbGwgaGF2ZSBpbmNvcnJlY3QgZGF0YQorCQkJ
ICogaWYgbW1HQ1JEX1NBX1RBUkdFVFNfRElTQUJMRSBpcyBub24tMC4gUmVhZHMgYW5kIHdyaXRl
cworCQkJICogZnJvbS90byBtbUdDUkRfU0FfVEFSR0VUU19ESVNBQkxFIHdpbGwgYmUgY29ycmVj
dC4KKwkJCSAqLworCQkJaWYgKHJlZyA9PSBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVVUQ0wx
X0NHVFRfQ0xLX0NUUkwpKSB7CisJCQkJZ2NyZCA9IFJSRUczMl9TT0MxNShHQywgMCwgbW1HQ1JE
X1NBX1RBUkdFVFNfRElTQUJMRSk7CisJCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdDUkRfU0Ff
VEFSR0VUU19ESVNBQkxFLCAwKTsKKwkJCX0KKwkJfQorCisJCWlmIChlbnRyeS0+YW5kX21hc2sg
PT0gMHhmZmZmZmZmZikgeworCQkJdG1wID0gZW50cnktPm9yX21hc2s7CisJCX0gZWxzZSB7CisJ
CQl0bXAgPSBSUkVHMzIocmVnKTsKKwkJCXRtcCAmPSB+KGVudHJ5LT5hbmRfbWFzayk7CisJCQl0
bXAgfD0gKGVudHJ5LT5vcl9tYXNrICYgZW50cnktPmFuZF9tYXNrKTsKKwkJfQorCisJCVdSRUcz
MihyZWcsIHRtcCk7CisKKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCB8fAor
CQkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTE0IHx8CisJCSAgICBhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9OQVZJMTIpIHsKKwkJCWlmIChyZWcgPT0gU09DMTVfUkVHX09GRlNFVChH
QywgMCwgbW1VVENMMV9DR1RUX0NMS19DVFJMKSkgeworCQkJCVdSRUczMl9TT0MxNShHQywgMCwg
bW1HQ1JEX1NBX1RBUkdFVFNfRElTQUJMRSwgZ2NyZCk7CisJCQl9CisJCX0KKwl9CisKK30KKwog
c3RhdGljIHZvaWQgZ2Z4X3YxMF8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIHsKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJ
UF9OQVZJMTA6Ci0JCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKLQkJCQkJ
CWdvbGRlbl9zZXR0aW5nc19nY18xMF8xLAotCQkJCQkJKGNvbnN0IHUzMilBUlJBWV9TSVpFKGdv
bGRlbl9zZXR0aW5nc19nY18xMF8xKSk7Ci0JCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVu
Y2UoYWRldiwKLQkJCQkJCWdvbGRlbl9zZXR0aW5nc19nY18xMF8wX252MTAsCi0JCQkJCQkoY29u
c3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzEwXzBfbnYxMCkpOworCQlnZnhf
djEwXzBfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAorCQkJCQkJICAgIGdvbGRlbl9z
ZXR0aW5nc19nY18xMF8xLAorCQkJCQkJICAgIChjb25zdCB1MzIpQVJSQVlfU0laRShnb2xkZW5f
c2V0dGluZ3NfZ2NfMTBfMSkpOworCQlnZnhfdjEwXzBfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5j
ZShhZGV2LAorCQkJCQkJICAgIGdvbGRlbl9zZXR0aW5nc19nY18xMF8wX252MTAsCisJCQkJCQkg
ICAgKGNvbnN0IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY18xMF8wX252MTApKTsK
IAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxNDoKLQkJc29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9z
ZXF1ZW5jZShhZGV2LAotCQkJCQkJZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfMSwKLQkJCQkJCShj
b25zdCB1MzIpQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMV8xKSk7Ci0JCXNvYzE1
X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKLQkJCQkJCWdvbGRlbl9zZXR0aW5nc19n
Y18xMF8xX252MTQsCi0JCQkJCQkoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdz
X2djXzEwXzFfbnYxNCkpOworCQlnZnhfdjEwXzBfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1ZW5jZShh
ZGV2LAorCQkJCQkJICAgIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xXzEsCisJCQkJCQkgICAgKGNv
bnN0IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY18xMF8xXzEpKTsKKwkJZ2Z4X3Yx
MF8wX3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCSAgICBnb2xkZW5fc2V0
dGluZ3NfZ2NfMTBfMV9udjE0LAorCQkJCQkJICAgIChjb25zdCB1MzIpQVJSQVlfU0laRShnb2xk
ZW5fc2V0dGluZ3NfZ2NfMTBfMV9udjE0KSk7CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTI6
Ci0JCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKLQkJCQkJCWdvbGRlbl9z
ZXR0aW5nc19nY18xMF8xXzIsCi0JCQkJCQkoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3Nl
dHRpbmdzX2djXzEwXzFfMikpOwotCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFk
ZXYsCi0JCQkJCQlnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMV8yX252MTIsCi0JCQkJCQkoY29uc3Qg
dTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfMl9udjEyKSk7CisJCWdmeF92
MTBfMF9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFkZXYsCisJCQkJCQkgICAgZ29sZGVuX3Nl
dHRpbmdzX2djXzEwXzFfMiwKKwkJCQkJCSAgICAoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVu
X3NldHRpbmdzX2djXzEwXzFfMikpOworCQlnZnhfdjEwXzBfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1
ZW5jZShhZGV2LAorCQkJCQkJICAgIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xXzJfbnYxMiwKKwkJ
CQkJCSAgICAoY29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfMl9u
djEyKSk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWJyZWFrOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
