Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D748F60
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4342689C54;
	Mon, 17 Jun 2019 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148889C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:54 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so6935566qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vT7gWRZnGfdg3v2Mcl7Qq/ZrHg7cXygxU+A7Du+8cRU=;
 b=bJwZa4d1JN5OPIh0gmDmEx1RRX0xn7zEe+YVkqHVXovXhTX1GdIcPk+Rnv7v5jBVa5
 BOCP9iyW5L278rYJG627o58B2lOKTXKqPLjkOpQrI7gZ/6z6l1ERFbowzfzvjMtCOBYG
 2Kr+kKMw1XPfy51T/CaVeu9tUCEMyhpUeWwMyx4CZ3GLdTCvFuoDJQK4fXyHTmPpMrO8
 WN7nu0yGcSXuv2Cde1NRhipJ4B86UCjcm1ssy+WpawriOb/SBhhL/DGJcVt6F21ilYcn
 Led2y7pDR66pdfrdnPoDH9aua+I5WsMn8PmoE6uD9zFJ/wdgXbuafY8XQ5LB7fPeIJ2u
 4gKg==
X-Gm-Message-State: APjAAAV42j/VWQewkIdb2ZrL9FMl/FkGyOVMSWOG1W3qpONsHJnhinQf
 pPC+CGQm8L9blU7iksd4m5vXC+NUEoQ=
X-Google-Smtp-Source: APXvYqxzjoJbzmtOsMmoQ3qeoj7QkqXXNJpsgyf9ScUhb9uPGPOoPhN77SXVLc4Z46GNe9bsNA0J+g==
X-Received: by 2002:ae9:de83:: with SMTP id
 s125mr32778054qkf.115.1560799913131; 
 Mon, 17 Jun 2019 12:31:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 243/459] drm/amd/powerplay: add function is_dpm_running for
 navi10
Date: Mon, 17 Jun 2019 14:30:10 -0500
Message-Id: <20190617193106.18231-44-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vT7gWRZnGfdg3v2Mcl7Qq/ZrHg7cXygxU+A7Du+8cRU=;
 b=AbswyG9z3mAidxZ7yJ6FtHaeR51Yo6zywZnyMqGzOSRSlECdV5BvvIMQud6KaWWT9x
 9t+59H6qgZessDfZa5lXJAgzp0fpmHuWExNtkX4FtzcMazQ1OqTejNK4fdfytLG6e5eP
 GFn53Xw+46/lWAwNuab8HAylQhqOktPI4kD0EWh1YtZj6Kmv8eaQ2ZfZsn48ZKy1xh6B
 ZJCjYWhtqoQ66YtWyVBOvaakGkaFZQEDSkd9jekU6KXiuMWShGAvs5ovdmkkY4QEdE8k
 zGrLOaSDD6vWgpBYr8vDrHaYjoXSnuOQChrZLvdNScoYw87JydlJcLj2XyOYnwlBdY39
 kcSA==
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
dGlvbiBpc19kcG1fcnVubmluZyBmb3IgbmF2aTEwIGFzaWMKClNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKaW5kZXggNzExZGEwNGMzMGE4Li5mOThmMWM2YTk0MjkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTM1LDYgKzM1LDE3IEBACiAj
aW5jbHVkZSAic211X3YxMV8wX3BwdGFibGUuaCIKICNpbmNsdWRlICJzbXVfdjExXzBfcHBzbWMu
aCIKIAorI2RlZmluZSBGRUFUVVJFX01BU0soZmVhdHVyZSkgKDFVTCA8PCBmZWF0dXJlKQorI2Rl
ZmluZSBTTUNfRFBNX0ZFQVRVUkUgKCBcCisJRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZF
VENIRVJfQklUKSB8IFwKKwlGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVCkJIHwg
XAorCUZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9HRlhfUEFDRV9CSVQpCSB8IFwKKwlGRUFUVVJF
X01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpCSB8IFwKKwlGRUFUVVJFX01BU0soRkVBVFVSRV9E
UE1fU09DQ0xLX0JJVCkJIHwgXAorCUZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9NUDBDTEtfQklU
KQkgfCBcCisJRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktfQklUKQkgfCBcCisJRkVBVFVS
RV9NQVNLKEZFQVRVUkVfRFBNX0RDRUZDTEtfQklUKSkKKwogI2RlZmluZSBNU0dfTUFQKG1zZywg
aW5kZXgpIFwKIAlbU01VX01TR18jI21zZ10gPSBpbmRleAogCkBAIC0yNDgsNyArMjU5LDYgQEAg
c3RhdGljIGludCBuYXZpMTBfZ2V0X3B3cl9zcmNfaW5kZXgoc3RydWN0IHNtdV9jb250ZXh0ICpz
bWMsIHVpbnQzMl90IGluZGV4KQogCXJldHVybiB2YWw7CiB9CiAKLSNkZWZpbmUgRkVBVFVSRV9N
QVNLKGZlYXR1cmUpICgxVUwgPDwgZmVhdHVyZSkKIHN0YXRpYyBpbnQKIG5hdmkxMF9nZXRfYWxs
b3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJICB1aW50MzJf
dCAqZmVhdHVyZV9tYXNrLCB1aW50MzJfdCBudW0pCkBAIC03ODYsNiArNzk2LDE3IEBAIHN0YXRp
YyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBib29sIG5hdmkxMF9pc19kcG1fcnVu
bmluZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKK3sKKwlpbnQgcmV0ID0gMDsKKwl1aW50MzJf
dCBmZWF0dXJlX21hc2tbMl07CisJdW5zaWduZWQgbG9uZyBmZWF0dXJlX2VuYWJsZWQ7CisJcmV0
ID0gc211X2ZlYXR1cmVfZ2V0X2VuYWJsZWRfbWFzayhzbXUsIGZlYXR1cmVfbWFzaywgMik7CisJ
ZmVhdHVyZV9lbmFibGVkID0gKHVuc2lnbmVkIGxvbmcpKCh1aW50NjRfdClmZWF0dXJlX21hc2tb
MF0gfAorCQkJICAgKCh1aW50NjRfdClmZWF0dXJlX21hc2tbMV0gPDwgMzIpKTsKKwlyZXR1cm4g
ISEoZmVhdHVyZV9lbmFibGVkICYgU01DX0RQTV9GRUFUVVJFKTsKK30KKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxlc19pbml0
ID0gbmF2aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9hbGxv
Y2F0ZV9kcG1fY29udGV4dCwKQEAgLTgxMSw2ICs4MzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkudW5mb3JjZV9kcG1fbGV2ZWxz
ID0gbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscywKIAkuZ2V0X2dwdV9wb3dlciA9IG5hdmkxMF9n
ZXRfZ3B1X3Bvd2VyLAogCS5nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50ID0gbmF2aTEwX2dl
dF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQsCisJLmlzX2RwbV9ydW5uaW5nID0gbmF2aTEwX2lz
X2RwbV9ydW5uaW5nLAogfTsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
