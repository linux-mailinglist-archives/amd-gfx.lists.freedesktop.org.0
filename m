Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D64901E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A847E89F77;
	Mon, 17 Jun 2019 19:47:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D17A89F4A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:03 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so12321377qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rixum31sa6LdI6cxf1nyW1GgUS799+VbvSSkjvN1NJI=;
 b=n/40LltMcRcHCePnsKRXsfLBRMwFDKCCoImI1yvDpT6H8jCf2Se9OOAPjCkD/3tpZc
 eVloQ1IY6dXUZ3om0AaITfxaFyum/krULfVdaoNGAuRc8ohv6CANt13IUIT79H6Blkv/
 vAX+taMfYnQJa1cCoZ8yI7YxkvYeN2Ws6kUkbA7S7yt7U3S2o/bABy4TIVkfUQ+Tuz7J
 K+QMy76kt/oFLXIUshcnLGp9Hkh0jmbM7mTVv4nCir+8hMaF7steeoqHjSngQH6RqJCI
 O108L/W6VnlHM9l8LJVnVMHmgfRiOK+9QWCaKT8ya5HAYuYZWzdUZX3Zm30R7aFlcaFA
 F5zQ==
X-Gm-Message-State: APjAAAW4CRfG/e7JwX59AM8gyNR4Csnp03Mh/G6HBc/HYIdm1HSjULLL
 /spvKOSGy6sDgXXN11ee4Um5PF/d3yu3Tg==
X-Google-Smtp-Source: APXvYqzhpkC5H00MSJjhvgP4WmbjKBVHFTIGNqyIlGbnQAl8dyLtlIWR8k7FY/O3AEb2XA6W1Xz+/A==
X-Received: by 2002:a0c:874b:: with SMTP id 11mr9118209qvi.141.1560800822014; 
 Mon, 17 Jun 2019 12:47:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 365/459] drm/amd/display: Add a flags union for 3dlut
 transformation matrix
Date: Mon, 17 Jun 2019 14:45:06 -0500
Message-Id: <20190617194540.18497-66-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rixum31sa6LdI6cxf1nyW1GgUS799+VbvSSkjvN1NJI=;
 b=lR6hgPe95A6Wji4246qaJRGtrTOGy2h20bb4S7pV9CWmo3Iignjco/3Y3na7jAbOd5
 dq/tJw0ZatFZo4UQi/q86w3VRG68Vfni2I2179LVwTrv/FqBU1/hz9SBz3X1qE4+qytq
 WCP+Ywxz1LsskhPp+J21Hw/rqSkqzETIzKcBcMvU/jf0Tg6VzYeYj4AwPg0XDNMbcyU+
 6cCWKbgsnd2bxGKsxjnZPENzYO2c6b6tTd3TSYJiYs+Fp371mflZLtHCKSnZbKedwTbR
 IwWEYBSCbYtnVOsAnwVHijDAY2FVS7GHq1LcmCE0R5UrzY7pbHYbU5wMY8I+n2s+/p0U
 Kjpw==
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
 Aric Cyr <Aric.Cyr@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpXaGVuIFRNIGlzIGVuYWJsZWQgd2l0aCAzZGx1dCwgd2UgYXBwbHkgY29udmVyc2lvbiB0bwpk
Y2lwMyBpbiBnYW11dCByZW1hcCBtYXRyaXgsIGlmIHNvdXJjZSBhcmVhIGxlc3MgdGhhbgpkY2lw
My4gSWYgaXQgaXMgYmlnZ2VyLCB3ZSByZW1hcCB0byBidDIwMjAuIFRoZSBhZGRlZApmbGFncyB3
aWxsIGJlIHVzZWQgdG8gZmFjaWxpdGF0ZSB0aGlzIGxvZ2ljLgoKU2lnbmVkLW9mZi1ieTogVml0
YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBcmljIEN5
ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IEtydW5vc2xhdiBLb3ZhYyA8S3J1bm9zbGF2
LktvdmFjQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuaCAgfCAx
MiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2Ft
bWEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dh
bW1hLmgKaW5kZXggMzY5OTUzZmFmYWRmLi5jNTZjMjAzYWJmY2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuaApA
QCAtODIsNiArODIsMTggQEAgc3RydWN0IGZyZWVzeW5jX2hkcl90Zl9wYXJhbXMgewogCXVuc2ln
bmVkIGludCBza2lwX3RtOyAvLyBza2lwIHRtCiB9OwogCit1bmlvbiB0bTNkbHV0X2ZsYWdzIHsK
Kwl1bnNpZ25lZCBpbnQgcmF3OworCXN0cnVjdCB7CisJCXVuc2lnbmVkIGludCBkb2Nocm9tYV9z
Y2FsZQkJCToxOworCQl1bnNpZ25lZCBpbnQgc3BlY192ZXJzaW9uCQkJOjM7CisJCXVuc2lnbmVk
IGludCBsZXNzX3RoYW5fZGNpcDMJCQk6MTsKKwkJdW5zaWduZWQgaW50IGV4cF9zaGFwZXJfbWF4
CQkJOjY7CisJCXVuc2lnbmVkIGludCB6ZXJvX2Rpc3BsYXlfYmxhY2sJCQk6MTsKKwkJdW5zaWdu
ZWQgaW50IHJlc2V2ZWQJCQkJOjIwOworCX0gYml0czsKK307CisKIHZvaWQgc2V0dXBfeF9wb2lu
dHNfZGlzdHJpYnV0aW9uKHZvaWQpOwogdm9pZCBwcmVjb21wdXRlX3BxKHZvaWQpOwogdm9pZCBw
cmVjb21wdXRlX2RlX3BxKHZvaWQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
