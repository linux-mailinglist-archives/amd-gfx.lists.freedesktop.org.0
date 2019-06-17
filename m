Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312BA48F56
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1112789C13;
	Mon, 17 Jun 2019 19:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D2D89C13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:42 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id n11so12230004qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hNhr5QZD5YBC4PEXgU8Crl8S236274Hry0/ugat/IuE=;
 b=KUTEYruD7SZ97fQAeGIwlpiZoSbMgR7FSD1IfAdl7ukWbUgrEPdtvkHnY51JTs9iSE
 3zYEX2iiucdwySRUmrKRsXlSTj3x/bOEkJWAKkQv/56lGFhiD5SUJIANTIbt+h+A3Xu7
 bUHgR1cwVEfq98eAwk6dY0ggMgxaf2occT/FeqBEdDE0n7h3POpTUzO3pWtGNlYTFcp7
 RiBeFTb5zNoJAH7cFJ32Wm7OTT6TgVrKAwIDrdDgizqBFzGGyb+yr+mt/O/QunwQXroc
 vYndirHWQL9ka8JUmtIdgTeDUMKZOD3uifbUmgfITRUFeMpXMErmCylUV+YdqhsX/X+W
 WBhw==
X-Gm-Message-State: APjAAAU0E9+//Iy1XMxCQCPM8d8TkdVXx0i5tJsQhN1az6c2+jefkFlk
 lc4HcxrBztjJkvCLWvZhs5asPrZ4hU4=
X-Google-Smtp-Source: APXvYqwyzuEH5BKNXmBW50S+yDQY5OcgP+Tn5ByrR5ZleM/H8ZoIM9+ynB9wdP/LMEgcTGoJGak6Sw==
X-Received: by 2002:a0c:984b:: with SMTP id e11mr23341312qvd.174.1560799901702; 
 Mon, 17 Jun 2019 12:31:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 232/459] drm/amd/powerplay: add helper function of
 smu_set_hard_freq_range
Date: Mon, 17 Jun 2019 14:29:59 -0500
Message-Id: <20190617193106.18231-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hNhr5QZD5YBC4PEXgU8Crl8S236274Hry0/ugat/IuE=;
 b=egLpl3BNP34ucPtk4BGCG43t2rsQa4d3gPQpvzN6TWmvVRNx008zTdL6/34IsCsKLX
 lo44dn8HwJd4RciaCJCJECICMhtpc/hkBT1mTLaHOb80Ng1N2crWz/a3s2REo01BoI6c
 QugTHMyqz2YQft8OGfRf++l9FIlwRGB8mgHxh27WmBoOT8M8Ed++xwOnIQctMX0Ot+fJ
 eUvTbBkBZbw/dKlg9FRJk65d6NEt/qNsBtFB+7woM5rJMT+zHxM1zDPtqvDA2z2JZphM
 GU3X6BwrCdvcIAlkW1WIziInFeSNU699+BchuX2lCCETkLjwQPrY6YQkmRcaumrpbcYH
 xZEA==
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

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCB0aGlzIGZ1bmN0aW9u
IHRvIGdldCBkcG0gY2xvY2sgaW5mb3JtYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5n
IDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAg
ICB8IDMzICsrKysrKysrKysrKysrKysrKysKIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaCAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNTQw
NGYzMmNjMmM1Li40ODJmZGFkMWQ1ZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKQEAgLTkzLDYgKzkzLDM5IEBAIGludCBzbXVfc2V0X3NvZnRfZnJlcV9y
YW5nZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUs
CiAJcmV0dXJuIHJldDsKIH0KIAoraW50IHNtdV9zZXRfaGFyZF9mcmVxX3JhbmdlKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKKwkJCSAgICB1aW50
MzJfdCBtaW4sIHVpbnQzMl90IG1heCkKK3sKKwlpbnQgcmV0ID0gMCwgY2xrX2lkID0gMDsKKwl1
aW50MzJfdCBwYXJhbTsKKworCWlmIChtaW4gPD0gMCAmJiBtYXggPD0gMCkKKwkJcmV0dXJuIC1F
SU5WQUw7CisKKwljbGtfaWQgPSBzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsa190eXBlKTsKKwlp
ZiAoY2xrX2lkIDwgMCkKKwkJcmV0dXJuIGNsa19pZDsKKworCWlmIChtYXggPiAwKSB7CisJCXBh
cmFtID0gKHVpbnQzMl90KSgoY2xrX2lkIDw8IDE2KSB8IChtYXggJiAweGZmZmYpKTsKKwkJcmV0
ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19TZXRIYXJkTWF4QnlG
cmVxLAorCQkJCQkJICBwYXJhbSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCX0KKwor
CWlmIChtaW4gPiAwKSB7CisJCXBhcmFtID0gKHVpbnQzMl90KSgoY2xrX2lkIDw8IDE2KSB8ICht
aW4gJiAweGZmZmYpKTsKKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwg
U01VX01TR19TZXRIYXJkTWluQnlGcmVxLAorCQkJCQkJICBwYXJhbSk7CisJCWlmIChyZXQpCisJ
CQlyZXR1cm4gcmV0OworCX0KKworCisJcmV0dXJuIHJldDsKK30KKwogaW50IHNtdV9nZXRfZHBt
X2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNs
a190eXBlLAogCQkJICAgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCkKIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCmluZGV4IDQxNmVhN2I4
NTc2MS4uNTI4OTQ1M2Y5NDIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9pbmMvYW1kZ3B1X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKQEAgLTk0Myw0ICs5NDMsNiBAQCBpbnQgc211X2dldF9kcG1fZnJl
cV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5
cGUsCiAJCQkgICB1aW50MzJfdCAqbWluLCB1aW50MzJfdCAqbWF4KTsKIGludCBzbXVfc2V0X3Nv
ZnRfZnJlcV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUg
Y2xrX3R5cGUsCiAJCQkgICAgdWludDMyX3QgbWluLCB1aW50MzJfdCBtYXgpOworaW50IHNtdV9z
ZXRfaGFyZF9mcmVxX3JhbmdlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtf
dHlwZSBjbGtfdHlwZSwKKwkJCSAgICB1aW50MzJfdCBtaW4sIHVpbnQzMl90IG1heCk7CiAjZW5k
aWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
