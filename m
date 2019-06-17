Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47A4902B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098989FE6;
	Mon, 17 Jun 2019 19:47:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1289FC3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y57so12334522qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7NXfWpgDWiiIRDzWdHdMVth+7Q4nfqqGwDsKZ0JeQc=;
 b=cKiSog6iGLugnyHZZTDZz17UZ00b2GDdLzjTz/yWRzIOIs2dlXKkUMAwVWfzOdCbEz
 JQeLSPgPekQKWUhEgfnyfYq3zIjW4+imSvY9L571/Ka0hEzZIQ7FHDVR/+0glAgcaDuD
 CGUku8VeUX5WMS14eHFyluHB3zBuor1Gol9whOApgDZhfb14C/GbO0GVIauZ7RYukK2N
 Wxas9why1GwwwFPiN6rEXgxectYZYcNRQiEndxUTytGYakcre3R5DbVGUxpt1Yp9SwM0
 1pYTthpFImvFaD6crsr1fOB3nRxj3NDBx0D/jEoEvMBQYrUXEElc7nds5YlJ7n9jM91X
 XRFA==
X-Gm-Message-State: APjAAAWek17bZLhmfFqTCbvMCkaWa3dLeGg2agPmwGUFcElLmvsA/XMs
 LYBvlY2AvlBBs+S6HvrVPVxbLF6YcUb+8g==
X-Google-Smtp-Source: APXvYqytLc9qu4C+lOb5KyPtm6Ni0N/leGSb9jm6zKvqDl7IEN8r2wT9vuc/1AjpdBFGoyiK7wQwIQ==
X-Received: by 2002:ac8:1a59:: with SMTP id q25mr95005574qtk.76.1560800833696; 
 Mon, 17 Jun 2019 12:47:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 377/459] drm/amd/display: Use 1/8th DSC target bitrate
 precision for N4:2:2 and 4:2:0 formats
Date: Mon, 17 Jun 2019 14:45:18 -0500
Message-Id: <20190617194540.18497-78-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7NXfWpgDWiiIRDzWdHdMVth+7Q4nfqqGwDsKZ0JeQc=;
 b=tgWpr/v+G6P94XkQC8Hh6x9RVYQ/gJJp40rhKUZx26mWZFidEpseOGB5o03pTLuWKt
 YERgEOzrQDQ8NDTBtjSfqXL97Ibi8717D+VmzTjLkXQ3271YiZUxXWQdGTVHkDtsh3A0
 zMyqxVTUiELOXoOiO69GZ0hW2U2W9AQUQ5b4LXP4gETWMeVwX2x4RYpMIzo6HLDubvor
 1a00sB7dldAwKK/i1S2bP09Qqzh9LtSjJvQ+NU391N6yJzOQZtd2qRekQv7sxwGH3sYv
 qwKExFAnNwoV5bFGA+TwA4lijRRdtvC3Nkp/2wz0Sg6LhuajG/fi5j8dXT1OJNI6maSv
 AihA==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KT24gYXQg
bGVhc3Qgc29tZSBvZiB0aGUgZGV2aWNlcyAoZS5nLiBSZWFsdGVrIHNjYWxlcikgd2UgZ2V0IGEg
YmxhY2sgc2NyZWVuIGlmIDEvMTZ0aApwcmVjaXNpb24gaXMgdXNlZC4KCltob3ddCldvcmsgYXJv
dW5kIGl0IGJ5IHJlZHVjaW5nIHByZWNpc2lvbiB0byAxLzh0aCBmb3IgTjQ6MjoyIGFuZCA0OjI6
MCBjb2xvciBmb3JtYXRzLiBUaGlzCmlzIGEgc2FmZSB3b3JrYXJvdW5kIGFuZCB3b3VsZCBoYXZl
IGEgdmVyeSBtaWxkIGltcGFjdCBvbiB0aGUgcXVhbGl0eS4KVGhlIGlzc3VlIGlzIHN0aWxsIHRv
IGJlIHJvb3QtY2F1c2VkIGFuZCBmaXhlZCBjb3JyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBOaWtv
bGEgQ29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+ClJldmlld2VkLWJ5OiBXZW5qaW5nIExp
dSA8V2VuamluZy5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RzYy9kY19kc2MuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCmluZGV4IDQ3MWVi
OTg3Mzg4NS4uYzY0OWY2MmQxODNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZHNjL2RjX2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kc2MvZGNfZHNjLmMKQEAgLTIyOCw2ICsyMjgsMTAgQEAgc3RhdGljIGJvb2wgZGNfaW50ZXJz
ZWN0X2RzY19jYXBzKAogCiAJZHNjX2NvbW1vbl9jYXBzLT5icHBfaW5jcmVtZW50X2RpdiA9IG1p
bihkc2Nfc2lua19jYXBzLT5icHBfaW5jcmVtZW50X2RpdiwgZHNjX2VuY19jYXBzLT5icHBfaW5j
cmVtZW50X2Rpdik7CiAKKwkvLyBUT0RPIERTQzogUmVtb3ZlIHRoaXMgd29ya2Fyb3VuZCBmb3Ig
TjQyMiBhbmQgNDIwIG9uY2UgaXQncyBmaXhlZCwgb3IgbW92ZSBpdCB0byBnZXRfZHNjX2VuY29k
ZXJfY2FwcygpCisJaWYgKHBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDIy
IHx8IHBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDIwKQorCQlkc2NfY29t
bW9uX2NhcHMtPmJwcF9pbmNyZW1lbnRfZGl2ID0gbWluKGRzY19jb21tb25fY2Fwcy0+YnBwX2lu
Y3JlbWVudF9kaXYsICh1aW50MzJfdCk4KTsKKwogCXJldHVybiB0cnVlOwogfQogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
