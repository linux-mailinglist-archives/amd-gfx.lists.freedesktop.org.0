Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2849039
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2E66E02F;
	Mon, 17 Jun 2019 19:47:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF8C6E02F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12288826qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLmbz34RvSnkohWQtEumQqnkWVbEOs7gBAnyu8LNdAM=;
 b=TYEIy7dW8d9Mi59U4jPRgrtKwD4OZvwxjUZMvDNpk95iaMtTMCAsYoPofFr9vKTPaR
 isT9n68GgM+42MKUGmEaw0q47LfYz7nVbWGZLC/McCQ7II7L2r3kXE4DBct3a+PB2dMZ
 ZzL62oAwU+ZJizRHm6ImcAEKoEfuZ85uAttY+Ev5mlweu5RpH8tYiXQ5mYRA32iCLoXf
 4esKx9cQEun9QlmVVycYZRMKs8rraftlq/2oHPfJT3b1auyQEEvThywIe7T4kwRyOeD1
 5xAkbETwzKSpAgyF+pbqlqUQOSelpphCUHLzsnPi6czP1TCA3IH8p386xlmS5XR+sTH1
 8nMw==
X-Gm-Message-State: APjAAAVr43m1c6ZA2VVvC4PKm6Ljd3STIu3Kemo4Yn7L319p9Garfz4O
 tYePZAlfxHzW5WKT+cBrttJ3VaAxnUDirw==
X-Google-Smtp-Source: APXvYqzTqzyuI6e44j5baApIK2+0GCSskNfyBO3SX0qg1MQX6zSq7qKzrVTDTe7BOuSLkw1RfISfoQ==
X-Received: by 2002:a0c:c68d:: with SMTP id d13mr558536qvj.145.1560800850122; 
 Mon, 17 Jun 2019 12:47:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 393/459] drm/amd/display: Disable display writeback on Linux
 for NV10
Date: Mon, 17 Jun 2019 14:45:34 -0500
Message-Id: <20190617194540.18497-94-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLmbz34RvSnkohWQtEumQqnkWVbEOs7gBAnyu8LNdAM=;
 b=q/E0K58KHoRuZA8au55ApjOlfVrTo4X/NgStr0FZUPEvXsWpLv3BuPfQGUQQYvU9yO
 ZD+pxT5YYjXVODv/+8kgjKGcThsZD2FCuHwwVJjHllkCGTXjhiug/YxM8oeTxcScHWHU
 cO1eoiyhZUTwwVqQiBtRaye+mqiS3Up7+Q3SDeoNj80tr8OF7j97j4JJBLAMagxBMhnM
 IspmtBmNU2Je+p9a0BSHtMgyJW8S6X2vv4mPg3rd6BoXBfxbG6gJ4/prMBfHm0DUPwXh
 C/phlWrxOVJxfwJe0eHTWXhA+3VVQvuhkK3NinXbUQ5EXXEagbRo44TP0fJ9o5EZdEC7
 +iYw==
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
