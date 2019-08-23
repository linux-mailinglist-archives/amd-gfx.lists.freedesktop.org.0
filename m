Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8B9B25E
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 16:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41206E07F;
	Fri, 23 Aug 2019 14:45:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A6E6E07F
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 14:45:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m10so8384687qkk.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 07:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8y23auv4VvTN9HFe7aAGYJEl11V/pWfGUt5vXNepEZo=;
 b=s4qhZQZYYnsZG9KVO7KHZrtRMkxTXsLAzDH+Ld+o+FvEb76ueQn+jidz2Ko8OJZERF
 PIPILLrdgMxmRUl9QEzAa+XYoiQx6g+GKP8bbXEoEc/I0T24Dip/ENxyjV3bHOxGO+FO
 rbGEjx9dELGFbS6NLjZJl0euxjugguE0grbq40Pqos8p6CPhBP7PxUuSfxn+DPuqGmJR
 QW5P6bJURzrf4xwFQlretJxP0CDA76YtgOccklI0N5Y3ZUftUgVBcYatXfL77VFfFbWt
 bzggyt2WrULyC/E+w9RKx3RUOr2pbozIBroORy7JnY/Qv9l3IM4NWM5kIFmQqn51jeTw
 aH9Q==
X-Gm-Message-State: APjAAAXuT1+xgiACsASEVTdJGlxx+LgpBBJs4U19A1wG0kM+giaFyvug
 cJJE8PfukedRGtI5I0fEiZyqmAjj
X-Google-Smtp-Source: APXvYqxDYUWsBxEMQWJlchfNBZdVLN4OfN1e2p+esUZ7rmrZxYA+zrMNJRAe7gleFPIe5PW5jZcboQ==
X-Received: by 2002:a37:9802:: with SMTP id a2mr4391352qke.346.1566571531218; 
 Fri, 23 Aug 2019 07:45:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id h4sm1360657qtq.82.2019.08.23.07.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 07:45:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: set adev->num_vmhubs for gmc6,7,8
Date: Fri, 23 Aug 2019 09:45:14 -0500
Message-Id: <20190823144514.21354-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8y23auv4VvTN9HFe7aAGYJEl11V/pWfGUt5vXNepEZo=;
 b=IbEJ9g7Jy3wTJcRWEXNPzO6syj0a18WLIf/ImLFkYpLFxZUtPudE4ovjMZ4DJh5Je9
 aE9aQBeYCA7/YPeKh3kKcHNkzOuLnqKYGaoiZsSdvZx5ysi255cdnIqR1IRInuDN9qZE
 Uz6H8pdgmDViGnih6WKV4SqPJMoaxCgltHdErceUKifDOqCgtQLYNxYfjH/hdPNXoXbU
 YKxEEsEOYYR9mbVhnjJzFws05PVjP60jpyARsYFtGWSAnV3E1EOijRJhtUzglw0FtOgh
 2EqKyZkjflcALd5frQc1Sd5b6ISiiKBo6IC/fPjRPKgL6vBrM9EgaE06oDdhzNHlwOum
 RCPg==
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

U28gdGhhdCB3ZSBwcm9wZXJseSBoYW5kbGUgdGhlbSBvbiBvbGRlciBhc2ljcy4KCkZpeGVzOiAz
ZmY5ODU0ODViMjkgKCJkcm0vYW1kZ3B1OiBFeHBvcnQgZnVuY3Rpb24gdG8gZmx1c2ggVExCIG9m
IHNwZWNpZmljIHZtIGh1YiIpClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZf
MC5jIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyB8IDIgKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgfCAyICsrCiAzIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5j
CmluZGV4IDU2NGZiMWNlMjkyZi4uMzI2NDU0OGUzNzVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192Nl8wLmMKQEAgLTgzOSw2ICs4MzksOCBAQCBzdGF0aWMgaW50IGdtY192Nl8wX3N3
X2luaXQodm9pZCAqaGFuZGxlKQogCWludCBkbWFfYml0czsKIAlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAorCWFkZXYtPm51bV92
bWh1YnMgPSAxOworCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkgewogCQlhZGV2LT5n
bWMudnJhbV90eXBlID0gQU1ER1BVX1ZSQU1fVFlQRV9VTktOT1dOOwogCX0gZWxzZSB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwppbmRleCA5ZTZhMjMzMDRmZDcuLmNjMGFhMTc4
ZWIyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCkBAIC05NTksNiArOTU5
LDggQEAgc3RhdGljIGludCBnbWNfdjdfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlpbnQgZG1h
X2JpdHM7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKiloYW5kbGU7CiAKKwlhZGV2LT5udW1fdm1odWJzID0gMTsKKwogCWlmIChhZGV2LT5mbGFn
cyAmIEFNRF9JU19BUFUpIHsKIAkJYWRldi0+Z21jLnZyYW1fdHlwZSA9IEFNREdQVV9WUkFNX1RZ
UEVfVU5LTk9XTjsKIAl9IGVsc2UgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMK
aW5kZXggZjdkNmEwN2JhNGUxLi44OGYzYTE3MTQ1MmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y4XzAuYwpAQCAtMTA3OSw2ICsxMDc5LDggQEAgc3RhdGljIGludCBnbWNfdjhfMF9z
d19pbml0KHZvaWQgKmhhbmRsZSkKIAlpbnQgZG1hX2JpdHM7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKKwlhZGV2LT5udW1f
dm1odWJzID0gMTsKKwogCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpIHsKIAkJYWRldi0+
Z21jLnZyYW1fdHlwZSA9IEFNREdQVV9WUkFNX1RZUEVfVU5LTk9XTjsKIAl9IGVsc2UgewotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
