Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBC48EE4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8EA89A7A;
	Mon, 17 Jun 2019 19:28:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046D899F3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:14 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so6962473qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dt1/mo35MEBP0233j3ucFDqtrg+WN8tVYQHZblEKziA=;
 b=PkLb4/iFHgo9qSoOnTbxY69Kw3v4RgLOVVkYAJ6zWXTEhH9GrjFGad9b7rNeBwd70P
 yckIvwFMlJa2zBf2WEX6aioT827c8UmDF19ONT/x7LhqVEidazcrbWvtFVscYfPpu7hO
 540JG3+pEzkdL2JK530JUhNXhuMFQTxZp1WOZef28q4qrnBPwhoBIx3/cxQ9XnfBy9hC
 glF9ZF2ahF4piuSODA/ZfMPIV1max3yeLeA8tBYrQb+I8h8UTDUZYCpo7ODfOvhB+0s4
 njzfWuu5/NS5l8rbtI4EpZlZV6dwdQfqQDWRxEmkNdxfaPWzY4XvDQ/4L/GarY08T6mX
 TE+A==
X-Gm-Message-State: APjAAAVRFGrBPDx3rcMlglQ9SJaiB9S0omdONXYrEkWht7MOkSemiyRN
 Djh4GA3gfAddOmEoMOvMnRoBi7ul1w4=
X-Google-Smtp-Source: APXvYqx4nNruRmfZDnF6zfnRsbCQutgrgg2s8ZcRmIVhGc2H5QXYH58VVpZ0m8+W8R3Qish1pYFWug==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr32469127qki.24.1560799693883; 
 Mon, 17 Jun 2019 12:28:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 166/459] drm/amd/powerplay: add allowed feature mask for navi10
Date: Mon, 17 Jun 2019 14:26:31 -0500
Message-Id: <20190617192704.18038-67-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dt1/mo35MEBP0233j3ucFDqtrg+WN8tVYQHZblEKziA=;
 b=qwlTBmuM8e8xnjnz1+HAvCz98BR3hhnLA83tgo3SXkrX19OS3Wzb6N1qWhjUb/8dSC
 X5DGPhMI7LmCbLasJS6OXatCI87VNY3zUnM70NnkxC0fRhGsAAIbe1j493Gnl1azCYdV
 avDTuG4oI8BW5ULhUsQLFx9GEolv+OXzyC/nE0AGD+kpnchqhfPsa9q7PJFD4a6Jhk+i
 EI6SSHvYRVUsrY5eJLJSuItTaAJRLWrJLzf5osP0Ls5wgvLvIxk+u7HV9iUhr+hYbwT1
 M6fmg4fLS3XK8/LjFpSmBSiUaEXzTCsYLykTfWExw2P3YZ0NkzqOpp0BFmfF6bIF1yjX
 NCwQ==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBzbXUgZmVhdHVyZSBt
YXNrOgoxLkZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklUCjIuRkVBVFVSRV9EUE1fUFJFRkVUQ0hF
Ul9CSVQKMy5GRUFUVVJFX0FUSFVCX1BHCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZp
bjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8
IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggNmMy
MDAwNzM0ZjFmLi5iOGQ5ZDFhNzNiMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKQEAgLTEyMiw3ICsxMjIsOSBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVh
dHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCiAJbWVtc2V0KGZlYXR1cmVfbWFz
aywgMCwgc2l6ZW9mKHVpbnQzMl90KSAqIG51bSk7CiAKLQkqKHVpbnQ2NF90ICopZmVhdHVyZV9t
YXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9TT0NDTEtfQklUKQorCSoodWludDY0X3Qg
KilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklU
KQorCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0dGWENMS19CSVQpCisJCQkJfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9EUE1fU09DQ0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFU
VVJFX0RQTV9NUDBDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktf
QklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1VMVl9CSVQpCkBAIC0xMzQsNyAr
MTM2LDggQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZBTl9DT05UUk9MX0JJVCkKIAkJ
CQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1RIRVJNQUxfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfTEVEX0RJU1BMQVlfQklUKQotCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1I
VUJfUEcpOworCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1IVUJfUEcpCisJCQkJfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9BVEhVQl9QRyk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
