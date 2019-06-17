Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B74900F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD1389EB1;
	Mon, 17 Jun 2019 19:46:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946BB89E5B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:43 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so12255643qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4USDyAL4kx2PlN/pwsNpko8viIUEkdDjnQgm30SzeM=;
 b=a6SFaJ1gkDD/YQBB66ZmX0N5HyUbW5/LRjutKofNMkDWMAbZ6LZQlk7Yut4Ti47qQy
 ShzP21O2tXoa1EcBCHnbTgavi/iJ6DFuAA+8TI+4hFW+iiMKPfae6QWPqWfNeTskpO+f
 owGzJPkA6Vmd/3aBUFTWsbtM7gtYxKsKC3DhupKvQnjR4kVAXMuEZhjJ7XTLKYrOSsfb
 KvOZziKqAZLaMHuHaIXAHexoBKOh2w1FbhFfyepUyzjT+iAoyge83KChj2AANnJ2psRM
 SvIyZGb89GtqHwvmah7rpsmgV2NvAxu5KG7V8bofASbtF2GjIp31B2/WRd4V6ss7wCdb
 tZWg==
X-Gm-Message-State: APjAAAUOWecNf/JFkEI9ty3kG2LixPRNNaLPqWkhap4xs6KzqWDTBy6S
 GwLNOhp/Zv6TUktF26N2x3wF9V+35XQ=
X-Google-Smtp-Source: APXvYqx3pq7sYBDlu8qK7cA5oGjxSKM2H1pycZZfvG7Ui8FNqPQfKMiybxjf+hZfEYCGME8QW65OTQ==
X-Received: by 2002:a0c:874b:: with SMTP id 11mr9116801qvi.141.1560800802295; 
 Mon, 17 Jun 2019 12:46:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 344/459] drm/amd/display: Program VTG params after programming
 Global Sync for DCN2
