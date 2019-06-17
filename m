Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C348F63
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319A89C59;
	Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FAC89C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:55 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t8so6975183qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMZcFCaqOEBqgSciZWLXaEdZ09NIY4d4pXSctcV12bQ=;
 b=TVq3GVtTCYF+oVSMpJNbUyogovKXwQAzXiz9Y9YyH1O9fkVw2dW5V4YsHXBWnEdzDq
 jJrpqB05Kh7NC0Bprut4b29qRk0zJJOuri+SNwSXNARQqrnQpSY4JDReyfIjZTcqfmt8
 I3CYWCZs5kZa+cyqojryUO7X4DbF4APmOat3d5aTu5Zk4eVFxU0L7Kzvfrkf40L0fRV9
 UT2WPRCs2N8SeSHHF3GaDIVO4dBjkYPK3e7aRCHGUxc/4rjgHy3vq2bY5X5S0p0yvC+x
 zMkDadumipqSFo+wp657nUfXCN23pjyIaQ8lAax+HLrpoh2ifS6lZEKQeYUfzSikCa32
 PMgw==
X-Gm-Message-State: APjAAAXLInxvsu2zW2yC2psev/faVZlm6sc180rV3EOr/7QNWBVZXHtV
 vzy8ewhupsy1Tg3tqqjxoofWuEkL7u0=
X-Google-Smtp-Source: APXvYqxocI1FK0byw5lOTJux1ONCgKQGx5UId83k2/R2SPQVG3NHLuxu2jFlbY0Km8XTfhhoj3Cw1g==
X-Received: by 2002:a37:4887:: with SMTP id v129mr10329455qka.17.1560799914960; 
 Mon, 17 Jun 2019 12:31:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 245/459] drm/amd/powerplay: add function get_fan_speed_percent
 for navi10
Date: Mon, 17 Jun 2019 14:30:12 -0500
Message-Id: <20190617193106.18231-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMZcFCaqOEBqgSciZWLXaEdZ09NIY4d4pXSctcV12bQ=;
 b=W79Z4dy9Zp0tqmb+6V7T5QcyACF8yDVdlk931Lmi7KGdrRhvd9FM3vxwfzf6xdEUb1
 5JCB08qw8yc1w4d3Dm/p04dcsVyON20Y+EC9OlbUPFFfz19who84QcftN5benYpw8MvC
 AOUVY1xRdg6jsNV/acmKtZH82ppZgQHReb7mAWVTnz6vXtYDrtPXWWqAWvvEG/ocaqcO
 u+WC9K6dnZgpK+Lgx5dO+tCVh9oGFhYV0QNVFCd3NK2UCYC0kOo8C8Wtj0+jMU0WCYAS
 /nkv3YCBNnR8eDOBAe4oQK9/U/ItuPh/l+Wkz3Ngxry2fWQ/O4Vvm1MenQUEn/NMIUeA
 0CPw==
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

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBnZXRfZmFuX3NwZWVkX3BlcmNlbnQgZm9yIG5hdmkxMCBhc2ljCgpTaWduZWQtb2ZmLWJ5
OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CmluZGV4IGZkNzk2MzIyZmUzNS4uMTIxOWE2OGU1NmYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC04MTksNiArODE5LDI0IEBAIHN0YXRpYyBpbnQg
bmF2aTEwX3NldF90aGVybWFsX2Zhbl90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAly
ZXR1cm4gcmV0OwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9nZXRfZmFuX3NwZWVkX3BlcmNlbnQo
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJCQkJCXVpbnQzMl90ICpzcGVlZCkKK3sKKwlpbnQg
cmV0ID0gMDsKKwl1aW50MzJfdCBwZXJjZW50ID0gMDsKKwl1aW50MzJfdCBjdXJyZW50X3JwbTsK
KwlQUFRhYmxlX3QgKnBwdGFibGUgPSBzbXUtPnNtdV90YWJsZS5kcml2ZXJfcHB0YWJsZTsKKwor
CXJldCA9IHNtdV9nZXRfY3VycmVudF9ycG0oc211LCAmY3VycmVudF9ycG0pOworCWlmIChyZXQp
CisJCXJldHVybiByZXQ7CisKKwlwZXJjZW50ID0gY3VycmVudF9ycG0gKiAxMDAgLyBwcHRhYmxl
LT5GYW5NYXhpbXVtUnBtOworCSpzcGVlZCA9IHBlcmNlbnQgPiAxMDAgPyAxMDAgOiBwZXJjZW50
OworCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxlc19pbml0ID0gbmF2aTEwX3RhYmxlc19pbml0
LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9hbGxvY2F0ZV9kcG1fY29udGV4dCwKQEAg
LTg0Niw2ICs4NjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEw
X3BwdF9mdW5jcyA9IHsKIAkuZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudCA9IG5hdmkxMF9n
ZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50LAogCS5pc19kcG1fcnVubmluZyA9IG5hdmkxMF9p
c19kcG1fcnVubmluZywKIAkuc2V0X3RoZXJtYWxfZmFuX3RhYmxlID0gbmF2aTEwX3NldF90aGVy
bWFsX2Zhbl90YWJsZSwKKwkuZ2V0X2Zhbl9zcGVlZF9wZXJjZW50ID0gbmF2aTEwX2dldF9mYW5f
c3BlZWRfcGVyY2VudCwKIH07CiAKIHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
