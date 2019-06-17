Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6649038
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66796E02E;
	Mon, 17 Jun 2019 19:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D5D89FEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:30 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12278715qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXKvn1XAvTnuq3gBRQMTh915rsQPE5/FQs3vwMDDlRA=;
 b=VWTTYtMQqaBvrcWn5CN4hVNG1U8HabKw1pQ5fmw3/wbSiP217b5X44aBr9PBZQYy1u
 hs6v+yVN89RYRSMnp1cfJRnidHhiSsUggSKqTMYHqLisy151ZoN6n7wtcMBpq6ss9E1K
 X3VYIkT/YAyo0Nf9r4PdEZ01zgod3pyOO8sJaXwZ24OuTOcZ6u3b5vNQD5UQBzIM1xvx
 8d36fPCfpzlmayHCHbLzvV8ltvIzit3gweaLVuPQkjqI1mdO3KXwIIqJmiyY2CKrhcWZ
 s0oiGBFAQ8zlkQ5AjTTDCk+z3Khz8kSXXsFVUZb39phuWGVs6wUpR1GlrLY/xMbpPAVo
 Ojqw==
X-Gm-Message-State: APjAAAXpc92UtoQ95qJ+yujSqSvJdl9Z49XN7UW/DiXgYcYUaggVqwPI
 H0ULkrYOqydlSJ33N1io+K2qIHkpzc+crw==
X-Google-Smtp-Source: APXvYqyBn6EPGQKPKScyrJ+vqjpizXXzsuuC/ASsn3/PpUXOFUUDx5yOWV1xJXYJGNpYp6kPU8DQzw==
X-Received: by 2002:a0c:b902:: with SMTP id u2mr23078506qvf.151.1560800849254; 
 Mon, 17 Jun 2019 12:47:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 392/459] drm/amd/display: Add vupdate interrupt sources to NV10
Date: Mon, 17 Jun 2019 14:45:33 -0500
Message-Id: <20190617194540.18497-93-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXKvn1XAvTnuq3gBRQMTh915rsQPE5/FQs3vwMDDlRA=;
 b=k5f7Vpqv21ZcMWB0z+yNQgkZe4af3vp5d6Qk0GRDaDMTemgedDffVwm07kapJEF+Zz
 YpbX1w8D7J3YetW+EcKp1hsFHUjiBnB/s2dpCMX0NeBBSt5oTbxlPTvPsEx7OM+Gdezc
 m3+q9sTL/cogrKvON+3qcx7YVTyE2IgHfkp/SBFbHuofT0v8uVPtmxhFqnvvlgKLZEep
 esrFpP819VRx/BsptEaODqLwff5FC9sKYuV/mvsjZ+299tw4NLPHmgpObhQqNdtnign8
 tlO24MEB9JfOWAk/f69o5MJcL6DDuBCUs/uboXOb7cGtz2dcB21u5GYufbwHupSHPf2G
 5T1Q==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW1dIWV0gbGludXggdXBzdHJl
YW0gYWxyZWFkeSBoYXMgaW50ZXJydXB0IHZ1cGRhdGUgZm9yIGZyZWVzeW5jCmluIGRjbjEwLiBk
Y24yMCBpbnRlcnJ1cHQgc2hhcmVzIHRoZSBzYW1lIHNvdXJjZSBjb2RlIGFzIGRjbjEwLgpidXQg
ZGNuMjAgaW50ZXJydXB0IHRyYW5zbGF0b3IgZG9lcyBub3QgYWRkIHZ1cGRhdGUgaW50ZXJydXB0
Lgp0aGlzIGNhdXNlIGluZGV4IG9mIHZ1cGRhdGUgYWFycmF5IGJlIG5lZ2F0aXZlIHdoaWNoIGNh
dXNlcwpjcmFzaC4KCltIT1ddIGFkZCB2dXBkYXRlIGludG8gZGMgaW50ZXJydXB0IHRyYW5zbHRv
cgoKU2lnbmVkLW9mZi1ieTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2lycS9kY24yMC9pcnFfc2VydmljZV9kY24yMC5jIHwgMTIgKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMjAvaXJxX3NlcnZpY2VfZGNuMjAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMjAvaXJxX3NlcnZpY2VfZGNuMjAuYwppbmRl
eCBkYTcwY2M3YjI0YjUuLjY1ODY2ZDYyMDc1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2lycS9kY24yMC9pcnFfc2VydmljZV9kY24yMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pcnEvZGNuMjAvaXJxX3NlcnZpY2VfZGNuMjAuYwpA
QCAtNjgsNiArNjgsMTggQEAgZW51bSBkY19pcnFfc291cmNlIHRvX2RhbF9pcnFfc291cmNlX2Rj
bjIwKAogCQlyZXR1cm4gRENfSVJRX1NPVVJDRV9QRkxJUDU7CiAJY2FzZSBEQ05fMV8wX19TUkNJ
RF9fSFVCUDVfRkxJUF9JTlRFUlJVUFQ6CiAJCXJldHVybiBEQ19JUlFfU09VUkNFX1BGTElQNjsK
KwljYXNlIERDTl8xXzBfX1NSQ0lEX19PVEcwX0lIQ19WX1VQREFURV9OT19MT0NLX0lOVEVSUlVQ
VDoKKwkJcmV0dXJuIERDX0lSUV9TT1VSQ0VfVlVQREFURTE7CisJY2FzZSBEQ05fMV8wX19TUkNJ
RF9fT1RHMV9JSENfVl9VUERBVEVfTk9fTE9DS19JTlRFUlJVUFQ6CisJCXJldHVybiBEQ19JUlFf
U09VUkNFX1ZVUERBVEUyOworCWNhc2UgRENOXzFfMF9fU1JDSURfX09URzJfSUhDX1ZfVVBEQVRF
X05PX0xPQ0tfSU5URVJSVVBUOgorCQlyZXR1cm4gRENfSVJRX1NPVVJDRV9WVVBEQVRFMzsKKwlj
YXNlIERDTl8xXzBfX1NSQ0lEX19PVEczX0lIQ19WX1VQREFURV9OT19MT0NLX0lOVEVSUlVQVDoK
KwkJcmV0dXJuIERDX0lSUV9TT1VSQ0VfVlVQREFURTQ7CisJY2FzZSBEQ05fMV8wX19TUkNJRF9f
T1RHNF9JSENfVl9VUERBVEVfTk9fTE9DS19JTlRFUlJVUFQ6CisJCXJldHVybiBEQ19JUlFfU09V
UkNFX1ZVUERBVEU1OworCWNhc2UgRENOXzFfMF9fU1JDSURfX09URzVfSUhDX1ZfVVBEQVRFX05P
X0xPQ0tfSU5URVJSVVBUOgorCQlyZXR1cm4gRENfSVJRX1NPVVJDRV9WVVBEQVRFNjsKIAogCWNh
c2UgRENOXzFfMF9fU1JDSURfX0RDX0hQRDFfSU5UOgogCQkvKiBnZW5lcmljIHNyY19pZCBmb3Ig
YWxsIEhQRCBhbmQgSFBEUlggaW50ZXJydXB0cyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
