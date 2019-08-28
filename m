Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1683A0ADC
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DDF89EBB;
	Wed, 28 Aug 2019 19:56:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEC489EBB
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:48 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k13so927546qtm.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCeeTlaOkqnvwZOPtc7StsZfFd7jrq96XvXHl05qeig=;
 b=Re5LyavFoI2YywFApHMcEzrhT/41whnPJ1yjun9tpHZuW8IacVyD9FyRrNeIf/SInn
 w7xz5tjlFiSRpx8ph9+8a4a5cLL6hBLndcGtLHz8Sq+tcT3wQN1rYYg6y9eYJN56Uo3G
 oUe/IxujeaMZUhTpzDuXeGS+YnfpjaSla8OAt4Ycy5XcuSWCxTIq/9qj35KduDf0/y/V
 XPAPE+qp9M7pCAAkYBRA5PSKE9FtdgRYUxMk4uvD0WGbZUYVWvrhEMl9xP8x9AgVmsus
 Vy/fM1sWi5gZ3s+Ke+5dwMTizOAO6acGfveIgIYTNjevybCRCBKeoA+nAxr9OsIWEPp/
 orAg==
X-Gm-Message-State: APjAAAX+mX2/WFkXdXJbPpDtUut3ccgCOWAogPv8lSKs3piO/Vbkw8mx
 odk6QMeoFDO7nCLdRlo0rGVrmVnN
X-Google-Smtp-Source: APXvYqy2SbFdyGFSK/CTnJO4bUVXsBleh71SbCcVQGz4+CD7xbF7wZctO2f5s1a0S5JmF6wPUjc8HQ==
X-Received: by 2002:ac8:23cf:: with SMTP id r15mr6007528qtr.97.1567022207505; 
 Wed, 28 Aug 2019 12:56:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/23] drm/amd/display: Handle Renoir in DC
Date: Wed, 28 Aug 2019 14:56:13 -0500
Message-Id: <20190828195622.28941-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCeeTlaOkqnvwZOPtc7StsZfFd7jrq96XvXHl05qeig=;
 b=lWqRcrOqUZsi8rD3JEinVKgTH87vmxSk8u/SVR+KkOkpsjRFm8V9nCgfzxN0KyBWTm
 Q+2xu90qDdeYZGSURoaBM5lolbzGeVewU4Uyy25O5J/xrV0mDvEMUBw/mYH24SQr0oCa
 TN7C0FoosDk78pR2kY+2oANyEjbFzMejakeAOrPb1WbKPcK4T7O3aebbTQBpAHCd4ynU
 gSmXD+QxWVXReOCDIW6tRzuQ1KhxB1ABGdLV8UlqcWNTwmoEKQHAW1N5QnUWmg+AibLq
 SSSJdvAiXd6/4LYuq7IcDjfVPrns1BnylRjM8NSH2J853WIhdHUX0Y+xdeFBhmTCkIND
 7Wmw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgphZGQg
