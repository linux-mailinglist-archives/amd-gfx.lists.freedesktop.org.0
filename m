Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F420A9F1B1
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 19:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E32589815;
	Tue, 27 Aug 2019 17:33:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585E895D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 16:29:43 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id 18so47657329ioe.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 09:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IPfWvcwVfrcY1k8aoUFruMr5YkWe0H+HYKEdtrmh3H8=;
 b=JA3YM5jKAGBwG6/KU8nFuED7niYwcM5NtZTLCJJYxYNRACcszilWCCQdez4Qa8CxlU
 bLNoydWEt9LaU8EuXfvfjAPwoK0iBXgkNYlH1G4otYTYlTWyg+k61/S3du1I50bs5+Wh
 kyKtY94hOrC86/QDlGWKobAWhZc1YgQjyNQI4gZ45k6MmoDvbc+IaljGwrAqIDRREVf7
 sWI/OxZAJh/xgHGO+znPcrdcQg24HZja1I/ASCX32Gu6XW4msjZnwWSLOMFW5IeKKL/w
 unyND87wTpIP24ru4jdMV7A0ecQtrxMnT9V/SP68MO9cbpgSTHiOrqXPZXMjq4KDWOgk
 OB7w==
X-Gm-Message-State: APjAAAVbWl+UIJpDPbb2REkpbaEylLeWQLb/dJ5MRUdycP+VVwf4TARk
 tqHyXz5u3WbhNTAj8G8lQvFXU0v8f7L5aw==
X-Google-Smtp-Source: APXvYqzdUQDLGPHiqiCzDf92LqsaVidtW1JcW3tvkc0lgAyUdMAr3tJqk4Caezea7fdrzV93W+PxFA==
X-Received: by 2002:a6b:b756:: with SMTP id h83mr32567090iof.147.1566923382513; 
 Tue, 27 Aug 2019 09:29:42 -0700 (PDT)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
 by smtp.gmail.com with ESMTPSA id h9sm14723177ior.9.2019.08.27.09.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 09:29:41 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: fix struct init in update_bounding_box
Date: Tue, 27 Aug 2019 10:29:24 -0600
Message-Id: <20190827162924.88524-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Aug 2019 17:33:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IPfWvcwVfrcY1k8aoUFruMr5YkWe0H+HYKEdtrmh3H8=;
 b=AHEBEuNVjcdNoAW+vvqZ+N3wKuz8LBL2T8s9b7O3ZaBiGh+If49H7yqyqmdkoI/d1+
 3PnFydaJwChLjqnLhjHZqw7gl7m96W6hkpZo2NVMV6HsMTlndtoutmWv5x1Fndh0Hle5
 PL72nVjCIiOB544xh8zFFqp5gKS2S8wtjQUMk=
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, Raul E Rangel <rrangel@chromium.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZGNuMjBfcmVzb3VyY2UuYzoyNjM2Ojk6IGVycm9yOiBtaXNzaW5nIGJyYWNlcyBhcm91bmQgaW5p
dGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNdCiAgc3RydWN0IF92Y3NfZHBpX3ZvbHRh
Z2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9
IHswfTsKICAgICAgICAgXgoKRml4ZXM6IDdlZDRlNjM1MmMxNmYgKCJkcm0vYW1kL2Rpc3BsYXk6
IEFkZCBEQ04yIEhXIFNlcXVlbmNlciBhbmQgUmVzb3VyY2UiKQoKU2lnbmVkLW9mZi1ieTogUmF1
bCBFIFJhbmdlbCA8cnJhbmdlbEBjaHJvbWl1bS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBiOTQ5ZTIw
MmQ2Y2IuLmQ4ZGQ5OWJmYTI3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI2MzMsNyArMjYzMyw3IEBAIHN0
YXRpYyB2b2lkIGNhcF9zb2NfY2xvY2tzKAogc3RhdGljIHZvaWQgdXBkYXRlX2JvdW5kaW5nX2Jv
eChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgX3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCAqYmIs
CiAJCXN0cnVjdCBwcF9zbXVfbnZfY2xvY2tfdGFibGUgKm1heF9jbG9ja3MsIHVuc2lnbmVkIGlu
dCAqdWNsa19zdGF0ZXMsIHVuc2lnbmVkIGludCBudW1fc3RhdGVzKQogewotCXN0cnVjdCBfdmNz
X2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9zdGF0ZXNbTUFYX0NMT0NLX0xJTUlU
X1NUQVRFU10gPSB7MH07CisJc3RydWN0IF92Y3NfZHBpX3ZvbHRhZ2Vfc2NhbGluZ19zdCBjYWxj
dWxhdGVkX3N0YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9IHt9OwogCWludCBpOwogCWlu
dCBudW1fY2FsY3VsYXRlZF9zdGF0ZXMgPSAwOwogCWludCBtaW5fZGNmY2xrID0gMDsKLS0gCjIu
MjMuMC4xODcuZzE3ZjViNzU1NmMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
