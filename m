Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C148EDE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C7D89A61;
	Mon, 17 Jun 2019 19:28:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2A89A32
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so12179497qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4S74Z8IhwxkVJyc1caVf8oxzFMoln3TG6ROA5imc1w=;
 b=VEa3jK+QvE/A7K9f7q3em7FEDHONrQdR539BbDutj2Xi3o/UcbPWiZTis2ACn3qih+
 2n1biTvN61171hekZxGsLE8sDRzujnR8GRb0wW4yhj65pQqptelhQ22DFySFM1sjXHKf
 QLQIRTZt5anIg00nZaGgzXc2gVpNQuN66VyF0/bKYkIHrMPH7Ppo+ACh28d44FCZ/K3Z
 ATaM29XUWz+2I8zA8GYoO+qkeKuKwdVcmGiyqLkzPIwcK90/8JCdANqMHANc8LEe1fYx
 vISZoUPvE5Nnh3UOiy2mLQD+aCxsWNQR/Lr/s2Yq2xvKCiCuZng21hSC8zSoOgL4Ei87
 9dXg==
X-Gm-Message-State: APjAAAUIRLDsByeTKpT8WRmmKTBCyrvnd+uloEXHAex7b8siLkAe3u0Q
 GskEHol1pBZ9aZCGNKFPqoKSQ9caBXo=
X-Google-Smtp-Source: APXvYqzbRwfizrkFp1VVkGT0diXo9QY0CDj8iqj6A7o0yScFFxel343egpmOa7BPuO2ScjGjTZr6Vg==
X-Received: by 2002:a0c:95af:: with SMTP id s44mr22033208qvs.162.1560799690502; 
 Mon, 17 Jun 2019 12:28:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 162/459] drm/amd/powerplay: add smu11 smu_if_version check for
 navi10
Date: Mon, 17 Jun 2019 14:26:27 -0500
Message-Id: <20190617192704.18038-63-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4S74Z8IhwxkVJyc1caVf8oxzFMoln3TG6ROA5imc1w=;
 b=aZjiJUjH/ujVZuplrxZQ8SjvARTj74u6EiUM/DWVFUJCl9ZlmjjkcDniINuJZNbkBq
 sR/VEviRek34XFftMukzfYHTf0h8IBYEa6IYwX61VwnqinRrPQYYSiJ45jlw05uSExp2
 J8Gb0L/01KUX8bCTFSO326rm02G0olYNIdJZAZ7gETHGBfpAeAhoLhMEinxl/JnTuPAf
 xwy1UGgZGqzV0NT6GTaTC3l48W65t4MX6cWzk4pax8KPJ0JsYzrV9YeKgKHTheMIByOI
 ATcZ7QD9cVexC2f0dLLbRzawimLAHlewIxnuMKlE3sjQIIx1Ijsbj3TO5T1iOjOouIUV
 sFKQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBzbXUxMSBmdyB2ZXJz
aW9uIGNoZWNrIGZvciBuYXZpMTAKClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKaW5kZXggNjRmZWNiYjA4OTk1Li40MjRiMTM4ZWJhMmYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTMwNSw0ICszMDUsNSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsK
IHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJ
c211LT5wcHRfZnVuY3MgPSAmbmF2aTEwX3BwdF9mdW5jczsKKwlzbXUtPnNtY19pZl92ZXJzaW9u
ID0gU01VMTFfRFJJVkVSX0lGX1ZFUlNJT047CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