Date: Mon, 17 Jun 2019 14:44:45 -0500
Message-Id: <20190617194540.18497-45-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4USDyAL4kx2PlN/pwsNpko8viIUEkdDjnQgm30SzeM=;
 b=rKZA9cQjCBRqUFQpcolt8pqJtTNSg6Lke9/ot58FgwscDXUVAarr3hHU93RY7pBDYA
 5YLXeIcbF+Ywjxd/R17vfKQK3SOnrFQsergUHf7RAu9weW1xP6HmDOXkPOno8NLdOpeI
 /20WhGTBWOHHiwbXnK9gdgGlIKWtzAr0wFvYr7REIQwtXrPinqEKB2qV2Y7SMYrXVyAt
 OujHEhq4skFEd3LE3fPi8HT7d8I6QWtr/48NjPQ6WRBaXivGYcEFVizR+isrMz1Jj2pW
 FFxlS0wXxQjDcpkyFudseINPD16B6+iLh0wtWUvpFNMNvs3cWOeOptRF1Wtths6WRoaa
 tbrw==
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClZU
RyBoYXMgYSBwYXJhbWV0ZXIgRlAyLCB3aGljaCBpcyBkZWZpbmVkIGFzOgogICAgaWYgVlNUQVJU
VVAgaXMgYmVmb3JlIFZTWU5DOgogICAgICAgIEZQMiA9IG51bWJlciBvZiBsaW5lcyBpbiBiZXR3
ZWVuIFZTVEFSVFVQIGFuZCBWU1lOQwogICAgZWxzZQogICAgICAgIEZQMiA9IDAKQ3VycmVudGx5
LCBGUDIgaXMgb25seSBwcm9ncmFtbWVkIGR1cmluZyAicHJvZ3JhbV90aW1pbmciLiBIb3dldmVy
LCB0aGUKcG9zaXRpb24gb2YgVlNUQVJUVVAgaXMgYWZmZWN0ZWQgYnkgdGhlIHByZWZldGNoaW5n
IHJlcXVpcmVtZW50cyBvbiBhbGwgcGlwZXMsCnNvIHRoZSBwb3NpdGlvbiBtaWdodCBjaGFuZ2Ug
d2hlbiB3ZSBkbyBtZW1vcnkgcmVxdWVzdCBjb250cm9sIG9uIGFub3RoZXIgcGlwZSwgc28gd2Ug
bmVlZAp0byBtYWtlIHN1cmUgdGhhdCBGUDIgc3RheXMgdXAtdG8tZGF0ZSB3aGVuZXZlciB3ZSBh
ZGp1c3QgVlNUQVJUVVAuCgpbSG93XQogLSByZWZhY3RvciBWVEdfQ09OVFJPTCBwcm9ncmFtbWlu
ZyBpbnRvIGEgbmV3IGZ1bmN0aW9uICJzZXRfdnRnX3BhcmFtcyIKIC0gY2FsbCBpdCBhZnRlciBj
YWxsaW5nICJwcm9ncmFtX2dsb2JhbF9zeW5jIgogICAtIG1ha2Ugc3VyZSBpdCdzIGNhbGxlZCBh
ZnRlciBiZWNhdXNlIGl0IHJlbGllcyBvbiB0aGUgY2FjaGVkIGRsZyBwYXJhbXMKClNpZ25lZC1v
ZmYtYnk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVl
dCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KQWNrZWQtYnk6IEp1biBMZWkgPEp1
bi5MZWlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9od3NlcS5jIHwgNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9vcHRjLmMgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3
c2VxLmMKaW5kZXggMWZkODljYzIxOGE1Li41YmVkODk1NDc0MTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMjA2LDYg
KzEyMDYsOSBAQCBzdGF0aWMgdm9pZCBkY24yMF9wcm9ncmFtX2FsbF9waXBlX2luX3RyZWUoCiAJ
CQkJcGlwZV9jdHgtPnBpcGVfZGxnX3BhcmFtLnZ1cGRhdGVfb2Zmc2V0LAogCQkJCXBpcGVfY3R4
LT5waXBlX2RsZ19wYXJhbS52dXBkYXRlX3dpZHRoKTsKIAorCQlwaXBlX2N0eC0+c3RyZWFtX3Jl
cy50Zy0+ZnVuY3MtPnNldF92dGdfcGFyYW1zKAorCQkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRn
LCAmcGlwZV9jdHgtPnN0cmVhbS0+dGltaW5nKTsKKwogCQlkYy0+aHdzcy5ibGFua19waXhlbF9k
YXRhKGRjLCBwaXBlX2N0eCwgYmxhbmspOwogCiAJCWlmIChkYy0+aHdzcy51cGRhdGVfb2RtKQpA
QCAtMTQ0Miw2ICsxNDQ1LDkgQEAgYm9vbCBkY24yMF91cGRhdGVfYmFuZHdpZHRoKAogCQkJCQlw
aXBlX2N0eC0+cGlwZV9kbGdfcGFyYW0udnVwZGF0ZV9vZmZzZXQsCiAJCQkJCXBpcGVfY3R4LT5w
aXBlX2RsZ19wYXJhbS52dXBkYXRlX3dpZHRoKTsKIAorCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMu
dGctPmZ1bmNzLT5zZXRfdnRnX3BhcmFtcygKKwkJCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcs
ICZwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcpOworCiAJCQlkYy0+aHdzcy5ibGFua19waXhlbF9k
YXRhKGRjLCBwaXBlX2N0eCwgYmxhbmspOwogCQl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jCmluZGV4IDg3NWI0OGU0NTBmOC4uY2Vl
MWVkMTFmZmUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfb3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9vcHRjLmMKQEAgLTQzNCw2ICs0MzQsNyBAQCBzdGF0aWMgc3RydWN0IHRpbWluZ19n
ZW5lcmF0b3JfZnVuY3MgZGNuMjBfdGdfZnVuY3MgPSB7CiAJCS5nZXRfb3B0Y19zb3VyY2UgPSBv
cHRjMl9nZXRfb3B0Y19zb3VyY2UsCiAJCS5zZXRfZ3NsID0gb3B0YzJfc2V0X2dzbCwKIAkJLnNl
dF9nc2xfc291cmNlX3NlbGVjdCA9IG9wdGMyX3NldF9nc2xfc291cmNlX3NlbGVjdCwKKwkJLnNl
dF92dGdfcGFyYW1zID0gb3B0YzFfc2V0X3Z0Z19wYXJhbXMsCiB9OwogCiB2b2lkIGRjbjIwX3Rp
bWluZ19nZW5lcmF0b3JfaW5pdChzdHJ1Y3Qgb3B0YyAqb3B0YzEpCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
