Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EC48F86
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFC289CD8;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490289CBA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:28 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so6990964qkc.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvKQP2vRPgpqo7jdtQ4SNQ7bNBNOEraBklsF9NoJv2Y=;
 b=gCB2rkecLl13I8/cy6hmYjM4QKXWRej4BuDsY9AFOX6BJGmu48vQqqfPBrqMJPmqqJ
 FPwZKQhBXO4O3YsIl279QJGceCg45cnxZeNS2wpifgclB4AOS4AdkjpxL0ldwKFB7duJ
 pikny5F9dkEB2zoRb8plDJjFfDCbevZLs0uogB7s2ivdA+wrVtz3KWmPcgdtv/HnVSnw
 jB98XExSgc5Gds9HaCa0RbQSPlV5zCJgxFS/68JVUB7fuZG6YWIPx/LtNf1AM1563GTO
 RKVt4rqWtVUJi0vaDy61hk8yYkltWeTY0eq9cVo9dDKrMgadQS3Odk7bNDUYJY5eXOAo
 VEnA==
X-Gm-Message-State: APjAAAWaNb3GqUFUNCSFpBjzVfGDNUQf85S4Nu/k7pF1foTymXqbhqOe
 a8MDkxCb0Lebb9vZxC8t6fZiUqD2gIY=
X-Google-Smtp-Source: APXvYqzt6mV5+iyNTxK0zEC88XP8OkriNx+NpObHgBslYrNb56XgNu/opNT7AqM7d1y2iti2614eLw==
X-Received: by 2002:ae9:f101:: with SMTP id k1mr6500625qkg.337.1560799947002; 
 Mon, 17 Jun 2019 12:32:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 281/459] drm/amdgpu/gfx10: update gfx golden settings
Date: Mon, 17 Jun 2019 14:30:48 -0500
Message-Id: <20190617193106.18231-82-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvKQP2vRPgpqo7jdtQ4SNQ7bNBNOEraBklsF9NoJv2Y=;
 b=ZTxSZY9fHidbfhsDPYPU03Cjue8ot2mboZE589SiGucHnbZF6dfp4xlEkJO3wWuby9
 SuAxJViTE6OJ9th69gyuzrDdORWVRjGVpYlRtsY5ri/G6Ukedh5bhZ0JfpE2fxsQVITc
 BDxUZ8RoxHexud5lsDSCMKI71uViynldi2GXJPFfekP5UIPzYWGQwEdiKtlIe5VKmffz
 DfkB/+FhwGK69V4O7WtdzRb/5S70ESYhu9A/r5ZvYs1sr+gPMSCu70NhbtJRAhbtAR6Z
 Oan8E96NcvVIKiJ8Xlri8uzY24IIvL6DA3eI4nnmxvX3Z5y9Zlwp8WNh17b8K94+7HuQ
 bLMA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, tiancyin <tianci.yin@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KCmFkZCBuZXcgcmVnaXN0ZXJzOiBt
bVBBX1NDX0VOSEFOQ0VfMSwgbW1UQ1BfQ05UTCwKdXBkYXRlIHJlZ2lzdGVyczogbW1EQl9ERUJV
RzQsIG1tVVRDTDFfQ1RSTAoKUmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFu
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IHRpYW5jeWluIDx0aWFuY2kueWluQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDYgKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggOTU5NTA2NWUyZDNlLi5hZTNkODY4ZGUzMDgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC03OCw3ICs3OCw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2Nf
MTBfMVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0RFQlVHLCAweDIw
MDAwMDAwLCAweDIwMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURC
X0RFQlVHMiwgMHhmZmZmZmZmZiwgMHgwMDAwMDQyMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxV
RShHQywgMCwgbW1EQl9ERUJVRzMsIDB4MDAwMDAyMDAsIDB4MDAwMDAyMDApLAotCVNPQzE1X1JF
R19HT0xERU5fVkFMVUUoR0MsIDAsIG1tREJfREVCVUc0LCAweDA3ODAwMDAwLCAweDA0ODAwMDAw
KSwKKwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbURCX0RFQlVHNCwgMHgwNzkwMDAw
MCwgMHgwNDkwMDAwMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1EQl9ERlNN
X1RJTEVTX0lOX0ZMSUdIVCwgMHgwMDAwZmZmZiwgMHgwMDAwMDAzZiksCiAJU09DMTVfUkVHX0dP
TERFTl9WQUxVRShHQywgMCwgbW1EQl9MQVNUX09GX0JVUlNUX0NPTkZJRywgMHhmZmZmZmZmZiwg
MHgwMzg2MDIwNCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HQ1JfR0VORVJB
TF9DTlRMLCAweDFmZjBmZmZmLCAweDAwMDAwNTAwKSwKQEAgLTkyLDE0ICs5MiwxNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFb
XSA9CiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1HTDJDX0NUUkwyLCAweGZmZmZm
ZmZmLCAweDE0MDIwMDJmKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkNf
Q1RSTDMsIDB4ZmZmZjlmZmYsIDB4MDAwMDExODgpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUo
R0MsIDAsIG1tUEFfU0NfRU5IQU5DRSwgMHgzZmZmZmZmZiwgMHgwODAwMDAwOSksCisJU09DMTVf
UkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1QQV9TQ19FTkhBTkNFXzEsIDB4MDA0MDAwMDAsIDB4
MDQ0NDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfTElORV9T
VElQUExFX1NUQVRFLCAweDAwMDBmZjBmLCAweDAwMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVO
X1ZBTFVFKEdDLCAwLCBtbVJNSV9TUEFSRSwgMHhmZmZmZmZmZiwgMHhmZmZmMzEwMSksCiAJU09D
MTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1TUV9BTFVfQ0xLX0NUUkwsIDB4ZmZmZmZmZmYs
IDB4ZmZmZmZmZmYpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tU1FfQVJCX0NP
TkZJRywgMHgwMDAwMDEwMCwgMHgwMDAwMDEzMCksCiAJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1TUV9MRFNfQ0xLX0NUUkwsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYpLAogCVNPQzE1
X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVEFfQ05UTF9BVVgsIDB4ZmZmN2ZmZmYsIDB4MDEw
MzAwMDApLAorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVENQX0NOVEwsIDB4NjAw
MDAwMTAsIDB4NDc5YzAwMTApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVVRD
TDFfQ0dUVF9DTEtfQ1RSTCwgMHg0MDAwMGZmMCwgMHg0MDAwMDEwMCksCi0JU09DMTVfUkVHX0dP
TERFTl9WQUxVRShHQywgMCwgbW1VVENMMV9DVFJMLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwKQor
CVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVVRDTDFfQ1RSTCwgMHgwMDgwMDAwMCwg
MHgwMDgwMDAwMCkKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBn
b2xkZW5fc2V0dGluZ3NfZ2NfMTBfMF9udjEwW10gPQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
