Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EAA69E4D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A1F6E033;
	Mon, 15 Jul 2019 21:26:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D586E02A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:05 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so17269566qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2vWFC2ZGuXp7gEh4oo9Bh3ai4bXoGMDIYH+gAz/eTg=;
 b=oLlMDxyy/MjYNimEQOniBIPanYnRgpCVS/31RM0PqBsAKjbSmLKrgtXorkQn3Qe7uW
 Adha/0wwor32HAJCjnaqehE7h8mnl7yY+DLY8EpJlpxe6u4BdSzyViP8lULr2JYJ5f5c
 BLFvJY3ks6knIKQjqJjEbIMoISfk4cf8WdRfXzcMu44uBUIGq/F3Y1PwDuUNo1t2UkQb
 Cz+C0XowQr1Kv5AmeniNby2bun1PhGzeT+jLB+O0sb6BVXEP2Ne1tlPuj4u/bNkeJ9H/
 JkrWyjDIjfc7S33PtjmRRGCGGoPJsZeSqDJs2G5OLI7wK6ynu7UqrVAkDursSAzGYJgC
 PnJQ==
X-Gm-Message-State: APjAAAWiyrL2R79oI7ckY1is5y/jb6s29MYQ/1TE/nXDydMOr1UKmFkR
 /UHe0h4uwLgceaxcIIP6kqOAXxC1
X-Google-Smtp-Source: APXvYqzTTZaJFye+ed5UECoabc0s3bA7EmHRsPuZuohb1ALJ54Zdwc2bHQFhmvc/FBOflkaZFu7QHA==
X-Received: by 2002:a0c:c604:: with SMTP id v4mr19964172qvi.21.1563225963797; 
 Mon, 15 Jul 2019 14:26:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 086/102] drm/amdgpu: add arct gc golden settings
Date: Mon, 15 Jul 2019 16:24:21 -0500
Message-Id: <20190715212437.31793-84-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2vWFC2ZGuXp7gEh4oo9Bh3ai4bXoGMDIYH+gAz/eTg=;
 b=T1kHviUWk6XyxMmQh05J3kqoENiCORG35uwu4npsUv6WWnd891V9NGVzZ53zawdIKn
 DF9UYzqaasVRU/D1qDSduTP6bWSRVKq3sspsDH20rDECbr9FrMEaJd23MMnz/+dQqRQR
 ezaYPi22FZyPmn324BzIUwZm/QBj/DaXNVCnQr3kEh4z6143xrha6mMZ/FskRmMzERx5
 ZbM04/ayU0iz972xOb2NpagNdzLRUdQXbCaexAlpZJJ66ixnHrg7IWCvnSancOKKCKc1
 NsCuUHCzJ2+unBR+jRBGtTBO8GZFNtsAQaw9mMhb8QrMYEZljFgzuPa0+XFBhntUCm0l
 Il1Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzAg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDNh
