Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E36A040
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387F6E056;
	Tue, 16 Jul 2019 01:27:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480F26E04E
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r4so13199738qkm.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bv/CXWBq2Kjo0B8hHcbr4e1qksVkCs+QGhyzntZjvwA=;
 b=Lc0E2+sJdSoyHZ9xzOwrFyqPZrnW/CUOOxL/MyS/Jix0X+yPucySH2CnajAfB+mlTT
 raOWIEUMnteLwYAuQAvG5e3wR00ZXkdbhzMChj6/E3k0S5auS2/UuqTz4GhT0eOdWoFn
 eEgg8gH9mPYK9p+ha5oDc9J+PgEYFOwwQ0IGv6xGojGSf7GKE5fr8JNP3+qQr/Aia2jq
 2Xahx8sc8OTyyfMqgwf+4bUyECccsqA3RxotcZMgIibr3v9prqrn5cctnD88MsmzGDCT
 23GX6OorWen8UtR/I5MRvrBIgXUuVXXILuKNJcPeipm5hxlIwm8P8uW3bT0NvU+GGmzW
 dnTw==
X-Gm-Message-State: APjAAAVyob50XZ6z/7siS0Xfna25SXtopPyqAOL8o4IW5kkWZmYiY/Wy
 XBg8Z7G/YFCRXZRSIJTJ3XruJ1S7
X-Google-Smtp-Source: APXvYqxt2ER3+l0wQ0/10gqEMiMDKCXi0lFOv5EsmZ9TQSrTShSKIEHwV4jMiNOUPH5cDW3oCMxFCg==
X-Received: by 2002:a37:e40a:: with SMTP id y10mr18940513qkf.134.1563240477176; 
 Mon, 15 Jul 2019 18:27:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 099/102] drm/amdkfd: Increase vcrat size for GPU
Date: Mon, 15 Jul 2019 20:27:38 -0500
Message-Id: <20190716012741.32036-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bv/CXWBq2Kjo0B8hHcbr4e1qksVkCs+QGhyzntZjvwA=;
 b=GO8PMaNkYgmrJmVdhKBPh+IkrxAnDQXaTncCeJ3mHD3jyhMRRF6k0uNxMhlPpjkpH+
 AQFt24ulLakq0ZibSVWD4SwHUGOmkspGlvBN8qTk+NB0cokg2+6dAcx5Z5OAkEjQZp8n
 KkHiW9bTNnxyjH0FaljGZEO+pf5Ase8Zy8p/CluG1KLlXXtJGP3L4UCYbggz5K/2aYgv
 3DfzIXb3NTkpaZDPJ5SZCdCltkbONVa123X6yAXYxGJvi9Kbr/ZuM+cLaKWsxX6qmVLP
 7Qv0b46AtCluCGFXUD1mfVI5reroRbzjM2EMyFM2IbpbqCM/Cvsu4O/MqqDs/Eo6ocFr
 YdxQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpHUFUgY2FjaGUgaW5mbyAocGFydCBv
ZiB2aXJ0dWFsIENSQVQpIHNpemUgZGVwZW5kcyBvbiBDVSBudW1iZXIuCkZvciBhcmN0dXJ1cywg
Q1UgbnVtYmVyIGhhcyBiZWVuIGluY3JlYXNlZCBmcm9tIDY0IHRvIDEyOC4gU28KdGhlIHJlcXVp
cmVkIG1lbW9yeSBmb3IgdmNyYXQgYWxzbyBpbmNyZWFzZXMuCgpTaWduZWQtb2ZmLWJ5OiBPYWsg
WmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFv
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKaW5kZXggYjMwY2NiZmViNjQ4Li40NTQ1NTJmZTI1
NjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYwpAQCAtNzg4LDcgKzc4OCw3
IEBAIGludCBrZmRfY3JlYXRlX2NyYXRfaW1hZ2VfYWNwaSh2b2lkICoqY3JhdF9pbWFnZSwgc2l6
ZV90ICpzaXplKQogICogaXMgcHV0IGluIHRoZSBjb2RlIHRvIGVuc3VyZSB3ZSBkb24ndCBvdmVy
d3JpdGUuCiAgKi8KICNkZWZpbmUgVkNSQVRfU0laRV9GT1JfQ1BVCSgyICogUEFHRV9TSVpFKQot
I2RlZmluZSBWQ1JBVF9TSVpFX0ZPUl9HUFUJKDMgKiBQQUdFX1NJWkUpCisjZGVmaW5lIFZDUkFU
X1NJWkVfRk9SX0dQVQkoNCAqIFBBR0VfU0laRSkKIAogLyoga2ZkX2ZpbGxfY3VfZm9yX2NwdSAt
IEZpbGwgaW4gQ29tcHV0ZSBpbmZvIGZvciB0aGUgZ2l2ZW4gQ1BVIE5VTUEgbm9kZQogICoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
