Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6049031
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A16E029;
	Mon, 17 Jun 2019 19:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AD189FED
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:24 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so12258456qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gwUVJ58oWJjufXJNTmjs0+DWAjQ7wfwZAShd51Kyf4=;
 b=bN0p/GTg3gFzwfK5Qp/fk8sq1hFBM6Y7qdxrmm8uIwGbQiUvVh8ghcaZ3w88GHHw+X
 5KHpODxCPU8Gf8Ham2u7z18ioVvm1n/J6ZS1P7XtI1K5wdlEDmkOAqeKM9qowITL8JIu
 vA2ew46ZLx8hkWT65igU84ErgHKo4zek4LrY5zx3d/jFW5GXrL/Sdd/mvt7B6VUPuICa
 btgTFV7RL6+QcZeqLMlW4SRn26yUwnr/sYvVGUYuEHBDnfx4rfp9Id3CO6T9ipp8O8Wi
 oglnsLQSu7zQaxwRa8LtJB+gem9nI/OTeof12icJRNQo0P9117CAI8gbtZQKIqGO7Mtj
 +L5w==
X-Gm-Message-State: APjAAAX6XacGBcZ7UrE8OBbRROxaviA48P0iUNNjVppcs5eRCgQJ2+rW
 pXrJgrfhyT0FPQmV8RPqWQcoyKXntR3UCQ==
X-Google-Smtp-Source: APXvYqxvo0kbhs+7l5PC6/4dRESOcO+axtv4dh5EhR8SIDeTSXsg7MHsU4ludyi6aQ8/6/v3CRScIw==
X-Received: by 2002:ac8:4705:: with SMTP id f5mr69057194qtp.99.1560800843268; 
 Mon, 17 Jun 2019 12:47:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 387/459] drm/amd/display: Add profiling tools for bandwidth
 validation
Date: Mon, 17 Jun 2019 14:45:28 -0500
Message-Id: <20190617194540.18497-88-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gwUVJ58oWJjufXJNTmjs0+DWAjQ7wfwZAShd51Kyf4=;
 b=TU7xk6o1WiVV+Kyw/cc1VRNiJO3tvkeOceGvKC8PAoVLa2+srGGmwzxEmW3iguwnOc
 PkLm3xS7WbRRS9Uuma3kpEiiU/OydG6i+KIv0+kWQqJntLXWVfTLwP42e2qy0BqEYmkb
 kFYFKxVpqG+REmJS4ckdBPLe9kSpEp9kyv6KUh0Fjy00MHet/Xkdzkf7WoOBu/sMCSFq
 JVx6UdgpYv3Dsu7mVnM9JELnuWj2v30N8NjpGtdoxsNkNS2YVUEF1mfBl877xScPnIQP
 pYr+GN4XYLAR6r9y+xjABVfU4sJfP+OrAAFEcqL1zZNuXW1mKX8/dptxuvYYBiZXp+pe
 3o2A==
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
 Joshua Aberback <joshua.aberback@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldCldl
IHVzZWQgdGhpcyBjaGFuZ2UgdG8gaW52ZXN0aWdhdGUgdGhlIHBlcmZvcm1hbmNlIG9mIGJhbmR3
aWR0aCB2YWxpZGF0aW9uLAppdCB3aWxsIGJlIHVzZWZ1bCB0byBoYXZlIGlmIHdlIG5lZWQgdG8g
aW52ZXN0aWdhdGUgZnVydGhlci4KCltIb3ddCldlIHVzZSBwZXJmb3JtYW5jZSBjb3VudGVyIHRp
Y2sgbnVtYmVycyB0byBwcm9maWxlIHBlcmZvcm1hbmNlLCB0aGV5IGxpdmUKYXQgZGMtPmRlYnVn
LmJ3X3ZhbF9wcm9maWxlIChzZXQgLmVuYWJsZSBpbiBkZWJ1Z2dlciB0byB0dXJuIG9uIG1lYXN1
cmluZykuCgpTaWduZWQtb2ZmLWJ5OiBKb3NodWEgQWJlcmJhY2sgPGpvc2h1YS5hYmVyYmFja0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tl
ZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jICAgfCAxMyAr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMK
aW5kZXggMzcxZDk2MjkwZDg2Li5jOWI3MzQwYzk2MDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC0xOTEyLDYg
KzE5MTIsOCBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLCBz
dHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiB7CiAJYm9vbCBvdXQgPSBmYWxzZTsKIAorCUJXX1ZB
TF9UUkFDRV9TRVRVUCgpOworCiAJaW50IHBpcGVfY250LCBpLCBwaXBlX2lkeCwgdmxldmVsLCB2
bGV2ZWxfdW5zcGxpdDsKIAlpbnQgcGlwZV9zcGxpdF9mcm9tW01BWF9QSVBFU107CiAJYm9vbCBv
ZG1fY2FwYWJsZSA9IGNvbnRleHQtPmJ3X2N0eC5kbWwuaXAub2RtX2NhcGFibGU7CkBAIC0xOTI0
LDYgKzE5MjYsOCBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRj
LCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAJZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3Qg
KnBpcGVzID0ga3phbGxvYyhkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQgKiBzaXplb2YoZGlzcGxh
eV9lMmVfcGlwZV9wYXJhbXNfc3QpLCBHRlBfS0VSTkVMKTsKIAlEQ19MT0dHRVJfSU5JVChkYy0+
Y3R4LT5sb2dnZXIpOwogCisJQldfVkFMX1RSQUNFX0NPVU5UKCk7CisKIAlBU1NFUlQocGlwZXMp
OwogCWlmICghcGlwZXMpCiAJCXJldHVybiBmYWxzZTsKQEAgLTE5NTcsNiArMTk2MSw3IEBAIGJv
b2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0
ZSAqY29udGV4dCwKIAlwaXBlX2NudCA9IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2Nv
bnRleHQoZGMsICZjb250ZXh0LT5yZXNfY3R4LCBwaXBlcyk7CiAKIAlpZiAoIXBpcGVfY250KSB7
CisJCUJXX1ZBTF9UUkFDRV9TS0lQKHBhc3MpOwogCQlvdXQgPSB0cnVlOwogCQlnb3RvIHZhbGlk
YXRlX291dDsKIAl9CkBAIC0yMTE3LDcgKzIxMjIsMTAgQEAgYm9vbCBkY24yMF92YWxpZGF0ZV9i
YW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LAogCX0KICNl
bmRpZgogCisJQldfVkFMX1RSQUNFX0VORF9WT0xUQUdFX0xFVkVMKCk7CisKIAlpZiAoZmFzdF92
YWxpZGF0ZSkgeworCQlCV19WQUxfVFJBQ0VfU0tJUChmYXN0KTsKIAkJb3V0ID0gdHJ1ZTsKIAkJ
Z290byB2YWxpZGF0ZV9vdXQ7CiAJfQpAQCAtMjIxMyw2ICsyMjIxLDggQEAgYm9vbCBkY24yMF92
YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0
LAogCQkJCQkJCSE9IGRtX2RyYW1fY2xvY2tfY2hhbmdlX3Vuc3VwcG9ydGVkOwogCWNvbnRleHQt
PmJ3X2N0eC5idy5kY24uY2xrLmRwcGNsa19raHogPSAwOwogCisJQldfVkFMX1RSQUNFX0VORF9X
QVRFUk1BUktTKCk7CisKIAlmb3IgKGkgPSAwLCBwaXBlX2lkeCA9IDA7IGkgPCBkYy0+cmVzX3Bv
b2wtPnBpcGVfY291bnQ7IGkrKykgewogCQlpZiAoIWNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhb
aV0uc3RyZWFtKQogCQkJY29udGludWU7CkBAIC0yMjYxLDExICsyMjcxLDE0IEBAIGJvb2wgZGNu
MjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqY29u
dGV4dCwKIAlEQ19MT0dfV0FSTklORygiTW9kZSBWYWxpZGF0aW9uIFdhcm5pbmc6ICVzIGZhaWxl
ZCB2YWxpZGF0aW9uLlxuIiwKIAkJZG1sX2dldF9zdGF0dXNfbWVzc2FnZShjb250ZXh0LT5id19j
dHguZG1sLnZiYS5WYWxpZGF0aW9uU3RhdHVzW2NvbnRleHQtPmJ3X2N0eC5kbWwudmJhLnNvYy5u
dW1fc3RhdGVzXSkpOwogCisJQldfVkFMX1RSQUNFX1NLSVAoZmFpbCk7CiAJb3V0ID0gZmFsc2U7
CiAKIHZhbGlkYXRlX291dDoKIAlrZnJlZShwaXBlcyk7CiAKKwlCV19WQUxfVFJBQ0VfRklOSVNI
KCk7CisKIAlyZXR1cm4gb3V0OwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