YzNlZTdmY2IxYS4uNTYwZTYwN2U3MDQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKQEAgLTEwNyw2ICsxMDcsMTkgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVy
dXNfbWVjLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfbWVjMi5iaW4i
KTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVzX3JsYy5iaW4iKTsKIAorI2RlZmlu
ZSBtbVRDUF9DSEFOX1NURUVSXzBfQVJDVAkJCQkJCQkJMHgwYjAzCisjZGVmaW5lIG1tVENQX0NI
QU5fU1RFRVJfMF9BUkNUX0JBU0VfSURYCQkJCQkJCTAKKyNkZWZpbmUgbW1UQ1BfQ0hBTl9TVEVF
Ul8xX0FSQ1QJCQkJCQkJCTB4MGIwNAorI2RlZmluZSBtbVRDUF9DSEFOX1NURUVSXzFfQVJDVF9C
QVNFX0lEWAkJCQkJCQkwCisjZGVmaW5lIG1tVENQX0NIQU5fU1RFRVJfMl9BUkNUCQkJCQkJCQkw
eDBiMDkKKyNkZWZpbmUgbW1UQ1BfQ0hBTl9TVEVFUl8yX0FSQ1RfQkFTRV9JRFgJCQkJCQkJMAor
I2RlZmluZSBtbVRDUF9DSEFOX1NURUVSXzNfQVJDVAkJCQkJCQkJMHgwYjBhCisjZGVmaW5lIG1t
VENQX0NIQU5fU1RFRVJfM19BUkNUX0JBU0VfSURYCQkJCQkJCTAKKyNkZWZpbmUgbW1UQ1BfQ0hB
Tl9TVEVFUl80X0FSQ1QJCQkJCQkJCTB4MGIwYgorI2RlZmluZSBtbVRDUF9DSEFOX1NURUVSXzRf
QVJDVF9CQVNFX0lEWAkJCQkJCQkwCisjZGVmaW5lIG1tVENQX0NIQU5fU1RFRVJfNV9BUkNUCQkJ
CQkJCQkweDBiMGMKKyNkZWZpbmUgbW1UQ1BfQ0hBTl9TVEVFUl81X0FSQ1RfQkFTRV9JRFgJCQkJ
CQkJMAorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRp
bmdzX2djXzlfMFtdID0KIHsKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0RF
QlVHMiwgMHhmMDBmZmZmZiwgMHgwMDAwMDQwMCksCkBAIC0yNzQsNiArMjg3LDE4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfOV8yXzFf
dmcxMltdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAw
MDAwMDAwLCAweDAwMDA4MDAwKQogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdf
Z29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY185XzRfMV9hcmN0W10gPQoreworCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tR0JfQUREUl9DT05GSUcsIDB4ZmZmZjc3ZmYsIDB4MmExMTQw
NDIpLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVEFfQ05UTF9BVVgsIDB4ZmZm
ZmZlZWYsIDB4MTBiMDAwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1UQ1Bf
Q0hBTl9TVEVFUl8wX0FSQ1QsIDB4M2ZmZmZmZmYsIDB4MzQ2ZjBhNGUpLAorCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tVENQX0NIQU5fU1RFRVJfMV9BUkNULCAweDNmZmZmZmZmLCAw
eDFjNjQyY2EpLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVENQX0NIQU5fU1RF
RVJfMl9BUkNULCAweDNmZmZmZmZmLCAweDI2ZjQ1MDk4KSwKKwlTT0MxNV9SRUdfR09MREVOX1ZB
TFVFKEdDLCAwLCBtbVRDUF9DSEFOX1NURUVSXzNfQVJDVCwgMHgzZmZmZmZmZiwgMHgyZWJkOWZl
MyksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1UQ1BfQ0hBTl9TVEVFUl80X0FS
Q1QsIDB4M2ZmZmZmZmYsIDB4YjkwZjViMSksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywg
MCwgbW1UQ1BfQ0hBTl9TVEVFUl81X0FSQ1QsIDB4M2ZmLCAweDEzNSksCit9OworCiBzdGF0aWMg
Y29uc3QgdTMyIEdGWF9STENfU1JNX0lOREVYX0NOVExfQUREUl9PRkZTRVRTW10gPQogewogCW1t
UkxDX1NSTV9JTkRFWF9DTlRMX0FERFJfMCAtIG1tUkxDX1NSTV9JTkRFWF9DTlRMX0FERFJfMCwK
QEAgLTM0Myw2ICszNjgsMTEgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9nb2xkZW5fcmVn
aXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJZ29sZGVuX3NldHRpbmdz
X2djXzlfMF92ZzIwLAogCQkJCQkJQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfZ2NfOV8wX3Zn
MjApKTsKIAkJYnJlYWs7CisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlzb2MxNV9wcm9ncmFtX3Jl
Z2lzdGVyX3NlcXVlbmNlKGFkZXYsCisJCQkJCQlnb2xkZW5fc2V0dGluZ3NfZ2NfOV80XzFfYXJj
dCwKKwkJCQkJCUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzlfNF8xX2FyY3QpKTsKKwkJ
YnJlYWs7CiAJY2FzZSBDSElQX1JBVkVOOgogCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVl
bmNlKGFkZXYsIGdvbGRlbl9zZXR0aW5nc19nY185XzEsCiAJCQkJCQlBUlJBWV9TSVpFKGdvbGRl
bl9zZXR0aW5nc19nY185XzEpKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
