Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1848F80
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD44D89CC4;
	Mon, 17 Jun 2019 19:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144089CA1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so12232197qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djvqoro8sQZP+h21/FBft3WA8XGozTOZy2SWfzqAJxg=;
 b=A+INEFw3RTOShn4uxcVveYSGIzSFrvC8nudvnWq8o5XRXBZtwrS1Lc0X1fY9koOnyM
 7MMVrjdqzPiOdWLZfDlRxqAlXD5QUxnRXwhbNLL7xqKNk0Ba/IIT/G3Cp2Jz/G109doT
 GeXQXp4M0+pRdeF+QaPtx6ELxPVooyI0bBX+2sttRXGXc7BMD/TqqFz+7OF6ANGPQW44
 f5ymLw/IdA9YkZSzcYjug5puiraBVRAIgQ0S8n4ttDQl1+qi2NwOGL4aFHtsWDOhi/X6
 +cBYLzOIyuGakIZ0blo9aib+rk1z12oshs4ADCVqVGmG1N5LrAbJFpXfd+t0pCBhtHgx
 aZ2Q==
X-Gm-Message-State: APjAAAX8K5Gpus2ZaOtOTnqCu4Q5hbg/C+1nD/KNCYFscv9EHSu1YCeE
 0+KUUt3Rm/64T27+TDGetCNHcv3DiJ4=
X-Google-Smtp-Source: APXvYqyOddpwsYGe2A/41yt34eNhuIFYYQ3fjGPitcrx9wDu0O3xYXmjzOqe/5sQEQECVD+VNay/bw==
X-Received: by 2002:ac8:26c8:: with SMTP id 8mr38815403qtp.308.1560799933730; 
 Mon, 17 Jun 2019 12:32:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 265/459] drm/amd/powerplay: enable ac/dc feature on navi10
Date: Mon, 17 Jun 2019 14:30:32 -0500
Message-Id: <20190617193106.18231-66-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djvqoro8sQZP+h21/FBft3WA8XGozTOZy2SWfzqAJxg=;
 b=Hpet/IqY+ZNWFQig48CojnQp+MIR1hdwqrX+uYU/D0qXYdZfS4Uc/oJoXrN0UP/moR
 FEs/y/Nw1t4XCUN66GHFRe9X0+hpZrqJKVXR36+M/xPeNZzaj+gMFzqBZ2xDWK+BoIEu
 Ai1qfFLubVrL/hGvDmWK95Z28tQ8vAfxValQ11WxXG0/YCSINMccCIG5K6caRyYpEjxf
 N0HEBpcSqvmfub2/NhH1XtGNEpFLNgMlak4eZ5ESUCWZD+c/utOaCtjyv9HFYJjAB5x8
 p8qncxTUir0rD591PQAPcHgRFYPZHdHw6RFJUC9Vl2vIZPTC8pN9F78NHPIwjVTZ5GgX
 T0Yg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCmVuYWJsZSBhYy9kYyBm
ZWF0dXJlIG9uIG5hdmkxMC4gY3VycmVudGx5IHdlIGRvbid0IGhhdmUKdGhlIGNhc2UgdG8gdmVy
aWZ5IGl0LgoKU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBjMzEyZWFkY2YzZTAuLjJhODVlZjQ3NmExZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMzI5LDcg
KzMyOSw4IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENFRkNMS19CSVQpCiAJ
CQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19HRlhDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfRFNfRENFRkNMS19CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9G
V19EU1RBVEVfQklUKTsKKwkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0RTVEFURV9CSVQp
CisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9BQ0RDX0JJVCk7CiAKIAlpZiAoYWRldi0+cG0u
cHBfZmVhdHVyZSAmIFBQX01DTEtfRFBNX01BU0spCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21h
c2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
