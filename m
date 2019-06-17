Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73F48DF3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984DB89428;
	Mon, 17 Jun 2019 19:17:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BE88941E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:55 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so12155312qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+7s0mGdvgYkrlQakSJM2qRhkzUBdbTAfZeXAb4NcGE=;
 b=Gmp+JRqbgkl+V8vwvHMbfeFv49J73tnF9JICPrL+hdpgvjh5bER/TTkt6gfNbxPgdQ
 z8AEnLVo8QJGBGglVH2zFjIEDQbz0WPjUa9uLv7D+3uQeMH60pQ2s0EaZaXURfoOQOmt
 Bnjf27uaWxf3QR1VAzWkR1JUnPOTdhFtHjJc9eyWfeARgcF3bXEbXJekUBWCVWLGsCXA
 cuxQsq1tqKU278esd7B+cIXQH2KrRaXFSc2LNSBUeFszD2r6ZpQ0lkVnAPi0NulCglEr
 58hOj9udrsaVv8XlBUlCVEO9y1Wcva2gU+RWZFdrGs/aErEN4qz7KnqnAW0GODfukpFu
 Yg4w==
X-Gm-Message-State: APjAAAWRtLUcVQ4LsqOPO9PHH69b7TbGxEdVxAgYcDm3voAQE1wGvWiG
 HtvW2IAGPMoC3+Lir3YaHhLAY4kpaFc=
X-Google-Smtp-Source: APXvYqwMi0GKSneY++AfDwWkMepT/fbihQWg/87bWm2dMJpa/yEFDldmxF+kQRHE4wpZAfXXDpPeqA==
X-Received: by 2002:ac8:7349:: with SMTP id q9mr92069233qtp.151.1560799074626; 
 Mon, 17 Jun 2019 12:17:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 053/459] drm/amdgpu: refine the PTE encoding of PRT for navi10
Date: Mon, 17 Jun 2019 14:10:14 -0500
Message-Id: <20190617191700.17899-42-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+7s0mGdvgYkrlQakSJM2qRhkzUBdbTAfZeXAb4NcGE=;
 b=rb9D0wp5SJtPxLPipt2lYeMDnNSznhJjRi9tJF0h/GBqt/HcOXGYcWCQ0le66Ot49a
 KpMFTlHxhIUOkl+S50KkBuG+I2vEOxweY4JtrUoT8OFL/nq5ygcBowi+jGr6PhRjVRhG
 Eo9j9+Mg9VNF1gbxzCXGhIhxU6bbCKcnFU0YOlglLzn6os99PfU55ryMQNYC2IkZ3env
 uuJUSx5+mIA9GXE/YsW3hSsjRiy5rWsg8X8uULhSU7hmf5xj7C5dmiPLSRSb8pUQkj//
 ScyHOiUxQ7V6s8JXukn3xd9yTHiKDgstZcD3AhAIHU5ix1cZfLEFEFn26IRaO9gfZmLq
 gxRg==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkR1ZSB0byBHQ1IgY2hhbmdlIGZy
b20gbmF2aTEwLCB0aGUgUFRFIGVuY29kaW5nIG9mIFBSVApuZWVkcyBjaGFuZ2UgVlNDVEwgPSAw
MTExMSAod2FzIDBYWDFYKS4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDUgKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHwgMiArKwogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
CmluZGV4IDE0Zjk2NDc2ZjNiOC4uMTk1MWYyYWJiZGJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYwpAQCAtMTU4NSw2ICsxNTg1LDExIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaWYgKCht
YXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfUFJUKSAmJgogCSAgICAoYWRldi0+YXNpY190eXBl
ID49IENISVBfVkVHQTEwKSkgewogCQlmbGFncyB8PSBBTURHUFVfUFRFX1BSVDsKKwkJaWYgKGFk
ZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkgeworCQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9T
Tk9PUEVEOworCQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9MT0c7CisJCQlmbGFncyB8PSBBTURHUFVf
UFRFX1NZU1RFTTsKKwkJfQogCQlmbGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsKIAl9CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKaW5kZXggNzc4ZWIxM2FiMWI4Li40ODlh
MTYyY2E2MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCkBAIC02Nyw2
ICs2Nyw4IEBAIHN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeTsKIC8qIFBERSBpcyBoYW5kbGVk
IGFzIFBURSBmb3IgVkVHQTEwICovCiAjZGVmaW5lIEFNREdQVV9QREVfUFRFCQkoMVVMTCA8PCA1
NCkKIAorI2RlZmluZSBBTURHUFVfUFRFX0xPRyAgICAgICAgICAoMVVMTCA8PCA1NSkKKwogLyog
UFRFIGlzIGhhbmRsZWQgYXMgUERFIGZvciBWRUdBMTAgKFRyYW5zbGF0ZSBGdXJ0aGVyKSAqLwog
I2RlZmluZSBBTURHUFVfUFRFX1RGCQkoMVVMTCA8PCA1NikKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
