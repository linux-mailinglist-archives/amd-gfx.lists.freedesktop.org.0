Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C07999E
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E66E2A0;
	Mon, 29 Jul 2019 20:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F088A6E293
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:47 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id v6so41905616vsq.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DR+pxx5Ma9k2HAld2KFsT3S+PtBiEtjXjn6g1L0Wtfo=;
 b=FwMtdxUuleULenpjY9G0GUI+zTCm2ULbU+GSDNr84GAE76+TRbfvn58Ua0A9qHuqLn
 EpLoKPHpP8aaMLyClk3yfAZgdQW1pqQ9yvwWIRkvh88o8IOazrDqAuUPfR8YizcWxiBX
 hX3pskRwvEEYDJWRRIjF7IDGhNVLaBK69MCjIuIiRSxhu7dKzkBrXDavyso81HOAMo2i
 MvLkbVxu5Ty//neDn0c+RdOh5aPm2nSQs6Mq4ACDS2O8fwTfWCeWhYSMy5iPQ3gMoGsT
 RcpC61Z2l4gZFjX+qXG1MgLYCSZwx/gC8rSI6mvw2OAGqZu0EaIMDEda/ek/SsmCbIgA
 06XA==
X-Gm-Message-State: APjAAAVEcjyky339cXM0rG6mdMQkENfnZsuWaHLqi6hwAbL3FkrvguyB
 wIiApT0UCwZ0Ey+4ebkXt92P8Sdm
X-Google-Smtp-Source: APXvYqwE012DTA95UPTuEuaU/rzaHehAcWLziVieHEGGB7bFWj6v8EAxy8Re8ILboT+nyNLHG4b/OQ==
X-Received: by 2002:a67:d58a:: with SMTP id m10mr72681427vsj.15.1564431346877; 
 Mon, 29 Jul 2019 13:15:46 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 29/30] drm/amdgpu: correct irq type used for sdma ecc
Date: Mon, 29 Jul 2019 15:15:07 -0500
Message-Id: <20190729201508.16136-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DR+pxx5Ma9k2HAld2KFsT3S+PtBiEtjXjn6g1L0Wtfo=;
 b=SMlkQMexQDUdU69MTMt5kAJPE20SZzmrvvfogSboJMV8rBXVexU3f3xL9gSng5KHos
 L/dAJFebJJn5V6YZetnAseZlUxJV/bftG3x1WArlpZjX3H1/wuZdGQtZLCdVj4c/uAwq
 w+IoLN9KdXTegtsbToOGskrhjPAYu3y7OAPVnUMcrsVfm8uiGhgcit6ard93Lv7bqi1B
 xYON9YFd90HK8Rj43NrWY75Sm/WLxZ4tSdMZfAzj/2j4jcHMmRaUL7OXZ4KIOHPPiTn4
 32XmUM2ZpYyNGbKlI2lqVTXpVFtbgntxUd+HWq4iHb48BinDEt4uY7kgW2U046HIUBs8
 ouJw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKd2Ugc2hvdWxkIHBh
c3MgaXJxIHR5cGUsIGluc3RlYWQgb2YgaXJxIGNsaWVudCBpZCwKdG8gaXJxX2dldC9wdXQgaW50
ZXJmYWNlCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y0XzAuYwppbmRleCA1NjBkNjAzOGJiYjMuLjM2ZGM1MDI1YzQ2MSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTE3MDIsNyArMTcwMiw3IEBAIHN0YXRp
YyBpbnQgc2RtYV92NF8wX2xhdGVfaW5pdCh2b2lkICpoYW5kbGUpCiByZXN1bWU6CiAJZm9yIChp
ID0gMDsgaSA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsgaSsrKSB7CiAJCXIgPSBhbWRncHVf
aXJxX2dldChhZGV2LCAmYWRldi0+c2RtYS5lY2NfaXJxLAotCQkJc2RtYV92NF8wX3NlcV90b19p
cnFfaWQoaSkpOworCQkJCSAgIEFNREdQVV9TRE1BX0lSUV9JTlNUQU5DRTAgKyBpKTsKIAkJaWYg
KHIpCiAJCQlnb3RvIGlycTsKIAl9CkBAIC0xODQ2LDcgKzE4NDYsNyBAQCBzdGF0aWMgaW50IHNk
bWFfdjRfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5z
ZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgewogCQlhbWRncHVfaXJxX3B1dChhZGV2LCAmYWRldi0+
c2RtYS5lY2NfaXJxLAotCQkJc2RtYV92NF8wX3NlcV90b19pcnFfaWQoaSkpOworCQkJICAgICAg
IEFNREdQVV9TRE1BX0lSUV9JTlNUQU5DRTAgKyBpKTsKIAl9CiAKIAlzZG1hX3Y0XzBfY3R4X3N3
aXRjaF9lbmFibGUoYWRldiwgZmFsc2UpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
