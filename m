Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90669E2D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821CC89F55;
	Mon, 15 Jul 2019 21:25:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64DA89ED6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:34 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so17224365qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYAKW35By28RpHIFZjsXsOJ3PNwMb/QcHSMZ9UDoqK0=;
 b=F4lKc5xRKx1pjMwzTRkYdZjGru/5Q72dA2GnBjUn/tPjwReniwFCuCqc5kZcaUlAFo
 y3s7mw69dF2Ii5uxb2xGXJxswsL5vrWUrsI9WRyPOnw3EQBlRXQKyW1zG/njga45wWRR
 uuNZip/j+mLk4PQBcN8eKdHaNxVx3+65QikgzGpIHFlunqU3XlohO1bnwLVAAG1mjBCG
 5WYsQFwOHAFxZUHm0Tg+geHDwsx7XvNEu829QDSDFjzwqRsz3+EgBlcYo14PhaVHtgaM
 SRiySpTquCiueandXpZ41PAOscrmDCqGiNbs8pEfu1MHMQS4j2T7Si/kKbbHrld527OE
 8IZw==
X-Gm-Message-State: APjAAAXqcb1PpjK9L21XTFjVpR7aafGaEzfAGNk3meIeJbbReYVRQikY
 TxHNN3P8ej4BRhGULN1S9K+klHID
X-Google-Smtp-Source: APXvYqy6zwkHIzE9EuboYhuxyRl0sdzfpsl6xcY/FOfsoOsQKSGmbc4gbuGIXM/MWA9VBlQ/NFfKjg==
X-Received: by 2002:ac8:428f:: with SMTP id o15mr19082476qtl.210.1563225933711; 
 Mon, 15 Jul 2019 14:25:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 055/102] drm/amdgpu: declare sdma firmware binary files for
 Arcturus
Date: Mon, 15 Jul 2019 16:23:50 -0500
Message-Id: <20190715212437.31793-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYAKW35By28RpHIFZjsXsOJ3PNwMb/QcHSMZ9UDoqK0=;
 b=TYTZv/3x3jls9DKjaw88iKEYj5104urRoO2WOKrcxtDpsraPQ5yvJrg//OcLLgHyn5
 5+roD1bcvIYOoetC+yxoo5V1pn3hn3A4bCsXNDmmHgf9QSAETCStDOq7KlfrRFYF8E8f
 weL0ku9dQGRPQStfLM2vqUh8BkqfmFwQLvGDFFyPB3J7bxXsc87wZ/CeCAxflR6iw5L3
 ub9CR7D2s5UImdAoo+OOL0n5ysaMuKvI0EyrQoErcSlf3SKtQdA3V9YnXXMlPdOyoTxx
 i7eE9OWYAnXMheSY5TaG/yodj+30eLmekIIN+n0PC6IrEKq2OgmoqRh5U+TJLlFgkGGB
 bsVA==
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
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgOCArKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NF8wLmMKaW5kZXggNTk0NzUwYTlmMmZjLi5jZDE0MmU0MzA0YTggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC01Miw2ICs1MiwxNCBAQCBNT0RVTEVf
RklSTVdBUkUoImFtZGdwdS92ZWdhMjBfc2RtYTEuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFt
ZGdwdS9yYXZlbl9zZG1hLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcGljYXNzb19z
ZG1hLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW4yX3NkbWEuYmluIik7CitN
T0RVTEVfRklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19zZG1hLmJpbiIpOworTU9EVUxFX0ZJUk1X
QVJFKCJhbWRncHUvYXJjdHVydXNfc2RtYTEuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdw
dS9hcmN0dXJ1c19zZG1hMi5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVz
X3NkbWEzLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfc2RtYTQuYmlu
Iik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19zZG1hNS5iaW4iKTsKK01PRFVM
RV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVzX3NkbWE2LmJpbiIpOworTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvYXJjdHVydXNfc2RtYTcuYmluIik7CiAKICNkZWZpbmUgU0RNQTBfUE9XRVJfQ05U
TF9fT05fT0ZGX0NPTkRJVElPTl9IT0xEX1RJTUVfTUFTSyAgMHgwMDAwMDBGOEwKICNkZWZpbmUg
U0RNQTBfUE9XRVJfQ05UTF9fT05fT0ZGX1NUQVRVU19EVVJBVElPTl9USU1FX01BU0sgMHhGQzAw
MDAwMEwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
