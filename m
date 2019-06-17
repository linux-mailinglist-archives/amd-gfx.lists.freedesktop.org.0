Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6A49013
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863A689F0A;
	Mon, 17 Jun 2019 19:46:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955E89ECD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:51 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id i34so7009892qta.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWq5VYZOUjAqhl6fXd5ksBWVPZEOx9wi9DfmEpgWMtI=;
 b=GUz+titVHzfv/7DMbezzjOUQeOkhgFbUOSb2VZQkxjGSmqAzEAN9oHjtEncjj3YRhZ
 h2o7GbaIEx9+spx8DrNR+6jlOl/C0qpYUz3MnPQ7w6KV5Zh6294KaYtSzHZbL+yN8zoG
 RXbklSxSx7wUIbljYVP69DynLPHMbvL1sjJPum10Y+KPE3CIX2mC/RgcVZXj6M0j1y4g
 NUUqsiRMSlR7plSkn9VPhCGKVcDA+F3iXqJ61fL6O+2+0MnFuOvc5GAM+ThIFYnlg+xb
 FgW6WvZN/CvqIYxIlopbVikl/VybpKum5Xt3a8irUm6nOnSRTac+h4WutPqJYGM6Rwj3
 GidQ==
X-Gm-Message-State: APjAAAXEneemS9kuCco4iYERmqRT3RvdSU+wkY8w1Z0Y2u/GenrTRlmg
 kO/xoK0kaHP6YGyr4ZmIkaOc24db8MtNDQ==
X-Google-Smtp-Source: APXvYqwb+i7OSIFWmCFoVkFQ0RHNVawTWW4KqkPDchulyYVKpRlzywL5J/7ZGCilPICl8e+KFthX/Q==
X-Received: by 2002:a0c:8a26:: with SMTP id 35mr23090103qvt.158.1560800810776; 
 Mon, 17 Jun 2019 12:46:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 353/459] drm/amd/display: Add writeback_config to VBA vars
