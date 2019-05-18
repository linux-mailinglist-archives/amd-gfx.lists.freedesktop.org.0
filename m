Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8484E23DFE
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2019 19:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9689230;
	Mon, 20 May 2019 17:04:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD989897C8;
 Sat, 18 May 2019 13:43:14 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d21so4645604plr.3;
 Sat, 18 May 2019 06:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QtUJrjIqrPWsj5/m1a8zRfPnwpigJLhDkg+YiJdkqnM=;
 b=YV6MKIgnyDodfMceDGinpEzo9UoviFmQLX4nIrScJBbnrzG1QF9Bs0xglm7mYbgtUu
 IG5WQHLH2fIbfXpadY0jNtTJbeejyZ8TuAVuiFJ29x9CW9MEBK0fSwQFcou+OX/Yq6cV
 D8NVEAenEhup0Ifrn8txYaTLP4gMZZMRaUn1UWodtJEo+dIRcbQrqvcctgkAC8hofpRz
 oT2cOMAquQ623ehC56BoHGCSBH7Arqy4pbsFNKj0Vfqnd1l8toA4cYdgxa2079j5Ueyr
 VUMB0LxjJPDbq8DVhI5oFw8nbkqxK396D3cXykq2/fqMbCvEROC1JsP/g5rqfnAcdPdH
 RAow==
X-Gm-Message-State: APjAAAVhgC4bRSKVgAR2nDC8O9RTl5HsYR8mWfTjKwh0FhSKtGQ33HAe
 jIuXB6mh/M/jjoqSnDRXdfk=
X-Google-Smtp-Source: APXvYqwekrpEtVV0a6ftK/9ORGfaA4+lu/FPvftFnFd++JD2PFRNqoDxOZvt2mfZT/Ym9DUd8JCG5g==
X-Received: by 2002:a17:902:6b0b:: with SMTP id
 o11mr63385245plk.266.1558186994609; 
 Sat, 18 May 2019 06:43:14 -0700 (PDT)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id 85sm16194005pgb.52.2019.05.18.06.43.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 06:43:13 -0700 (PDT)
From: Weitao Hou <houweitaoo@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com, michel.daenzer@amd.com,
 Dmytro.Laktyushkin@amd.com, Anthony.Koo@amd.com, ken.chalmers@amd.com
Subject: [PATCH] gpu: fix typos in code comments
Date: Sat, 18 May 2019 21:41:41 +0800
Message-Id: <20190518134141.23214-1-houweitaoo@gmail.com>
X-Mailer: git-send-email 2.18.0
X-Mailman-Approved-At: Mon, 20 May 2019 17:04:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QtUJrjIqrPWsj5/m1a8zRfPnwpigJLhDkg+YiJdkqnM=;
 b=Z7NJYpUQD90B/2h4MTsHIw9ijXPWhBbsoaY48acKPyQE2Jb/VTUBX/mf+42IudJwPt
 omV+sUUeYVGy7bWWgocJ8vmaa7tRXc1V9eb5WQ7LiAyqNAW+yPwPlZEJgpPH4UYZ1WTV
 ZMMea0dDHzwkDbCKWwFArZsx/c2yDrOPpDd0/NvuunYAkOMz98DhO7MbAqLrCWOvsXuE
 YAASwKyDwshJpr8tJChkuEf1DoJNgB91zPNlCyAcmQUoZxLCuKRzye2ceLJxqQ6piLz6
 9UbAimsON+1tHBbamaFMmPZ7qP4p+jIjSQQX32L0wCbrb7gFr01/sR1xUW4QZ+Qp6OBM
 VsBA==
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
Cc: Weitao Hou <houweitaoo@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4IGVyb3IgdG8gZXJyb3IKClNpZ25lZC1vZmYtYnk6IFdlaXRhbyBIb3UgPGhvdXdlaXRhb29A
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Ns
b2NrX3NvdXJjZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfY2xvY2tfc291cmNlLmMKaW5kZXggZjcwNDM3YWFlOGUwLi5kZjQyMjQ0MDg0NWIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2Nr
X3NvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Ns
b2NrX3NvdXJjZS5jCkBAIC0xODMsOCArMTgzLDggQEAgc3RhdGljIGJvb2wgY2FsY3VsYXRlX2Zi
X2FuZF9mcmFjdGlvbmFsX2ZiX2RpdmlkZXIoCiAqUkVUVVJOUzoKICogSXQgZmlsbHMgdGhlIFBM
TFNldHRpbmdzIHN0cnVjdHVyZSB3aXRoIFBMTCBEaXZpZGVycyB2YWx1ZXMKICogaWYgY2FsY3Vs
YXRlZCB2YWx1ZXMgYXJlIHdpdGhpbiByZXF1aXJlZCB0b2xlcmFuY2UKLSogSXQgcmV0dXJucwkt
IHRydWUgaWYgZXJvciBpcyB3aXRoaW4gdG9sZXJhbmNlCi0qCQktIGZhbHNlIGlmIGVyb3IgaXMg
bm90IHdpdGhpbiB0b2xlcmFuY2UKKyogSXQgcmV0dXJucwktIHRydWUgaWYgZXJyb3IgaXMgd2l0
aGluIHRvbGVyYW5jZQorKgkJLSBmYWxzZSBpZiBlcnJvciBpcyBub3Qgd2l0aGluIHRvbGVyYW5j
ZQogKi8KIHN0YXRpYyBib29sIGNhbGNfZmJfZGl2aWRlcl9jaGVja2luZ190b2xlcmFuY2UoCiAJ
CXN0cnVjdCBjYWxjX3BsbF9jbG9ja19zb3VyY2UgKmNhbGNfcGxsX2NzLAotLSAKMi4xOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
