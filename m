Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BB98708
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC886E39E;
	Wed, 21 Aug 2019 22:20:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5A06E39B
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:20:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id b11so5066971qtp.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1e7uYDn3d24h2yEhfODGwpijbr/k98FfJj6y/Qped0=;
 b=DsmXHkx1XptPD2dRuGQjGDGbbQFZhvHCykljKfrztMzcSu5InJwXDGantjogVGVsaQ
 kYAdsBlTCKvM0ig9STpDq+GZkSC1vEkwz1Qukf9YTQ794Ooid96uKIqo6bwkwcDn9mW8
 C6epNUwHwZ0ASs4MDsQasK/RYe+4HDkucZUlRvu6zgTs/EszuokgawZazo+8Bm0wTTEE
 3IGSjBtL62Eh91IU4pqyVQKjVhUz5LJzKjzZwknR5/iKmTDyV0TqWoYWp9u1md1wvTrF
 Uv94tQoAmd+kh4pOUKK2crPhky1KfPli4jxMsd5XTLJA80ElUnSIaJw5dEFAXjcNxJon
 N4oQ==
X-Gm-Message-State: APjAAAUM46wvdUDH1KXtB1mwTyRx8Ik3hXYqHkaPRsJDXsBMUXW5wODj
 rtRmIj8R+/GxPSHCnFIySiz6515b
X-Google-Smtp-Source: APXvYqyA0QKdqNc57d1z1HZRMmVH4YJJb5EmAirilAF8OwkGmxl41zhnr8lhPKFyge9NJmWYk3VP9g==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr30523672qtm.309.1566426045849; 
 Wed, 21 Aug 2019 15:20:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w10sm10674525qts.37.2019.08.21.15.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:20:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/radeon: use POLL_REG_MEM special op for sDMA HDP flush
Date: Wed, 21 Aug 2019 17:20:31 -0500
Message-Id: <20190821222034.13387-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222034.13387-1-alexander.deucher@amd.com>
References: <20190821222034.13387-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1e7uYDn3d24h2yEhfODGwpijbr/k98FfJj6y/Qped0=;
 b=Xa3TWQ1qHVygaK8Spz9UkAZKbF+xYMn0rNfxQLJyr2nIVVebMAMFIPmM/aqKyKxawa
 B4M7kmPUeRLzqr6mysT9vFTFIqiCPS53DFnnZhKllenI48ZG1HN8trxublq/ZVtgWHqC
 +LFn0lK1WCrl/mUkeN/QoAKXkAJNtLCvdtGSYtbpwUNlpDKVrMw4zJvmjQKIxZEfFuXu
 8X5N3yQvcB2BNjzwhml/AqDydSEq+4aNFceQZffAiPXs5lERPOCE8A8gyD6XcEgJydlB
 vz4KmQEKx7Lzpes3OpA8AY4ck+fWpLgr/gWI5P0q56mEw1M8tWUIFu9fJjppwP39zV5c
 /gQw==
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

