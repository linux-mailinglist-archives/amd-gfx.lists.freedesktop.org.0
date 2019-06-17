Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D949066
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581D6E061;
	Mon, 17 Jun 2019 19:50:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9F86E05A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:25 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so7010486qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K94Go8LBeKBtobdKL53/n9O5sxdCszW4mqTI+DYBzK4=;
 b=NqxcTe+bjIsR/Oyr6X9/WWIej6rrO386noKJpTuQiHLGgc6/8MT9+4GF36mfYv4ZUj
 Mfzp2dBSIKwOvknTQiDaLFJK6CHNqjY0bcNKfFXc8LCQdpwcGzBT1gXHmI5kRHNZFpu3
 5YYjcOpU9c8Qcg6wz6NQNk+7kfLh2TSqdo6MpxeRLzKo45uHBVaY3Ew/LE+9HH3XghPo
 J1TVsZVQUBxYRpnKs+/cK1GIltmLpS871G6TRiAehEiheBo69wTbcfUtAQNtXvmEdelm
 5yZ5iWoFsBQy5qmr/TNBAfLAQpOzyAsUid4B0WT7yBD1ljy6+p0BXbG1JeS6G9oZPPnM
 EP6g==
X-Gm-Message-State: APjAAAX74OzAN6TPszr0sMkFSYGymZ/FZAtHoMdhBL580yylwyK1wbrf
 dDyp6Ugk0U8y290wKkePmmry3md830iOiQ==
X-Google-Smtp-Source: APXvYqz4TCJWdqCe5vIzLjXCMYN8Q+D/8nUou9MD+zqTy9SY28mCLXIKDVDeJccraUtNS5s6sSZBQg==
X-Received: by 2002:a37:9207:: with SMTP id u7mr92733073qkd.357.1560801024768; 
 Mon, 17 Jun 2019 12:50:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 428/459] drm/amd/display: Disable DSC power gating in Diags
Date: Mon, 17 Jun 2019 14:49:17 -0500
Message-Id: <20190617194948.18667-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K94Go8LBeKBtobdKL53/n9O5sxdCszW4mqTI+DYBzK4=;
 b=g/ic5ofwvohmCFs6X65SYKmIg91vPolPfby7n167ZRLmmdzbPkH4rDBCjIOJNmiHOd
 dNtBg9RnhYp3lwhuFaT8Ccr2dzT2IwkV9s6kqlveDu0kzPvvsSHN4o7WEWm9merJV9HD
 c5/ZYmn/O4tukUhwQaK/sMQWjsgUhNx14Mhgo/oBIpGLjMuwTUOhi7cgVHgEP0dOudKH
 tfAXbPqlce5GTOYplNwz3rgWs0uY0vMWtIHSg9Sg16X9WBY+6F/ZLlgUrvfV5bKliKAm
 oJhwhXF4rh+uW+0MHtScAf540pmAVZD+0rXNd8OYdg+vGCvZq5Sff/c3cP3QJcLyL12K
 +CCA==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KV2l0aCBE
U0MgcG93ZXIgZ2F0aW5nIGVuYWJsZWQsIG9uZSBvZiB0aGUgcmVnaXN0ZXIgcmVhZHMgdGltZXMg
b3V0IG9jY2FzaW9uYWxseSwKY2F1c2luZyBhIERTQyB0ZXN0IHRvIGZhaWwuCgpbaG93XQpEaXNh
YmxlIERTQyBwb3dlciBnYXRpbmcgaW4gRGlhZ3MuCk5PVEU6IFRoaXMgaGFzIHRvIGJlIHJldmVy
dGVkIG9uY2UgdGhlIHByb2JsZW1zIHdpdGggRFNDIHBvd2VyIGdhdGluZyBhcmUKcmVzb2x2ZWQu
CgpTaWduZWQtb2ZmLWJ5OiBOaWtvbGEgQ29ybmlqIDxuaWtvbGEuY29ybmlqQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBOZXZlbmtvIFN0dXBhciA8TmV2ZW5rby5TdHVwYXJAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggZTdhOGEx
M2E5ZDMzLi5hYzY1Nzk0YzdmYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC03MjMsNiArNzIzLDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIGRlYnVnX2RlZmF1bHRzX2RpYWdzID0g
ewogCQkuZGlzYWJsZV9wcGxpYl93bV9yYW5nZSA9IHRydWUsCiAJCS5kaXNhYmxlX3N0dXR0ZXIg
PSB0cnVlLAogCQkuc2NsX3Jlc2V0X2xlbmd0aDEwID0gdHJ1ZSwKKyNpZmRlZiBDT05GSUdfRFJN
X0FNRF9EQ19EU0NfU1VQUE9SVAorCQkuZGlzYWJsZV9kc2NfcG93ZXJfZ2F0ZSA9IHRydWUsCisj
ZW5kaWYKIH07CiAKIHZvaWQgZGNuMjBfZHBwX2Rlc3Ryb3koc3RydWN0IGRwcCAqKmRwcCkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
