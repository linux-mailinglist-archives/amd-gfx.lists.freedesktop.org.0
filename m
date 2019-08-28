Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB3A0AD1
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0A489E86;
	Wed, 28 Aug 2019 19:56:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF43E89E5F
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s14so895493qkm.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPG2JE/jfcxv9gQdB6M6VEH0qyc8V8fMgY0V6/t29IQ=;
 b=rwC02Z1Kgfe0ATqIgPSRae+hWAhEYLTkKW/ULXFcRGOpLv8TQgolFD5gy9BSDsKA0J
 iwoYrWHZOuy7riyUNW7KWJAfMCpawmu5jpps18sN+HWVPY3hUOXm5OIJSljMcvhzAJMW
 +n5tjT6zYSh+H0VSkxDUewQyPpsMpDvWh9Ht9AiLHIfj1Yaamxco22jy2QDLA1HsNw5b
 E/oPSKiLNnv/oulwC2O8kX0g/cjDh5JRpOw0LABSL0f25NSRO6qUNYsCEvGWMaOI5j46
 buv6+vITzoX8nJWzoLw04Xfu4Inqr19GlymsUvybDiHXCqc75ym3VnG07Ivjujp/i43d
 s0kg==
X-Gm-Message-State: APjAAAWZ4OFKsdvdIlBWoG1UxqTEwqq+Pw6T+MGbtQQfdgZ5HENl3gJr
 2ULGWvQX2g4Kg9IpNtG1N5pJeopa
X-Google-Smtp-Source: APXvYqx9UnAPaGvHIG1xCdxypFmormimO7ue/XKQzEAC+xCemxIG0sB7qBE6/5BeoCCl6iW+YCM9pQ==
X-Received: by 2002:a37:624b:: with SMTP id w72mr6123026qkb.368.1567022192762; 
 Wed, 28 Aug 2019 12:56:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/23] drm/amd/display: Add Renoir clock registers list
Date: Wed, 28 Aug 2019 14:56:01 -0500
Message-Id: <20190828195622.28941-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPG2JE/jfcxv9gQdB6M6VEH0qyc8V8fMgY0V6/t29IQ=;
 b=MKSkByIDDY+qHZE3vZF13xnhkdYKDtaxdMrapZ8ia0tObCZoxfTKSzUhxiLQueZ+MR
 a0OgI0fqZV+E+eoWVO1gbF548fHBs0jrnz7yEWgdRgQoe2uiQkXwoBAqKleQKna3s123
 38K5Va4cz19H8WyLU7nZuH8n74JZsGCE2dPYf7bCYi+emx1wDygDNjIyWfEJTd/M3ydl
 A3cG7Wu86k4g9GJ8eRR9VnihJLwkejd1OsDHAwPGwl8GZifWCDpgfTWmta5Fj984/P34
 3ztB7VXtkwVd2a/HXHbxJwTwJY6kCYAmkfRtDBfugYT8e74seIo6re/jekGlYTGgmmbm
 lrIQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpTaWdu
ZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuaCAgIHwgMTcg
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291
cmNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3Vy
Y2UuaAppbmRleCBhZGFlMDNiMWYzYTcuLjQzYzFiZjYwYjgzYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmgKQEAgLTc4
LDYgKzc4LDIzIEBACiAJCVNSSUkoUElYRUxfUkFURV9DTlRMLCBPVEcsIDUpCiAjZW5kaWYKIAor
I2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8xKQorI2RlZmluZSBDU19DT01NT05f
UkVHX0xJU1RfRENOMl8xKGluZGV4LCBwbGxpZCkgXAorCQlTUkkoUElYQ0xLX1JFU1lOQ19DTlRM
LCBQSFlQTEwsIHBsbGlkKSxcCisJCVNSSUkoUEhBU0UsIERQX0RUTywgMCksXAorCQlTUklJKFBI
QVNFLCBEUF9EVE8sIDEpLFwKKwkJU1JJSShQSEFTRSwgRFBfRFRPLCAyKSxcCisJCVNSSUkoUEhB
U0UsIERQX0RUTywgMyksXAorCQlTUklJKE1PRFVMTywgRFBfRFRPLCAwKSxcCisJCVNSSUkoTU9E
VUxPLCBEUF9EVE8sIDEpLFwKKwkJU1JJSShNT0RVTE8sIERQX0RUTywgMiksXAorCQlTUklJKE1P
RFVMTywgRFBfRFRPLCAzKSxcCisJCVNSSUkoUElYRUxfUkFURV9DTlRMLCBPVEcsIDApLFwKKwkJ
U1JJSShQSVhFTF9SQVRFX0NOVEwsIE9URywgMSksXAorCQlTUklJKFBJWEVMX1JBVEVfQ05UTCwg
T1RHLCAyKSxcCisJCVNSSUkoUElYRUxfUkFURV9DTlRMLCBPVEcsIDMpCisjZW5kaWYKKwogI2lm
IGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8wKQogI2RlZmluZSBDU19DT01NT05fTUFT
S19TSF9MSVNUX0RDTjJfMChtYXNrX3NoKVwKIAlDU19TRihEUF9EVE8wX1BIQVNFLCBEUF9EVE8w
X1BIQVNFLCBtYXNrX3NoKSxcCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
