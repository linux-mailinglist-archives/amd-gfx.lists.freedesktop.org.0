Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABF48FD2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E2189CD3;
	Mon, 17 Jun 2019 19:45:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8230389C9D
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so7001220qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bMJ09zXJLYoTy1LZ3XAz8s/kpI1JXxzmoJVL6LjJhA=;
 b=qVGaywqCMIbsdBhV3+hxNkBONV6nTRV2fs2Xi0/6qjzhDSKFBCvuqPoZBrsJfBNLTr
 807Q0m/w3wt7wB3zuDdkJbaXmKGYXSR48eAvYI+E5KsR6TyKkPlqOSKcb1Hm/W8w3U8y
 wPALzfeBKgFacjlzRoawFCYoA9kAXlfWThcNGyZMH1eQzBORgKX1pGJWVtnXda7gb0hg
 ImC7krcYR9bpUHpTq4fcPrMW++rLwfQc9iex96N+T8uFb8o+Mi8WSioW8J89+vljqRDg
 nByrEfojv0jn4U0xmcy0aOhOmInvBMXPl2a1L9rpIWP60SMmyswOGwlClixXcWsLnWCW
 21GA==
X-Gm-Message-State: APjAAAUqsvIHUtuNdouio0VzS2961eKFC0J26E3VqcTl3JhmDnByrwLH
 Y1vk0WDV4PQutvfDpO3Md7LoSZSwOnk=
X-Google-Smtp-Source: APXvYqyorRrqg4R7Rp1E6o/eXWTxeMnCscbzTaxet9p5S4dFhVUsE3ToxO39sx56h1MJ3J3dPK0tkQ==
X-Received: by 2002:a05:620a:1329:: with SMTP id
 p9mr23151232qkj.224.1560800753484; 
 Mon, 17 Jun 2019 12:45:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 303/459] drm/amdgpu/gfx10: update to latest golden setting
Date: Mon, 17 Jun 2019 14:44:04 -0500
Message-Id: <20190617194540.18497-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0bMJ09zXJLYoTy1LZ3XAz8s/kpI1JXxzmoJVL6LjJhA=;
 b=t4PuPldzJaGF/4h5OdaBvZLZE3spvGRAtsVJJeifrpJt/z3lQGHv9DCIWBcY4PeZ7+
 MaUctdTLrjZKcJjBQcUy/fqZGAdoH6IUm+QcV7sJqdsfb6VHblxL3EL0OmzPiQZdkUnb
 KAQaYuO6L0sk1IO4EZEsUiBUl/PbERXXZjA5prkeiXHTsTL/OZqI5/ooscIqc+SD1sG0
 cfR/uEyehrvr3nHlZwYSqsoebrCRga0uww7vQjv2SFXwf4NJh7lo7rp47Ya5dCHxJiYu
 H8qvLaOYXsUauFFnQze014wWAOE6sv2UXaYzq/KhdJRJ03yt+XIzIUuRGh2w5m67hMFb
 0CZg==
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

Rml4IFVUQ0wxX0NHVFRfQ0xLX0NUUkwKClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggYWUzZDg2
OGRlMzA4Li43Nzk1OTdhNmYzM2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jCkBAIC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29s
ZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xW10gPQogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUo
R0MsIDAsIG1tU1FfTERTX0NMS19DVFJMLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmKSwKIAlTT0Mx
NV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRBX0NOVExfQVVYLCAweGZmZjdmZmZmLCAweDAx
MDMwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRDUF9DTlRMLCAweDYw
MDAwMDEwLCAweDQ3OWMwMDEwKSwKLQlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVVU
Q0wxX0NHVFRfQ0xLX0NUUkwsIDB4NDAwMDBmZjAsIDB4NDAwMDAxMDApLAorCVNPQzE1X1JFR19H
T0xERU5fVkFMVUUoR0MsIDAsIG1tVVRDTDFfQ0dUVF9DTEtfQ1RSTCwgMHhmZWZmMGZmZiwgMHg0
MDAwMDEwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1VVENMMV9DVFJMLCAw
eDAwODAwMDAwLCAweDAwODAwMDAwKQogfTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
