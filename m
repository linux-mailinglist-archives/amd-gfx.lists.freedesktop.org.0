Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C651B2C62C6
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366796EC03;
	Fri, 27 Nov 2020 10:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226BA6E954
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so2199517wrn.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ldsB1ybseYMp8ZBJ12vzzY4XQciSVJ5HSbnDxd3OzfI=;
 b=nReHHg4y2GwBg+ELtmf6FKwwwAdv6FVyF8TSlch4nRCGTQIlzqgbmoe8jOy65PUNtC
 QZA85Hl+za8IH3wCN1maDRJBzWHgekSGAWVe1ujb9l0mJ381TiuS7MAOxETiefpPaXal
 9KUA/uc82NsiO5ek53XTMgL87wJZNqP4j9zolH/e0trnLg8vMZAdBBQ60k5vrk2DVMTi
 pIHLlgDKi+Tirc5Ix9rsVwi/D+KCuXckmZQ8l9Lmqw8WRADwOMXChgsKEm8RyaVVTuzl
 /LpSYMLRqRuuddUIUGJ1zrrqYv5ymqV1+9f3PEdlgwfMFp0IvAjV7Vw32h1noxdmD2v/
 rVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldsB1ybseYMp8ZBJ12vzzY4XQciSVJ5HSbnDxd3OzfI=;
 b=tatMIU2nqVVXo9wH0C4rPWf7m/PQrxe64f4w8Uc7QI2MEpDg4v37jrXfNsyxPVI2BX
 JxyKtsnwTaHqceOK3Ov2Yie0cSvWbGe/j9sxl74n/dxPyNthgbRl8QlualWVBAJpxB14
 t2Kxmqv1zD9q4chIIJ5KOE9vw9MzWzVRi7f+v03LGVghY0LQ2dKwSv1GVYGjqx0O8f3i
 90sNTqHboEhKjEVK1nuolXtcza7wc90nPowiQ57w6MGiIFX9Nm1qbHGV+cjOf2gCAXeZ
 a0vLBTg23H0zZ7WleIiS1UX5c8BiQz+k2vkrruI9O4dKAuDyod3UKBwvJOJcsTJsfKz1
 qCjQ==
X-Gm-Message-State: AOAM531fde0QmL5nVc07Gu48o+TIWEPaW+FujClTEcv1WWekXFHp3cyd
 emsV7z9WjinDBEbbbhnc20BfEttCW+90CPoC
X-Google-Smtp-Source: ABdhPJzJRjrTBh1mNZ3EweuonfhsRNL0SPGQIQZVyDeSp+pKVMCn3IhQ4KBalcGJsP6s5OHfo901MQ==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr4114461wrq.308.1606398171231; 
 Thu, 26 Nov 2020 05:42:51 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/pm/powerplay/smumgr/vegam_smumgr: Make function
 called by reference static
Date: Thu, 26 Nov 2020 13:42:05 +0000
Message-Id: <20201126134240.3214176-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:14:32 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3Iu
YzoyMjQ5OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYdmVnYW1fdGhl
cm1hbF9hdmZzX2VuYWJsZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogRXZhbiBRdWFu
IDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMKaW5kZXggMzhhNWNkY2Y1ODk2Ny4uN2Qw
MjRkM2ZhY2VmMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
c211bWdyL3ZlZ2FtX3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwpAQCAtMjI0Niw3ICsyMjQ2LDcgQEAgc3RhdGljIGlu
dCB2ZWdhbV91cGRhdGVfc2Nsa190aHJlc2hvbGQoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAly
ZXR1cm4gcmVzdWx0OwogfQogCi1pbnQgdmVnYW1fdGhlcm1hbF9hdmZzX2VuYWJsZShzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKQorc3RhdGljIGludCB2ZWdhbV90aGVybWFsX2F2ZnNfZW5hYmxlKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpCiB7CiAJc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGEgPSAoc3Ry
dWN0IHNtdTdfaHdtZ3IgKikoaHdtZ3ItPmJhY2tlbmQpOwogCWludCByZXQ7Ci0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
