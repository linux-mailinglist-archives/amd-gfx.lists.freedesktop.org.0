Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7E12178F6
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jul 2020 22:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D1D8914A;
	Tue,  7 Jul 2020 20:13:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B592A6E80B
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2020 20:13:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f18so38532847wrs.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2020 13:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTmW8GfMFV/TYGpBlf3/1N9LBDvcZT77sRHKHDyMv2U=;
 b=GL5GXtMw+oGEYvMEGD0ynq2bKINBxOKzvUDWYVHTriILNZ4e2LMTYBOLfRSdtqri/0
 8fVfJVJOm+WP7NTwU9gLBFBMCRU8A2MmLw38gaCMariAj60judwyB1sDCPok8/lVFlnY
 Pb7gt9prSymFTaCQVjSvH2HJvNNSjmu81x9wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTmW8GfMFV/TYGpBlf3/1N9LBDvcZT77sRHKHDyMv2U=;
 b=AYtpohQtbE3pskd8XThvG7Lg5GtWllJmQ0Ir9ec4a+fIR8o7xvAZmTtvBACKL7wo4e
 VpAh8TDt9YNcUZR4Cuz/PZ9azdtoca16zF/bVpwbViNKag/WZuD5/+SqAiGqLEw+Pfpu
 eRj8xFJnLw4VAEGaHXqY9rXvOlEObBVeIw4H711TTGKzl5kHHBfrLXHLEcvvhLnyzK1b
 n5o6Vied24GfcgHij5JJlmB9piw/7tcgd49W+e/pFpfQbZe9xzDp/4APTkILCo9CtbpX
 L0pK7AH8Y6BjraA9LcHFkorOeQDDQuwaILgXgIYHqeZFE0vO9WXkF7sm8URaXhLDFaLq
 DrFw==
X-Gm-Message-State: AOAM533WbWA2KlkzphrXwJhSLEF2pDJIS2q3hR8YnWzPPk6LBtPCg7uU
 hqA+7HLeuhnga5V8KNw55g4fiQ==
X-Google-Smtp-Source: ABdhPJwmWTeCyTx0bBgTDG/B9PdUMguU6YzowcNba5ee/pIgTrKGFZT6kx1B6bzPcnRvbe3254x7bw==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr36581036wrr.364.1594152785392; 
 Tue, 07 Jul 2020 13:13:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:13:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/25] drm/amdgpu: DC also loves to allocate stuff where it
 shouldn't
