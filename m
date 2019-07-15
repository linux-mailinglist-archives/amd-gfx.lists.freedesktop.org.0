Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF769E12
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C19489E38;
	Mon, 15 Jul 2019 21:25:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3283C89E36
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so12870601qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7Ogs4vqUgU85lvoykCwdHz2tSA9PJr4oEQUl1/FFS4=;
 b=moFpRPOgGFLl6NLnC99UhBvU0NvefYUL81cMyXUs58SYNEtwD5TeVLAbKWEYAWcUVB
 kXffTFSopuBElACC/BKyy6FLmQfp+Gk0kV/pz/s8fXfdVTBUh9QJtjdlLhswlBJtjyA7
 Hqpsk7Zia34atIXcLaxVxJBtlJ55EkG48HJ5Fa+oWpSisFODbcgLRBV4+yF5OP7lNXrG
 19B1FmQS70T/BdDff6lmWzYKA1nishntjcwlj4K8FL8dJcFuhlWCTLo3q3S+PeyN/z9R
 azrxSSnJEpSjml6EJab5r25fCBm/iBY7saxcnLUso6RlD0ggxLTFcasrNnt/tkYhscuQ
 dSFg==
X-Gm-Message-State: APjAAAXXhixr4WyVJftVOp3/0KTovOvnYbTysKOqYxS+IBgXwABrlu/O
 R70tFrZ91sAcDYjPYrTEz8HjeT3l
X-Google-Smtp-Source: APXvYqz5GSKRwJDRjS0iZkheaM9Bon3vsQVAvswqHqB/1gxVvp7aEATcRGEGGwaDgCfsLDeOzKcaIg==
X-Received: by 2002:a37:a5cb:: with SMTP id
 o194mr19009269qke.371.1563225912134; 
 Mon, 15 Jul 2019 14:25:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 031/102] drm/amdgpu: add Arcturus gpu info firmware
Date: Mon, 15 Jul 2019 16:23:26 -0500
Message-Id: <20190715212437.31793-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7Ogs4vqUgU85lvoykCwdHz2tSA9PJr4oEQUl1/FFS4=;
 b=WSOQafQ/i6zbsMzFUShmlo7GTYW6qMHtAe6EbKHTTAh6XeOgnmhtjL6vAyh9VHHs0V
 OtDX5F6FOx6zeGu86h7ASw6V8eI489KmIW30vbVuEZwHlKtp3wzAhsNK9HI6Vz5qmpAC
 6XDwRv5of+2UvWwQGEp8DJQN9sn1ShkrgF+hk6NOMCCMao268HYU6cXqdDfORG6V3P9h
 hCVFpbJYuUxdTPaG1Ecw6MboDSd59UprzffOxvyBlx1UwbIRQ2x/HRXSjFInw3GbDDYn
 jC4utbxYdda616t8UipCgiJbV37nqjOuZt8j/RH/Pwu2UzSmjLrqsazixsJaUjQz2435
 pb2w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAwMTdiYmQ1NDFmMDAuLjQ0MjVmZjA2ZWNjNCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtNjksNiAr
NjksNyBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMTJfZ3B1X2luZm8uYmluIik7CiBN
T0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbl9ncHVfaW5mby5iaW4iKTsKIE1PRFVMRV9GSVJN
V0FSRSgiYW1kZ3B1L3BpY2Fzc29fZ3B1X2luZm8uYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFt
ZGdwdS9yYXZlbjJfZ3B1X2luZm8uYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9hcmN0
dXJ1c19ncHVfaW5mby5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9ncHVf
aW5mby5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9ncHVfaW5mby5iaW4i
KTsKIApAQCAtMTM4Niw2ICsxMzg3LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX3BhcnNl
X2dwdV9pbmZvX2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQllbHNlCiAJCQljaGlw
X25hbWUgPSAicmF2ZW4iOwogCQlicmVhazsKKwljYXNlIENISVBfQVJDVFVSVVM6CisJCWNoaXBf
bmFtZSA9ICJhcmN0dXJ1cyI7CisJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJCWNoaXBf
bmFtZSA9ICJuYXZpMTAiOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
