Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414315F19
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776A89F5F;
	Tue,  7 May 2019 08:15:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AEE89F4F
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:15:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so20914461wrr.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 01:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=hU558w67ya9Lbh5G9Kl+Fl75MbMdLDbbeRLkg7OOmfFk8S/7mQNgsFV4isYqcWd77l
 wIJqbiE3xT2wLLv7hiktfNTsf+S1Ps7uYwbhxCyAjXG9A9ACrfylTKE1kthIM57KvHjN
 EwAJ87sK7K4BqXS+Vq7N1o17aEY1BfqjTerKC6GTmXs1DHjrQ9G4z9ZcxU0xxje9g1Ja
 dnRjsDW0+iQQbO3mBTUeaWd8sE+lcrQfJ4WQIIoNy9XeBYBch/+DSjFAMkUPMUYAEKWC
 IfJOy9jlAYl5QwgXKfAoK0rFq1zEq0USCnFRjUoqWNr36QjGlw1FrWLb2uRxDJKesBq4
 Tc0w==
X-Gm-Message-State: APjAAAXEEN/klvtgNA6HragpVxUdIvAHEvo8R+ojPb9suw3UkjGo405U
 H8v1P+3mycuhh1rhZ0jWi04xX7Db
X-Google-Smtp-Source: APXvYqwmjO70QNGY5WRbtP5+q+p9sQ5KrlFDNII/o68NbtqZu7O3OLKlui5Fv3qggSuca9dsgO7sRA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr21297615wrg.215.1557216916591; 
 Tue, 07 May 2019 01:15:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id v16sm15065476wru.76.2019.05.07.01.15.15
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:15:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/9] drm/ttm: remove the backing store if no placement is given
Date: Tue,  7 May 2019 10:15:07 +0200
Message-Id: <20190507081512.2619-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081512.2619-1-christian.koenig@amd.com>
References: <20190507081512.2619-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZsgPG7bOHi+ZU8UR4bm1s7tE2+P5qIRqiiMLQC0MyfE=;
 b=rK4BpRnsNMdsXBDHRc2Z35YYQGjTauYAN9EQzLkZZCi1BUXnc650iBn4VzSEXOOyGG
 C0e22UCm0WSW4JSZBu6L0I/QG6kpdd07E5PMVnGygnEgcOt6HIfhNOz92HMVOiTkZrW7
 B++KC9xeyyqUXMLPFUWsxuzFENe0yIoRqD/SoN4jJ20r0wMr97d3ekt+z9R6ZgQogMAM
 KbJoF3eku0coCOANtxetXDG4fcaSad9d7UErbFcH/8+jY94MEBk4HhleZnpcQQtyFNSw
 62XPPcIfbYkx+UL3W2likq1JTw1drii2lAKUyptlL2sK7HfExkxVfGUCCi4HfoKRdNNJ
 kpJg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyODQ1ZmNlYjJmYmQuLjg1MDJiM2VkMmQ4OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMTYwLDYgKzExNjAsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCXJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChiby0+cmVzdik7CisKKwkvKgorCSAq
IFJlbW92ZSB0aGUgYmFja2luZyBzdG9yZSBpZiBubyBwbGFjZW1lbnQgaXMgZ2l2ZW4uCisJICov
CisJaWYgKCFwbGFjZW1lbnQtPm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC0+bnVtX2J1c3lf
cGxhY2VtZW50KSB7CisJCXJldCA9IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKKwkJaWYg
KHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0dXJuIHR0bV90dF9jcmVhdGUoYm8sIGZhbHNl
KTsKKwl9CisKIAkvKgogCSAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBtb3ZlIGJ1ZmZlci4K
IAkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