Date: Tue,  7 Jul 2020 22:12:24 +0200
Message-Id: <20200707201229.472834-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90IGdvaW5nIHRvIGJvdGhlciB3aXRoIGEgY29tcGxldGUmcHJldHR5IGNvbW1pdCBtZXNzYWdl
LCBqdXN0Cm9mZmVuZGluZyBiYWNrdHJhY2U6CgogICAgICAgIGt2bWFsbG9jX25vZGUrMHg0Ny8w
eDgwCiAgICAgICAgZGNfY3JlYXRlX3N0YXRlKzB4MWYvMHg2MCBbYW1kZ3B1XQogICAgICAgIGRj
X2NvbW1pdF9zdGF0ZSsweGNiLzB4OWIwIFthbWRncHVdCiAgICAgICAgYW1kZ3B1X2RtX2F0b21p
Y19jb21taXRfdGFpbCsweGQzMS8weDIwMTAgW2FtZGdwdV0KICAgICAgICBjb21taXRfdGFpbCsw
eGE0LzB4MTQwIFtkcm1fa21zX2hlbHBlcl0KICAgICAgICBkcm1fYXRvbWljX2hlbHBlcl9jb21t
aXQrMHgxNTIvMHgxODAgW2RybV9rbXNfaGVscGVyXQogICAgICAgIGRybV9jbGllbnRfbW9kZXNl
dF9jb21taXRfYXRvbWljKzB4MWVhLzB4MjUwIFtkcm1dCiAgICAgICAgZHJtX2NsaWVudF9tb2Rl
c2V0X2NvbW1pdF9sb2NrZWQrMHg1NS8weDE5MCBbZHJtXQogICAgICAgIGRybV9jbGllbnRfbW9k
ZXNldF9jb21taXQrMHgyNC8weDQwIFtkcm1dCgp2MjogRm91bmQgbW9yZSBpbiBEQyBjb2RlLCBJ
J20ganVzdCBnb2luZyB0byBwaWxlIHRoZW0gYWxsIHVwLgoKQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCkNjOiBsaW51eC1y
ZG1hQHZnZXIua2VybmVsLm9yZwpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbS5jICAgICAgICAg
ICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
ICAgICAgICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9t
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tLmMKaW5kZXggNGNmYzc4NjY5OWM3
Li4xYjBjNjc0ZmFiMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0
b20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tLmMKQEAgLTEyMjYsNyAr
MTIyNiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2F0b21fZXhlY3V0ZV90YWJsZV9sb2NrZWQoc3Ry
dWN0IGF0b21fY29udGV4dCAqY3R4LCBpbnQgaW5kZXgsCiAJZWN0eC5hYm9ydCA9IGZhbHNlOwog
CWVjdHgubGFzdF9qdW1wID0gMDsKIAlpZiAod3MpCi0JCWVjdHgud3MgPSBrY2FsbG9jKDQsIHdz
LCBHRlBfS0VSTkVMKTsKKwkJZWN0eC53cyA9IGtjYWxsb2MoNCwgd3MsIEdGUF9BVE9NSUMpOwog
CWVsc2UKIAkJZWN0eC53cyA9IE5VTEw7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDZhZmNjMzNmZjg0Ni4uM2Q0MWVkZGM3
OTA4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKQEAgLTY4NzIsNyArNjg3Miw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21t
aXRfcGxhbmVzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJc3RydWN0IGRjX3N0
cmVhbV91cGRhdGUgc3RyZWFtX3VwZGF0ZTsKIAl9ICpidW5kbGU7CiAKLQlidW5kbGUgPSBremFs
bG9jKHNpemVvZigqYnVuZGxlKSwgR0ZQX0tFUk5FTCk7CisJYnVuZGxlID0ga3phbGxvYyhzaXpl
b2YoKmJ1bmRsZSksIEdGUF9BVE9NSUMpOwogCiAJaWYgKCFidW5kbGUpIHsKIAkJZG1fZXJyb3Io
IkZhaWxlZCB0byBhbGxvY2F0ZSB1cGRhdGUgYnVuZGxlXG4iKTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDk0MmNlYjBmNjM4My4uZjlhNTg1MDllZmIyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTE0NzUsOCArMTQ3
NSwxMCBAQCBib29sIGRjX3Bvc3RfdXBkYXRlX3N1cmZhY2VzX3RvX3N0cmVhbShzdHJ1Y3QgZGMg
KmRjKQogCiBzdHJ1Y3QgZGNfc3RhdGUgKmRjX2NyZWF0ZV9zdGF0ZShzdHJ1Y3QgZGMgKmRjKQog
eworCS8qIE5vIHlvdSByZWFsbHkgY2FudCBhbGxvY2F0ZSByYW5kb20gY3JhcCBoZXJlIHRoaXMg
bGF0ZSBpbgorCSAqIGF0b21pY19jb21taXRfdGFpbC4gKi8KIAlzdHJ1Y3QgZGNfc3RhdGUgKmNv
bnRleHQgPSBrdnphbGxvYyhzaXplb2Yoc3RydWN0IGRjX3N0YXRlKSwKLQkJCQkJICAgIEdGUF9L
RVJORUwpOworCQkJCQkgICAgR0ZQX0FUT01JQyk7CiAKIAlpZiAoIWNvbnRleHQpCiAJCXJldHVy
biBOVUxMOwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