Date: Mon, 17 Jun 2019 14:44:54 -0500
Message-Id: <20190617194540.18497-54-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWq5VYZOUjAqhl6fXd5ksBWVPZEOx9wi9DfmEpgWMtI=;
 b=G2T8ywAGNP9Y48su/KyCOHQVT+NBvzN2Fwx7weyVLumxXY5xgv/ktFmhg1LGh/mbBo
 D74lrzOSjunB7++oeLdEy8a6uDe14IjN9rFZ/iEy9Anvvo7A7Fc+DnGtgWZZXZc/HbgQ
 UZu+WNesFuYI/XsVRlVVUl/F0KMGThoM/1EbGZLJzOetIuCNYO/mBgHtESM7FdftiBQn
 X8C8kvS2HelJ5nCrJ2aRhCJEbtZSRrOOB7krmbkxFxZw8TeWcZkYN5VpV7um6IuYoZR0
 mZLhyg9lhAS9bNGI4l9RmTvnlsSVIGMXIxk9qhED3peeznedOfN3T6LDYu2tizCoG3Dj
 Kxsw==
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKQWRkaW5nIHdyaXRl
YmFja19jb25maWcgZW51bSB0byB2YmFfdmFyc19zdCwgcmVwbGFjaW5nIG9sZCBmbGFnLgpJbml0
aWFsaXplIHRvIGRtX25vcm1hbC4KClNpZ25lZC1vZmYtYnk6IElseWEgQmFrb3VsaW4gPElseWEu
QmFrb3VsaW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1
QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCB8IDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmMg
ICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21v
ZGVfdmJhLmggICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaAppbmRleCAxMzlhODc0MGMwNzAuLjU2Nzg0NzI1
NDZhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNw
bGF5X21vZGVfc3RydWN0cy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaApAQCAtMTUyLDYgKzE1Miw3IEBAIHN0cnVjdCBfdmNz
X2RwaV9pcF9wYXJhbXNfc3QgewogCXVuc2lnbmVkIGludCB3cml0ZWJhY2tfbGluZV9idWZmZXJf
bHVtYV9idWZmZXJfc2l6ZTsKIAl1bnNpZ25lZCBpbnQgd3JpdGViYWNrX2xpbmVfYnVmZmVyX2No
cm9tYV9idWZmZXJfc2l6ZTsKICNlbmRpZgorCiAJdW5zaWduZWQgaW50IG1heF9wYWdlX3RhYmxl
X2xldmVsczsKIAl1bnNpZ25lZCBpbnQgbWF4X251bV9kcHA7CiAJdW5zaWduZWQgaW50IG1heF9u
dW1fb3RnOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9k
aXNwbGF5X21vZGVfdmJhLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rp
c3BsYXlfbW9kZV92YmEuYwppbmRleCBlNWU0YzRiYTkwMTEuLjM1NjAzMTlhNWM2ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJh
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVf
dmJhLmMKQEAgLTMwNiw3ICszMDYsNiBAQCBzdGF0aWMgdm9pZCBmZXRjaF9pcF9wYXJhbXMoc3Ry
dWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKQogCiAJbW9kZV9saWItPnZiYS5Xcml0ZWJh
Y2tJbnRlcmZhY2VCdWZmZXJTaXplID0gaXAtPndyaXRlYmFja19pbnRlcmZhY2VfYnVmZmVyX3Np
emVfa2J5dGVzOwogCW1vZGVfbGliLT52YmEuV3JpdGViYWNrTGluZUJ1ZmZlclNpemUgPSBpcC0+
d3JpdGViYWNrX2xpbmVfYnVmZmVyX2J1ZmZlcl9zaXplOwotCW1vZGVfbGliLT52YmEuV3JpdGVi
YWNrU3VwcG9ydEludGVybGVhdmVBbmRVc2luZ1dob2xlQnVmZmVyRm9yQVNpbmdsZVN0cmVhbSA9
IGZhbHNlOwogCW1vZGVfbGliLT52YmEuTWluVm9sdGFnZUxldmVsID0gMDsKIAltb2RlX2xpYi0+
dmJhLk1heFZvbHRhZ2VMZXZlbCA9IDU7CiAKQEAgLTMyMyw2ICszMjIsNyBAQCBzdGF0aWMgdm9p
ZCBmZXRjaF9pcF9wYXJhbXMoc3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKQogCW1v
ZGVfbGliLT52YmEuV3JpdGViYWNrTWluVlNDTFJhdGlvID0gaXAtPndyaXRlYmFja19taW5fdnNj
bF9yYXRpbzsKIAltb2RlX2xpYi0+dmJhLldyaXRlYmFja01heEhTQ0xUYXBzID0gaXAtPndyaXRl
YmFja19tYXhfaHNjbF90YXBzOwogCW1vZGVfbGliLT52YmEuV3JpdGViYWNrTWF4VlNDTFRhcHMg
PSBpcC0+d3JpdGViYWNrX21heF92c2NsX3RhcHM7CisJbW9kZV9saWItPnZiYS5Xcml0ZWJhY2tD
b25maWd1cmF0aW9uID0gZG1fbm9ybWFsOwogCW1vZGVfbGliLT52YmEuR1BVVk1NYXhQYWdlVGFi
bGVMZXZlbHMgPSBpcC0+Z3B1dm1fbWF4X3BhZ2VfdGFibGVfbGV2ZWxzOwogCW1vZGVfbGliLT52
YmEuSG9zdFZNTWF4Tm9uQ2FjaGVkUGFnZVRhYmxlTGV2ZWxzID0gaXAtPmhvc3R2bV9tYXhfcGFn
ZV90YWJsZV9sZXZlbHM7CiAJbW9kZV9saWItPnZiYS5Ib3N0Vk1NYXhQYWdlVGFibGVMZXZlbHMg
PSBpcC0+aG9zdHZtX21heF9wYWdlX3RhYmxlX2xldmVsczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfdmJhLmgKaW5kZXggZDQ4OGMw
NTEzMWY5Li4zOGZjMGFiMzJkN2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5oCkBAIC0yMzcsNiArMjM3LDcgQEAgc3Ry
dWN0IHZiYV92YXJzX3N0IHsKIAl1bnNpZ25lZCBpbnQgV3JpdGViYWNrSW50ZXJmYWNlTHVtYUJ1
ZmZlclNpemU7CiAJdW5zaWduZWQgaW50IFdyaXRlYmFja0ludGVyZmFjZUNocm9tYUJ1ZmZlclNp
emU7CiAJdW5zaWduZWQgaW50IFdyaXRlYmFja0Nocm9tYUxpbmVCdWZmZXJXaWR0aDsKKwllbnVt
IHdyaXRlYmFja19jb25maWcgV3JpdGViYWNrQ29uZmlndXJhdGlvbjsKIAlkb3VibGUgTWF4RENI
VUJUb1BTQ0xUaHJvdWdocHV0OwogCWRvdWJsZSBNYXhQU0NMVG9MQlRocm91Z2hwdXQ7CiAJdW5z
aWduZWQgaW50IFBURUJ1ZmZlclNpemVJblJlcXVlc3RzTHVtYTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
