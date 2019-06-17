Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2249040
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B6B6E034;
	Mon, 17 Jun 2019 19:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1396E034
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:25 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so7348467qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLmbz34RvSnkohWQtEumQqnkWVbEOs7gBAnyu8LNdAM=;
 b=rMV+dKWJIkkQpiDujqNYF2MA1Vl7XGnMPnpYzDx0EsSNRjP/R/I2vTV+/w7AP+3UhI
 wp6EKoX5WUYx2n4k4XypUSQenDDG2XwbZYZua/ntFVC12aIJ3TPlvLn14RjWyh+8v1DX
 yGG7k1wVR0FUMaQjqCA6ADRQEGKNf0bq/ftLaI1cb+E8JjFaPayZJzXYnUb2ehjcWiwC
 ssJAlWCw2sPtgDTNmib3tVdrzCz/egq06InmzHO9apxOyCYOm0YpgLW6HeQ/CIaoDlWK
 B9OdGEflV4RrSYJuwkuZMaACmDwMSbsID2yxlP9WNkNSCPTVFRXKJ74iYJQPGq4asVQb
 tFvA==
X-Gm-Message-State: APjAAAWvo1rO90AOw2xHYiG0riNw7N6u0E05D4R5qmcq5RD5uq5XhBOg
 6p4rQ98aL27o0TDX+i9PpctGpH1BczgzCg==
X-Google-Smtp-Source: APXvYqynr1f77MxHwQH6R9b/gRSUXf97hKs82Wi3Zj6WU5CDtmsGPm8vsGJ+bUV1W0zcZD8sTNxv1A==
X-Received: by 2002:aed:3944:: with SMTP id l62mr1982314qte.34.1560800964898; 
 Mon, 17 Jun 2019 12:49:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 34sm8125381qtq.59.2019.06.17.12.49.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 393/459] drm/amd/display: Disable display writeback on Linux
 for NV10
Date: Mon, 17 Jun 2019 14:49:09 -0500
Message-Id: <20190617194915.18618-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLmbz34RvSnkohWQtEumQqnkWVbEOs7gBAnyu8LNdAM=;
 b=j2BIO+UW5leWdM6tOrBChoqE3i0BP3rf5ov+yaPm+1qtWcNBkUHEWxYX02IeNsAwO/
 myoZgCZbjUD7O1esLeNU2lUSEZvUwljtZV7hbg5n2N6K/g6NDGxwXv55zdQQ0KnFslvI
 uvodPxcTTQCdVe00qtbEGNNayHqeOGxkkr+jSp8FynvG2aLfy/A3FQgECsGICsX7kwrO
 UPHF7ugt+q7lH9TSglytjyZokUM8AWdhS2+Y0pjFnIE9GU5W5we/vLyeZjEWj/jKz+UY
 1/ky0M8DSA5Wc8q9u9FU383K3seXRQm4rjK6jhnt1ppuDgZlFxw0+ZTT/EIhZXC7o1cD
 QdDw==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW1dIWV0gc3lzdGVtIGNyYXNo
IHdoZW4gaW5pdGlhbGl6ZSBkd2IKY3VycmVudCBsaW51eCBkcml2ZXIgZG9lcyBub3Qgc3VwcG9y
dCBkd2IuCiBkaXNhYmxlIHRoaXMgZmVhdHVyZSBmb3Igbm93LgoKW0hPV10gc2V0IG51bV9kd2Ig
PSAwIHRvIGRpc2FibGUgZHdiIGZvciBub3cKClNpZ25lZC1vZmYtYnk6IGhlcnNlbiB3dSA8aGVy
c2VueHMud3VAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCmluZGV4IGIyMzMzM2I3NGY1ZC4uZDI2NDJjYzUyYzg1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpA
QCAtNjIzLDcgKzYyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2VfY2FwcyByZXNf
Y2FwX252MTAgPSB7CiAJCS5udW1fYXVkaW8gPSA3LAogCQkubnVtX3N0cmVhbV9lbmNvZGVyID0g
NiwKIAkJLm51bV9wbGwgPSA2LAotCQkubnVtX2R3YiA9IDEsCisJCS5udW1fZHdiID0gMCwKIAkJ
Lm51bV9kZGMgPSA2LAogCQkubnVtX3ZtaWQgPSAxNiwKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9E
Q19EU0NfU1VQUE9SVAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