UmVub2lyIERDTiB2ZXJzaW9uIGluIERDIGFuZCBoYW5kbGUgaXQKClNpZ25lZC1vZmYtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9h
bWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyMi5jICB8ICA1ICsrKysrCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jICAgIHwgMTIg
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kYWxfdHlw
ZXMuaCAgICAgIHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3Rh
YmxlX2hlbHBlcjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1h
bmRfdGFibGVfaGVscGVyMi5jCmluZGV4IGY5NDM5ZGZjN2I3NS4uZGIxNTNkZGYwZmVlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxl
X2hlbHBlcjIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21t
YW5kX3RhYmxlX2hlbHBlcjIuYwpAQCAtNjYsNiArNjYsMTEgQEAgYm9vbCBkYWxfYmlvc19wYXJz
ZXJfaW5pdF9jbWRfdGJsX2hlbHBlcjIoCiAJY2FzZSBEQ05fVkVSU0lPTl8yXzA6CiAJCSpoID0g
ZGFsX2NtZF90YmxfaGVscGVyX2RjZTExMl9nZXRfdGFibGUyKCk7CiAJCXJldHVybiB0cnVlOwor
I2VuZGlmCisjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisJY2FzZSBEQ05f
VkVSU0lPTl8yXzE6CisJCSpoID0gZGFsX2NtZF90YmxfaGVscGVyX2RjZTExMl9nZXRfdGFibGUy
KCk7CisJCXJldHVybiB0cnVlOwogI2VuZGlmCiAJY2FzZSBEQ0VfVkVSU0lPTl8xMl8wOgogCWNh
c2UgRENFX1ZFUlNJT05fMTJfMToKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19yZXNvdXJjZS5jCmluZGV4IGFkYmYyZDRlMTcyMy4uMmFlODgzYTI0OGRhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMKQEAgLTQ5LDYgKzQ5LDkgQEAKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJf
MCkKICNpbmNsdWRlICJkY24yMC9kY24yMF9yZXNvdXJjZS5oIgogI2VuZGlmCisjaWYgZGVmaW5l
ZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisjaW5jbHVkZSAiZGNuMjEvZGNuMjFfcmVzb3Vy
Y2UuaCIKKyNlbmRpZgogI2luY2x1ZGUgImRjZTEyMC9kY2UxMjBfcmVzb3VyY2UuaCIKIAogI2Rl
ZmluZSBEQ19MT0dHRVJfSU5JVChsb2dnZXIpCkBAIC05OCw2ICsxMDEsMTAgQEAgZW51bSBkY2Vf
dmVyc2lvbiByZXNvdXJjZV9wYXJzZV9hc2ljX2lkKHN0cnVjdCBod19hc2ljX2lkIGFzaWNfaWQp
CiAJCWRjX3ZlcnNpb24gPSBEQ05fVkVSU0lPTl8xXzA7CiAJCWlmIChBU0lDUkVWX0lTX1JBVkVO
Mihhc2ljX2lkLmh3X2ludGVybmFsX3JldikpCiAJCQlkY192ZXJzaW9uID0gRENOX1ZFUlNJT05f
MV8wMTsKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMSkKKwkJaWYgKEFTSUNS
RVZfSVNfUkVOT0lSKGFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSkKKwkJCWRjX3ZlcnNpb24gPSBE
Q05fVkVSU0lPTl8yXzE7CisjZW5kaWYKIAkJYnJlYWs7CiAjZW5kaWYKIApAQCAtMTY1LDYgKzE3
MiwxMSBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNfY3JlYXRlX3Jlc291cmNlX3Bvb2woc3Ry
dWN0IGRjICAqZGMsCiAJCXJlc19wb29sID0gZGNuMjBfY3JlYXRlX3Jlc291cmNlX3Bvb2woaW5p
dF9kYXRhLCBkYyk7CiAJCWJyZWFrOwogI2VuZGlmCisjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzEpCisJY2FzZSBEQ05fVkVSU0lPTl8yXzE6CisJCXJlc19wb29sID0gZGNuMjFf
Y3JlYXRlX3Jlc291cmNlX3Bvb2woaW5pdF9kYXRhLCBkYyk7CisJCWJyZWFrOworI2VuZGlmCiAK
IAlkZWZhdWx0OgogCQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9pbmNsdWRlL2RhbF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2lu
Y2x1ZGUvZGFsX3R5cGVzLmgKaW5kZXggMWUzY2U0ZDg0N2FlLi5mY2M0MjM3MmI2Y2YgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF90eXBlcy5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF90eXBlcy5oCkBAIC00
OCw2ICs0OCw5IEBAIGVudW0gZGNlX3ZlcnNpb24gewogCURDTl9WRVJTSU9OXzFfMDEsCiAjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCiAJRENOX1ZFUlNJT05fMl8wLAorI2Vu
ZGlmCisjaWYgZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisJRENOX1ZFUlNJT05f
Ml8xLAogI2VuZGlmCiAJRENOX1ZFUlNJT05fTUFYCiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