Rmx1c2ggdmlhIHRoZSByaW5nIHdvcmtzIGRpZmZlcmVudGx5IG9uIENJSyBhbmQgcmVxdWlyZXMg
YQpzcGVjaWFsIHNlcXVlbmNlLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEu
YyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lr
X3NkbWEuYwppbmRleCAwMzAwNzI3Li4wMDk4NGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2Npa19zZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2Rt
YS5jCkBAIC04Nyw2ICs4NywyOCBAQCB2b2lkIGNpa19zZG1hX3JpbmdfaWJfZXhlY3V0ZShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAogfQogCitzdGF0aWMgdm9pZCBjaWtfc2RtYV9oZHBf
Zmx1c2goc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCisJCQkgICAgICAgaW50IHJpZHgpCit7
CisJc3RydWN0IHJhZGVvbl9yaW5nICpyaW5nID0gJnJkZXYtPnJpbmdbcmlkeF07CisJdTMyIGV4
dHJhX2JpdHMgPSAoU0RNQV9QT0xMX1JFR19NRU1fRVhUUkFfT1AoMSkgfAorCQkJICBTRE1BX1BP
TExfUkVHX01FTV9FWFRSQV9GVU5DKDMpKTsgLyogPT0gKi8KKwl1MzIgcmVmX2FuZF9tYXNrOwor
CisJaWYgKHJpZHggPT0gUjYwMF9SSU5HX1RZUEVfRE1BX0lOREVYKQorCQlyZWZfYW5kX21hc2sg
PSBTRE1BMDsKKwllbHNlCisJCXJlZl9hbmRfbWFzayA9IFNETUExOworCisJLyogZmx1c2ggSERQ
ICovCisJcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfUE9M
TF9SRUdfTUVNLCAwLCBleHRyYV9iaXRzKSk7CisJcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgR1BV
X0hEUF9GTFVTSF9ET05FKTsKKwlyYWRlb25fcmluZ193cml0ZShyaW5nLCBHUFVfSERQX0ZMVVNI
X1JFUSk7CisJcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgcmVmX2FuZF9tYXNrKTsgLyogUkVGRVJF
TkNFICovCisJcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgcmVmX2FuZF9tYXNrKTsgLyogTUFTSyAq
LworCXJhZGVvbl9yaW5nX3dyaXRlKHJpbmcsICgweGZmZiA8PCAxNikgfCAxMCk7IC8qIFJFVFJZ
X0NPVU5ULCBQT0xMX0lOVEVSVkFMICovCit9CisKIC8qKgogICogY2lrX3NkbWFfZmVuY2Vfcmlu
Z19lbWl0IC0gZW1pdCBhIGZlbmNlIG9uIHRoZSBETUEgcmluZwogICoKQEAgLTExMSwxMiArMTMz
LDcgQEAgdm9pZCBjaWtfc2RtYV9mZW5jZV9yaW5nX2VtaXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsCiAJLyogZ2VuZXJhdGUgYW4gaW50ZXJydXB0ICovCiAJcmFkZW9uX3Jpbmdfd3JpdGUo
cmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfVFJBUCwgMCwgMCkpOwogCS8qIGZsdXNoIEhE
UCAqLwotCS8qIFdlIHNob3VsZCBiZSB1c2luZyB0aGUgbmV3IFBPTExfUkVHX01FTSBzcGVjaWFs
IG9wIHBhY2tldCBoZXJlCi0JICogYnV0IGl0IGNhdXNlcyBzRE1BIHRvIGhhbmcgc29tZXRpbWVz
Ci0JICovCi0JcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENPREVf
U1JCTV9XUklURSwgMCwgMHhmMDAwKSk7Ci0JcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgSERQX01F
TV9DT0hFUkVOQ1lfRkxVU0hfQ05UTCA+PiAyKTsKLQlyYWRlb25fcmluZ193cml0ZShyaW5nLCAw
KTsKKwljaWtfc2RtYV9oZHBfZmx1c2gocmRldiwgZmVuY2UtPnJpbmcpOwogfQogCiAvKioKQEAg
LTc0NywxMiArNzY0LDcgQEAgdm9pZCBjaWtfZG1hX3ZtX2ZsdXNoKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2LCBpbnQgcmlkeCwgc3RydWN0IHJhZGVvbl92bSAqdm0KIAlyYWRlb25fcmluZ193
cml0ZShyaW5nLCBWTUlEKDApKTsKIAogCS8qIGZsdXNoIEhEUCAqLwotCS8qIFdlIHNob3VsZCBi
ZSB1c2luZyB0aGUgbmV3IFBPTExfUkVHX01FTSBzcGVjaWFsIG9wIHBhY2tldCBoZXJlCi0JICog
YnV0IGl0IGNhdXNlcyBzRE1BIHRvIGhhbmcgc29tZXRpbWVzCi0JICovCi0JcmFkZW9uX3Jpbmdf
d3JpdGUocmluZywgU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfU1JCTV9XUklURSwgMCwgMHhmMDAw
KSk7Ci0JcmFkZW9uX3Jpbmdfd3JpdGUocmluZywgSERQX01FTV9DT0hFUkVOQ1lfRkxVU0hfQ05U
TCA+PiAyKTsKLQlyYWRlb25fcmluZ193cml0ZShyaW5nLCAwKTsKKwljaWtfc2RtYV9oZHBfZmx1
c2gocmRldiwgcmlkeCk7CiAKIAkvKiBmbHVzaCBUTEIgKi8KIAlyYWRlb25fcmluZ193cml0ZShy
aW5nLCBTRE1BX1BBQ0tFVChTRE1BX09QQ09ERV9TUkJNX1dSSVRFLCAwLCAweGYwMDApKTsKLS0g
CjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
