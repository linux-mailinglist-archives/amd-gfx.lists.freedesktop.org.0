Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC9C48F25
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8902589B66;
	Mon, 17 Jun 2019 19:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77623897E7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:53 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so5825859qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrnG01WiLLaSaRtPjViDcA2PxZzt2Ceq25b6z4Eezk8=;
 b=nwUMkHUiYrE+jTdP1HKedTbLrukgPn2lCEcVIvAPlKc2eocUA+qVGPikQS4qe/k22B
 ICJqptZns8HJqTtOWzUWhoC60UdGrYI8935LPefV7xxTQdAyCfv+eeJnKDqxuOEkEmnz
 sTqp/hwlT00aTZQ/DqFUgqutquVqVc/a1KCXeQlRotxWO6PxOvBZ3WiffNf/SDzj3+RS
 Js/GZY5Gx82xqfNMKAM0J9xY0rujrdUvIXYWzyv65Lk/Bl2qtZ3/pGVwvjAsP4padIYT
 K0be9nhAyCU28josElELjfbEfkP2cXtXAUCqD1gRJyrEDC/RCifcgOOWbK2f3mRTbRaU
 qqoA==
X-Gm-Message-State: APjAAAUc2IMf3/uQPQesBpjghOjNx+6laSoSZ0zPy1qAUqpY77KLMbp0
 s9EhznI1jkgFOF04sZHoVgyM3A/BiPc=
X-Google-Smtp-Source: APXvYqxTHZpVrnYKS4vPvD41pxrwpBLpKe3W6UAf7Jui6g3mSs8vQnmOOgZChKLG1qGLRIRsTcydpQ==
X-Received: by 2002:a0c:99e9:: with SMTP id y41mr16279823qve.186.1560799852504; 
 Mon, 17 Jun 2019 12:30:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 196/459] drm/amd/powerplay: enable vcn powergating v2
Date: Mon, 17 Jun 2019 14:30:39 -0500
Message-Id: <20190617193042.18183-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrnG01WiLLaSaRtPjViDcA2PxZzt2Ceq25b6z4Eezk8=;
 b=Pd4dPu86/aRCGspRQC1+eC15Onx4zkN/UZdZVwmN6UDFEn9S8VLdnmJ4YNy1w6ZWTh
 PskX6jWiDq+uQ2L6Mq0ioZWVaVf7DJOx+EafA3HpylYGrKeachex0uw/BffBVhADt1nI
 U6vgIdHrUS114s3l6O2P8Z0dRC9J/89mxWao5SY2GNUgTlmkgnPMduOTOUL/K/mVoo1A
 2p2klNgMB3/UMM1iiIzTE2Rb7iBk2zNBrsEjnS4FayHiwcV1bmQX+IpL29hRNgy/Gg0+
 7LCV2En53ibTchMDCaxhuQOWPx/9nb/fCuvchX939BvNg6H10qmgB3tFusk5jXIaYnoY
 3oKg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Huang Rui <ray.huang@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCmVuYWJsZSB2Y24gcG93
ZXJnYXRpbmcgaW4gZHJpdmVyIGZvciBuYXZpMTAKCnYyOiBzZXQgdmNuIHBnIGJpdCBhY2NvcmRp
bmcgdG8gQU1EX1BHX1NVUFBPUlRfVkNOIGZsYWcKClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVu
ZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5Y
aWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNmQxYjAxYTUyMjhhLi43ZmM3ZmQ3YzJmYTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTI3NSw2ICsyNzUs
OSBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LAogCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0dGWF9TU19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhPRkZfQklUKTsKIAor
CWlmIChzbXUtPmFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOKQorCQkqKHVpbnQ2
NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1ZDTl9QR19CSVQpOwor
CiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
