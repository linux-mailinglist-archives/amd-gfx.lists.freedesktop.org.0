Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1004F7CB35
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017726E28A;
	Wed, 31 Jul 2019 17:58:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7515C6E1B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:44 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id j21so27327106uap.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NdINPD4xjhExp9FINhBJqRKkVHog3XjhL5ewhMkOyhE=;
 b=ivkZVL6x9lTbUvjUppQkO53/ZqErus9tx+ApsEpkCaiSEXAJaMRFHizd8dYOkKOGP4
 Ytnjn4l/h3mRVxQv36XQCtI+XRGwMJutRCFQ2B72SK1SDP7/GDNdNGXDdeA/Y6cfK1w6
 7yM9U0npMxf9WLJpi4aA6EhxE/pTb22s1lqOXrjioH6r5mhxudeP9NwoPf7zmGmzBN8F
 awnj0xkIkTmXuI4a9f2i76fNWK/nfTM3AY9iCTdgP1MUYkK8CTKrlncRzL0KVYaEvuoY
 gYOUlHFEJDq2KIxwAkWePdNZwpsXR/OmegdZmDY53NmO8NHQ5gs0AWTxRHxt89sKi4ag
 IaYA==
X-Gm-Message-State: APjAAAWXBpectrjYaRRIjdg+ClkFJHwC2oPLBxJwdbv5Jpz7y41etGto
 wAoZMs01wQb1H6Xhqh4rw683zvGE
X-Google-Smtp-Source: APXvYqzQqIFWnGdov706t7Rk/jt1P5AfoI5EukxN8MWojhbo5cjILFDNzULjG6uRiefemK0Bkv1LTQ==
X-Received: by 2002:ab0:7384:: with SMTP id l4mr67853643uap.8.1564595922305;
 Wed, 31 Jul 2019 10:58:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/26] drm/amdgpu: add support for recording ras error address
Date: Wed, 31 Jul 2019 12:58:06 -0500
Message-Id: <20190731175818.20159-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdINPD4xjhExp9FINhBJqRKkVHog3XjhL5ewhMkOyhE=;
 b=pYsERuIqUOI/sOIE3DDf31v5bwQg0ktavwdGFrC+xu1k2NDzQCg3mS8CGa7NnwwPVq
 b5VN769HULxccCJ89GIBUur/8b2qosgeHiKYRu1TyMBojz3lfWfGAL454cxTcCKwJBE7
 068bsDxnP39thmrRqvtciaigU4hSIYqNZUV4vFtYg2fqkhsSPiRI6VjXUSYUHibOzQnS
 XhbARkbKXbZ0KGgChNjeAftRt0VhGGusvcfFeAJxQp6UoNFCjDoPSVT+ECSZbgpNNynN
 4BnjFMIQkLj8Fw0MpOc3oqHGWpF/IsShaelHiWoZ7ZBmLAzv2RFiv4vRllwWzLeceUQ+
 8BRg==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKbW9yZSB0aGFuIG9uZSBlcnJvciBh
ZGRyZXNzIG1heSBiZSByZWNvcmRlZCBpbiBvbmUgcXVlcnkKClNpZ25lZC1vZmYtYnk6IFRhbyBa
aG91IDx0YW8uemhvdTFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERlbm5pcyBMaSA8ZGVubmlzLmxp
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMiArLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwgMiArKwogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggZTA4N2RhNDZmYzI0Li4xOTE0ZjM3YmVlNTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTU4Niw3ICs1ODYsNyBA
QCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9xdWVyeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJc3RydWN0IHJhc19xdWVyeV9pZiAqaW5mbykKIHsKIAlzdHJ1Y3QgcmFzX21hbmFnZXIgKm9i
aiA9IGFtZGdwdV9yYXNfZmluZF9vYmooYWRldiwgJmluZm8tPmhlYWQpOwotCXN0cnVjdCByYXNf
ZXJyX2RhdGEgZXJyX2RhdGEgPSB7MCwgMH07CisJc3RydWN0IHJhc19lcnJfZGF0YSBlcnJfZGF0
YSA9IHswLCAwLCAwLCBOVUxMfTsKIAogCWlmICghb2JqKQogCQlyZXR1cm4gLUVJTlZBTDsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCA4MGU5NGQ2MDRhMmUuLjA5
MjBkYjdhZmYzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaApAQCAt
MTMxLDYgKzEzMSw4IEBAIHN0cnVjdCByYXNfZnNfZGF0YSB7CiBzdHJ1Y3QgcmFzX2Vycl9kYXRh
IHsKIAl1bnNpZ25lZCBsb25nIHVlX2NvdW50OwogCXVuc2lnbmVkIGxvbmcgY2VfY291bnQ7CisJ
dW5zaWduZWQgbG9uZyBlcnJfYWRkcl9jbnQ7CisJdWludDY0X3QgKmVycl9hZGRyOwogfTsKIAog
c3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
