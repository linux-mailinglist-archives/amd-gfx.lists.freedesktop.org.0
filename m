Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63A73201
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49BF6E5B9;
	Wed, 24 Jul 2019 14:43:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AF96E5B9
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:43:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so45712598qtl.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jApWp9wjgCBtK60lGYz6n5o8Y0hqBqiyNGGQsSYNjHk=;
 b=UyiZ2qHE/KPljklM19C90ip0JEWvaY2/JVLgWdY8tzRnB5zrOShwzutuNLYgsm39RJ
 Z4hzOoB7WGWRS2uM6YQUp1RiQBYiaKYGqo0gmvekBAb5E+6nW5bFxXibDMubV2ZrJLn4
 0lioOWWcJLx0asxZKbcXZo6VGOckwxz1zhpXpQObXI4bWM0GaAlRbquWNqT8z3RBpqvB
 GXe6VenxcC6u1lxC4CP7dvKf69TQvzFBYGOS0kagHl3uMCBDwQdVA7/wqyTAtx6I3SYn
 HohBIxKftSwYockywmBQ1xtSLawLbe2/uvKtgEuW/6FtKpEUDSL9saDyHWolJeFi648o
 o+xg==
X-Gm-Message-State: APjAAAWWTxrDsLPGTYerqojzzgk0disrgegb2oOMCtj5nlZpmcv70jpE
 Q2MKOWSeTDshYRLAawGXF8oaGxjV
X-Google-Smtp-Source: APXvYqy18dKiG//ab27s+oxQty3U+eATZG8VOT6zc9DcvLlRgra6CSSTL+0aI2qoJExIcFBU5iGRQA==
X-Received: by 2002:ac8:2971:: with SMTP id z46mr56508051qtz.322.1563979422909; 
 Wed, 24 Jul 2019 07:43:42 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a6sm21120223qth.76.2019.07.24.07.43.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 07:43:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] Revert "drm/amdgpu/powerplay/vega20: call
 PrepareMp1ForUnload in power_off_asic"
Date: Wed, 24 Jul 2019 09:43:33 -0500
Message-Id: <20190724144333.24047-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724144333.24047-1-alexander.deucher@amd.com>
References: <20190724144333.24047-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jApWp9wjgCBtK60lGYz6n5o8Y0hqBqiyNGGQsSYNjHk=;
 b=Qyyuj0ra6hr1coHm9QY5xzp6uFApeYKRDFh9t35PROWxZZl7PFq6nRy197d16pS679
 B2ZmfEbI4Rop0amrAabPbUsDuc1wHOmtL5/rZqsP4lu+6OXOB0Yf0kVkoSpS/EeOfP95
 3CLjR2odz4h1JnJFzowvxySKhXEg9KwAS9cOhKts8stdvZo1PxiXjFtvwvoXlGJpk/0U
 4nh/JSx5TBqL7TFSAmLpo84DnNY4W1xpVo0Yq/zbTwq4kJLxTUvYhlg5pc6HJWjpgQb8
 ciQxXpfNXoTk59mJ3pNosOXM9SeHOY0MxNtGm4sR7jE4a3wCAfLDWnNbTkJybRrMa4aH
 TN8w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBjM2IwOTlmMThjNDViZDhkNzhhNTFhNzA2YzY0OGQ1ODgzMjFj
MTljLgoKUmV2ZXJ0IGZvciBub3cgcGVuZGluZyBmdXJ0aGVyIGRpc2N1c3Npb25zIHdpdGggcG93
ZXIgdGVhbS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBf
aHdtZ3IuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKaW5k
ZXggZTE2ZDY2NTQ2OTJmLi5mMjdjNmZiYjE5MmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCkBAIC0zNzY0LDExICszNzY0LDYg
QEAgc3RhdGljIGludCB2ZWdhMjBfcG93ZXJfb2ZmX2FzaWMoc3RydWN0IHBwX2h3bWdyICpod21n
cikKIAkJCSk7CiAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFwICY9IH4oV2F0ZXJNYXJrc0xvYWRl
ZCk7CiAKLQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPSBzbXVtX3NlbmRfbXNnX3RvX3Nt
Yyhod21nciwKLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwKLQkJCSJb
UHJlcGFyZU1wMUZvclVubG9hZF0gRmFpbGVkISIsCi0JCQlyZXR1cm4gcmVzdWx0KTsKLQogCXJl
dHVybiByZXN1bHQ7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
