Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A31CBCD3
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968466EBA5;
	Fri,  4 Oct 2019 14:18:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E71B6EB8F
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 13:52:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q9so7303401wrm.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 06:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pvGAP3szuZrDaTjAqEj48YC4sLZ6bj0qt3p8BiCeEm4=;
 b=rSi3PGE1sZ0IFKi7PmMNIdwdbSQN4+eOMxC+bdRNGTdKQZle4pRctUidMao+mQKVH9
 zdPL4hE/IOyc+tArpDdUG+GNVZQN2mmPpyGcHOWT1pIxWT8XmdZVuJ21Aky9u8HPBWRN
 N6e/WTKVZIOOcSz4lUpcOYDG4XVD5LU5mo4ql5eiGzZr/aDgaEzbfE7YCchUqFxQNqQx
 vtDWkvkz9uQ26aHbNJEf/d5L7C/BdwSsHEupUMTQr5McDQS5ce60L9NmsFvbPWtWTXwC
 5TrslJCfNBVRRz9zK5oa2HaB2Ue6qppgdFx0eFQ+CqQRRDC+4amoNJhv7l0NPbbE3npM
 qkVA==
X-Gm-Message-State: APjAAAUSPuw6IZim0Zw7AexzqAUTxTjR4Z2iEiDMmOUPKZxfTTO69uwu
 Q/TbR4IFZW2C3r62To44Fl9mRbXLjcBCYA==
X-Google-Smtp-Source: APXvYqzwA+q73H2XKyk0WbW+O6muCHDvX2k+Wtt+RsVPs412k5XMrAeAMke4vyZgDiOaFZZnVWdjsg==
X-Received: by 2002:adf:82e6:: with SMTP id 93mr1611273wrc.244.1570197124651; 
 Fri, 04 Oct 2019 06:52:04 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F2DD2007F128F2C51923B71.dip0.t-ipconnect.de.
 [2003:c5:8f2d:d200:7f12:8f2c:5192:3b71])
 by smtp.gmail.com with ESMTPSA id u68sm11966886wmu.12.2019.10.04.06.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 06:52:03 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH] drm/amdgpu: fix memory leak
Date: Fri,  4 Oct 2019 15:51:55 +0200
Message-Id: <20191004135155.6527-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Oct 2019 14:18:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pvGAP3szuZrDaTjAqEj48YC4sLZ6bj0qt3p8BiCeEm4=;
 b=WUf7LDH6IzcjiXXi59uHtySIXIun8rT/O3a9WSEuWwTI9Jabt40uyBqe7eQs4iNtbe
 sgsAOuhAgHOHMqNoGirVmbZmsOX3aD9wkrTzzrEgqFWH8Q+Ixl5xdq54/+0+iUeydu2h
 URzosBxX8JiDc7qlBYxnJA37P+oyZshmpT6hoHFji5lYp4bjv+mb21WOL56q5CUdgMoz
 NTHHyPeEMlcxRaNXneINXF1b6Tn1Rbt5sLAEUR10n5voAi+XjW6jMeT0TctAheDxM7TL
 f6CYvk3i1iUfTUuZB2f7vwA8775/1by1e/pXb88NC3doTN862lNkph6lrUz3UIicaLlR
 Rh/g==
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2xlYW51cCBlcnJvciBoYW5kbGluZyBjb2RlIGFuZCBtYWtlIHN1cmUgdGVtcG9yYXJ5IGluZm8g
YXJyYXkKd2l0aCB0aGUgaGFuZGxlcyBhcmUgZnJlZWQgYnkgYW1kZ3B1X2JvX2xpc3RfcHV0KCkg
b24KaWRyX3JlcGxhY2UoKSdzIGZhaWx1cmUuCgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxu
aXJtb3kuZGFzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2JvX2xpc3QuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9ib19saXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYm9fbGlzdC5jCmluZGV4IDdiY2Y4NmM2MTk5OS4uNjFlMzhlNDNhZDFkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMKQEAgLTI3MCw3ICsyNzAsNyBA
QCBpbnQgYW1kZ3B1X2JvX2xpc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAogCXIgPSBhbWRncHVfYm9fY3JlYXRlX2xpc3RfZW50cnlfYXJyYXkoJmFyZ3MtPmlu
LCAmaW5mbyk7CiAJaWYgKHIpCi0JCWdvdG8gZXJyb3JfZnJlZTsKKwkJcmV0dXJuIHI7CiAKIAlz
d2l0Y2ggKGFyZ3MtPmluLm9wZXJhdGlvbikgewogCWNhc2UgQU1ER1BVX0JPX0xJU1RfT1BfQ1JF
QVRFOgpAQCAtMjgzLDggKzI4Myw3IEBAIGludCBhbWRncHVfYm9fbGlzdF9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQlyID0gaWRyX2FsbG9jKCZmcHJpdi0+Ym9f
bGlzdF9oYW5kbGVzLCBsaXN0LCAxLCAwLCBHRlBfS0VSTkVMKTsKIAkJbXV0ZXhfdW5sb2NrKCZm
cHJpdi0+Ym9fbGlzdF9sb2NrKTsKIAkJaWYgKHIgPCAwKSB7Ci0JCQlhbWRncHVfYm9fbGlzdF9w
dXQobGlzdCk7Ci0JCQlyZXR1cm4gcjsKKwkJCWdvdG8gZXJyb3JfcHV0X2xpc3Q7CiAJCX0KIAog
CQloYW5kbGUgPSByOwpAQCAtMzA2LDkgKzMwNSw4IEBAIGludCBhbWRncHVfYm9fbGlzdF9pb2N0
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQltdXRleF91bmxvY2soJmZw
cml2LT5ib19saXN0X2xvY2spOwogCiAJCWlmIChJU19FUlIob2xkKSkgewotCQkJYW1kZ3B1X2Jv
X2xpc3RfcHV0KGxpc3QpOwogCQkJciA9IFBUUl9FUlIob2xkKTsKLQkJCWdvdG8gZXJyb3JfZnJl
ZTsKKwkJCWdvdG8gZXJyb3JfcHV0X2xpc3Q7CiAJCX0KIAogCQlhbWRncHVfYm9fbGlzdF9wdXQo
b2xkKTsKQEAgLTMyNSw4ICszMjMsMTAgQEAgaW50IGFtZGdwdV9ib19saXN0X2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlyZXR1cm4gMDsKIAorZXJyb3JfcHV0
X2xpc3Q6CisJYW1kZ3B1X2JvX2xpc3RfcHV0KGxpc3QpOworCiBlcnJvcl9mcmVlOgotCWlmIChp
bmZvKQotCQlrdmZyZWUoaW5mbyk7CisJa3ZmcmVlKGluZm8pOwogCXJldHVybiByOwogfQotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
