Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33D87E9F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A66EE4D;
	Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D535B6EE43
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:27 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id f7so3369881qtq.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2Wrr29vvBl56DW6pFfSO2hVQAcEWbbyLRMwtX46W9w=;
 b=KX5XLxxEo9NaK+Ewcuf05FRyTMrX36zt7RA0BzCLOyc1eps5MrKRHF3FxiHVko6xmM
 J0puSeMHptPoZTa4WFYk+Us2EepxIsZVstjl98ZKNj9qLjqpSA58XK0z3UB1oY8wB81+
 aK4Re7MJRlKPJp/2JOV8e9u0k+z4as0xyC4D1Q3QDnu3fH5IDB/sRtf5XGoj9txp2zqc
 /9ZnpQdOVzi4tFx+s667z7Fy7hbMeZcTJQb8T5ApJhHjAqAwQEImIjYfD4z7GZUZlVqz
 JT0qgswl7Sd4EFTr/Cxp+hn1N3viMrguREqZEBQIPb4tRzvbPWgDTQXAd543E8nqTPSv
 7tTA==
X-Gm-Message-State: APjAAAUJJTXHhmMJvqp0wbBtybmUEiRAaqaPZI8C/oCrcSGJO1NFHf+f
 Euoj2mC3yVrx8C5pukccx/rnShfW
X-Google-Smtp-Source: APXvYqxs4YAybUBLLEH5DhEdNzlKCkgkIX9xHuSPfrWf4vKFscTTF07AZbKEyrb2VPbf3OEZwrZfMQ==
X-Received: by 2002:a0c:db12:: with SMTP id d18mr10044018qvk.199.1565366006735; 
 Fri, 09 Aug 2019 08:53:26 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/27] drm/amdgpu: enable Doorbell support for Renoir (v2)
Date: Fri,  9 Aug 2019 10:52:54 -0500
Message-Id: <20190809155302.4733-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2Wrr29vvBl56DW6pFfSO2hVQAcEWbbyLRMwtX46W9w=;
 b=paR25goHIEkN2ngWlI2z0QdHl8LUImZiQdm8wI/QDyezYputH+LdY+rxcJNvERQNw2
 8v9dOpatD7RdAfcHllQszqvuLK/XAuGJ6/69NxieMEhWd6bKM7rASzBoaY5MuttMHzld
 uIv9wx6j8HHrgBZOZLtH1CFWwcozyjXru5zdyn0FDZOasLZE5cJ/oghvKSIEunrhRNoE
 p4pNpnIHyX/bi3rechQwBvu4LhqtJjb0sNufHbPx018oputNoHOZojyEofmCZinniW9u
 gSouhY7VI8/Tqf8Fwg4VUMs7XCOeC2yp50IHz5xlq1H91Q5LPBOF971Nn2HJ6/ayxSYX
 DddA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIFZDTiByYW5nZSBhcGVydHVyZSB0
