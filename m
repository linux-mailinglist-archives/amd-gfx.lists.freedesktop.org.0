Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C248EBD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E240898C8;
	Mon, 17 Jun 2019 19:27:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261C0898FD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:46 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12207728qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Z54TrU4txGiKQESoJ0zeNmYOv6TpAVYj3j9sbydwkY=;
 b=NCd37wzeqF9ycdF4P7ItIzUK4kTFpQ4Kr93SXX6g1mA9izL90veNVrowzAxUfOdOaC
 PSnvQWcvNcHdGDE9aveTWybCLkS8xTBXlWqPttWiJdieWt+WTo9gGI2kCYGGXlC6kNUl
 kFtdmsKA90+YuY7qphuxW2rfsNHyjohvVneEkLr3BmivbJ1QPVl+V0rNcczTZ+VQ6Nq1
 foNccLczbUnoeRwU6qqrdWxxgw0aRYurUzh6UbvSQibSAFTpVfOwRfqnJBUYaPo81EAe
 eft5kmixIeLxOu3XOIQCSQtWZd+rp71jIkjiTIBzMZ7pkvdHYGxWS0nWL57yqS7bvzDm
 walQ==
X-Gm-Message-State: APjAAAXiPwVp+PNji5VZu/Xr3nTB+NfQH0RVpYYHishttaHYmTkANdVk
 CXoSpqmvaXz1lVktSDKeFZXkkguCgxo=
X-Google-Smtp-Source: APXvYqxyEnx/vLHUfbMl3y4oHyt+UIll5/9nJE+n49iHZmW1ycJTTyKqWoBdnzrEYCbTCkJjZDcNFQ==
X-Received: by 2002:ac8:2e6a:: with SMTP id s39mr92960400qta.201.1560799665179; 
 Mon, 17 Jun 2019 12:27:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 133/459] drm/amdkfd: Add mqd size in mqd manager struct for
 gfx10
Date: Mon, 17 Jun 2019 14:25:58 -0500
Message-Id: <20190617192704.18038-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Z54TrU4txGiKQESoJ0zeNmYOv6TpAVYj3j9sbydwkY=;
 b=j663jQNBqtWtjqZbcXKk/OaE+CpcpeuU6CqoKQEmmE727CNvg7gHQnmxRz9MXwbOBP
 0BqlL2klos0zLIEy1t5smq5qZH4fsftICRPkkt5D3CZwaWIs9hrK4KFmY3kEhk235tHI
 ACnr0dF0ixptPfyBQ+oi4P/hhD9KjgMCxxl9dZOn7qpja+To9QKZAzdlIF4B2Q3sWaXK
 IZ7A5Y0qz/SwzmxABX5vOsYEzxpN/luqIi+jmLhx0wlTIIyQpie+3Zrqoz7yKRL8XFc2
 koDkMc0DBM/6DZMFhFmPRWEFcP6R/JbtZ1RSqCJU/Mm8vqxGOEIzcIAIqFocNmjR5RPq
 Podg==
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

QWxzbyBpbml0aWFsaXplIG1xZCBzaXplIG9uIG1xZCBtYW5hZ2VyIGluaXRpYWxpemF0aW9uCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKaW5kZXggZGIzOTc5NTIwZjU0Li41
ZWNjNmQzYTFiMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9t
cWRfbWFuYWdlcl92MTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXJfdjEwLmMKQEAgLTQ3OCw2ICs0NzgsNyBAQCBzdHJ1Y3QgbXFkX21hbmFnZXIgKm1x
ZF9tYW5hZ2VyX2luaXRfdjEwKGVudW0gS0ZEX01RRF9UWVBFIHR5cGUsCiAJCW1xZC0+dXBkYXRl
X21xZCA9IHVwZGF0ZV9tcWQ7CiAJCW1xZC0+ZGVzdHJveV9tcWQgPSBkZXN0cm95X21xZDsKIAkJ
bXFkLT5pc19vY2N1cGllZCA9IGlzX29jY3VwaWVkOworCQltcWQtPm1xZF9zaXplID0gc2l6ZW9m
KHN0cnVjdCB2MTBfY29tcHV0ZV9tcWQpOwogCQltcWQtPmdldF93YXZlX3N0YXRlID0gZ2V0X3dh
dmVfc3RhdGU7CiAjaWYgZGVmaW5lZChDT05GSUdfREVCVUdfRlMpCiAJCW1xZC0+ZGVidWdmc19z
aG93X21xZCA9IGRlYnVnZnNfc2hvd19tcWQ7CkBAIC00OTIsNiArNDkzLDcgQEAgc3RydWN0IG1x
ZF9tYW5hZ2VyICptcWRfbWFuYWdlcl9pbml0X3YxMChlbnVtIEtGRF9NUURfVFlQRSB0eXBlLAog
CQltcWQtPnVwZGF0ZV9tcWQgPSB1cGRhdGVfbXFkX2hpcTsKIAkJbXFkLT5kZXN0cm95X21xZCA9
IGRlc3Ryb3lfbXFkOwogCQltcWQtPmlzX29jY3VwaWVkID0gaXNfb2NjdXBpZWQ7CisJCW1xZC0+
bXFkX3NpemUgPSBzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRlX21xZCk7CiAjaWYgZGVmaW5lZChD
T05GSUdfREVCVUdfRlMpCiAJCW1xZC0+ZGVidWdmc19zaG93X21xZCA9IGRlYnVnZnNfc2hvd19t
cWQ7CiAjZW5kaWYKQEAgLTUxNyw2ICs1MTksNyBAQCBzdHJ1Y3QgbXFkX21hbmFnZXIgKm1xZF9t
YW5hZ2VyX2luaXRfdjEwKGVudW0gS0ZEX01RRF9UWVBFIHR5cGUsCiAJCW1xZC0+dXBkYXRlX21x
ZCA9IHVwZGF0ZV9tcWRfc2RtYTsKIAkJbXFkLT5kZXN0cm95X21xZCA9IGRlc3Ryb3lfbXFkX3Nk
bWE7CiAJCW1xZC0+aXNfb2NjdXBpZWQgPSBpc19vY2N1cGllZF9zZG1hOworCQltcWQtPm1xZF9z
aXplID0gc2l6ZW9mKHN0cnVjdCB2MTBfc2RtYV9tcWQpOwogI2lmIGRlZmluZWQoQ09ORklHX0RF
QlVHX0ZTKQogCQltcWQtPmRlYnVnZnNfc2hvd19tcWQgPSBkZWJ1Z2ZzX3Nob3dfbXFkX3NkbWE7
CiAjZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