byBOQklPIDcuMAoKdjI6IHJlYmFzZSAoQWxleCkKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxl
by5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdfMC5jICAg
ICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3ZlZ2ExMF9yZWdfaW5pdC5jIHwgIDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N18w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzAuYwppbmRleCA3MzQxOWZh
MzgxNTkuLjc0ZWVjYjc2OGE4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbmJpb192N18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N18w
LmMKQEAgLTkxLDYgKzkxLDI2IEBAIHN0YXRpYyB2b2lkIG5iaW9fdjdfMF9zZG1hX2Rvb3JiZWxs
X3JhbmdlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgaW5zdGFuCiAJV1JFRzMyKHJl
ZywgZG9vcmJlbGxfcmFuZ2UpOwogfQogCitzdGF0aWMgdm9pZCBuYmlvX3Y3XzBfdmNuX2Rvb3Ji
ZWxsX3JhbmdlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIHVzZV9kb29yYmVsbCwK
KwkJCQkJIGludCBkb29yYmVsbF9pbmRleCwgaW50IGluc3RhbmNlKQoreworCXUzMiByZWcgPSBT
T0MxNV9SRUdfT0ZGU0VUKE5CSU8sIDAsIG1tQklGX01NU0NIMF9ET09SQkVMTF9SQU5HRSk7CisK
Kwl1MzIgZG9vcmJlbGxfcmFuZ2UgPSBSUkVHMzIocmVnKTsKKworCWlmICh1c2VfZG9vcmJlbGwp
IHsKKwkJZG9vcmJlbGxfcmFuZ2UgPSBSRUdfU0VUX0ZJRUxEKGRvb3JiZWxsX3JhbmdlLAorCQkJ
CQkgICAgICAgQklGX01NU0NIMF9ET09SQkVMTF9SQU5HRSwgT0ZGU0VULAorCQkJCQkgICAgICAg
ZG9vcmJlbGxfaW5kZXgpOworCQlkb29yYmVsbF9yYW5nZSA9IFJFR19TRVRfRklFTEQoZG9vcmJl
bGxfcmFuZ2UsCisJCQkJCSAgICAgICBCSUZfTU1TQ0gwX0RPT1JCRUxMX1JBTkdFLCBTSVpFLCA4
KTsKKwl9IGVsc2UKKwkJZG9vcmJlbGxfcmFuZ2UgPSBSRUdfU0VUX0ZJRUxEKGRvb3JiZWxsX3Jh
bmdlLAorCQkJCQkgICAgICAgQklGX01NU0NIMF9ET09SQkVMTF9SQU5HRSwgU0laRSwgMCk7CisK
KwlXUkVHMzIocmVnLCBkb29yYmVsbF9yYW5nZSk7Cit9CisKIHN0YXRpYyB2b2lkIG5iaW9fdjdf
MF9lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
CQkJCSAgICAgICBib29sIGVuYWJsZSkKIHsKQEAgLTI4Miw2ICszMDIsNyBAQCBjb25zdCBzdHJ1
Y3QgYW1kZ3B1X25iaW9fZnVuY3MgbmJpb192N18wX2Z1bmNzID0gewogCS5oZHBfZmx1c2ggPSBu
YmlvX3Y3XzBfaGRwX2ZsdXNoLAogCS5nZXRfbWVtc2l6ZSA9IG5iaW9fdjdfMF9nZXRfbWVtc2l6
ZSwKIAkuc2RtYV9kb29yYmVsbF9yYW5nZSA9IG5iaW9fdjdfMF9zZG1hX2Rvb3JiZWxsX3Jhbmdl
LAorCS52Y25fZG9vcmJlbGxfcmFuZ2UgPSBuYmlvX3Y3XzBfdmNuX2Rvb3JiZWxsX3JhbmdlLAog
CS5lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUgPSBuYmlvX3Y3XzBfZW5hYmxlX2Rvb3JiZWxsX2Fw
ZXJ0dXJlLAogCS5lbmFibGVfZG9vcmJlbGxfc2VsZnJpbmdfYXBlcnR1cmUgPSBuYmlvX3Y3XzBf
ZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlLAogCS5paF9kb29yYmVsbF9yYW5nZSA9
IG5iaW9fdjdfMF9paF9kb29yYmVsbF9yYW5nZSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3ZlZ2ExMF9yZWdfaW5pdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmVnYTEwX3JlZ19pbml0LmMKaW5kZXggYThlOTI2MzhhMmU4Li5iZDA1ODAzMzRmODMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9yZWdfaW5pdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9yZWdfaW5pdC5jCkBAIC04MSw2
ICs4MSwxMCBAQCB2b2lkIHZlZ2ExMF9kb29yYmVsbF9pbmRleF9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWFkZXYtPmRvb3JiZWxsX2luZGV4LnV2ZF92Y2UudmNlX3JpbmcyXzMg
PSBBTURHUFVfRE9PUkJFTEw2NF9WQ0VfUklORzJfMzsKIAlhZGV2LT5kb29yYmVsbF9pbmRleC51
dmRfdmNlLnZjZV9yaW5nNF81ID0gQU1ER1BVX0RPT1JCRUxMNjRfVkNFX1JJTkc0XzU7CiAJYWRl
di0+ZG9vcmJlbGxfaW5kZXgudXZkX3ZjZS52Y2VfcmluZzZfNyA9IEFNREdQVV9ET09SQkVMTDY0
X1ZDRV9SSU5HNl83OworCWFkZXYtPmRvb3JiZWxsX2luZGV4LnZjbi52Y25fcmluZzBfMSA9IEFN
REdQVV9ET09SQkVMTDY0X1ZDTjBfMTsKKwlhZGV2LT5kb29yYmVsbF9pbmRleC52Y24udmNuX3Jp
bmcyXzMgPSBBTURHUFVfRE9PUkJFTEw2NF9WQ04yXzM7CisJYWRldi0+ZG9vcmJlbGxfaW5kZXgu
dmNuLnZjbl9yaW5nNF81ID0gQU1ER1BVX0RPT1JCRUxMNjRfVkNONF81OworCWFkZXYtPmRvb3Ji
ZWxsX2luZGV4LnZjbi52Y25fcmluZzZfNyA9IEFNREdQVV9ET09SQkVMTDY0X1ZDTjZfNzsKIAog
CWFkZXYtPmRvb3JiZWxsX2luZGV4LmZpcnN0X25vbl9jcCA9IEFNREdQVV9ET09SQkVMTDY0X0ZJ
UlNUX05PTl9DUDsKIAlhZGV2LT5kb29yYmVsbF9pbmRleC5sYXN0X25vbl9jcCA9IEFNREdQVV9E
T09SQkVMTDY0X0xBU1RfTk9OX0NQOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
