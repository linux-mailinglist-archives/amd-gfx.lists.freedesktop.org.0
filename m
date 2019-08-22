Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94E99846
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 17:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1916EB75;
	Thu, 22 Aug 2019 15:36:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993F46EB75
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 15:36:56 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x4so8195585qts.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TOao/REqK8LA/2MuvdGAwEJJyJrFsEVZxcqdoIJ3Ww=;
 b=bFExe+3qWCu7u9mGCTTWNRTH7pqa3EDuU1jVXyMUFOhJkQV3cr/w0oOfUfaPTR/05p
 GOALZBKs8JJ8qyfGTchKEDawnIMtCdSEReBJoREV1k8lqzcOX0QhxEP/6Yl7zmbfS5mm
 VPTIR/E7m/Jm/2b5L3Mw+R0m+KMNScGOXTyvOom67TrEOJ7C+ThFUfvzyhpoIUKnFtM2
 SaQ46B76+GiorS6G6/peaQorougjpM4lisA4TzE6LXul0ez9KwwAHdfhKRG3CkvSPFMm
 1n0pRinQ7fPDzaLLWsqTAZVJ3TNlt9pzrLaG/YlNnXOwkyI858lEXXkgG/18/nv89T/t
 BUGQ==
X-Gm-Message-State: APjAAAX+W43bG1Gghpy6W98ohCEte8YDqMSWwwI51GY7QlaPZiJkCReg
 ovQh+jrqZyMwoc/WH5TS2zGwH+7P
X-Google-Smtp-Source: APXvYqzaB2DmU/WhvrHllYR8COaxUTdlgGvBrsHY1fGMHgYOTVZxt2Ct937dBSC2ieQZIPcs4Yq5kg==
X-Received: by 2002:a0c:8809:: with SMTP id 9mr22180635qvl.141.1566488215364; 
 Thu, 22 Aug 2019 08:36:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id x3sm7958qkl.71.2019.08.22.08.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 08:36:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amd/display: update bw_calcs to take pipe sync into
 account (v2)
Date: Thu, 22 Aug 2019 10:36:45 -0500
Message-Id: <20190822153645.3296-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822153645.3296-1-alexander.deucher@amd.com>
References: <20190822153645.3296-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TOao/REqK8LA/2MuvdGAwEJJyJrFsEVZxcqdoIJ3Ww=;
 b=YE/8V6/LgTkPE99J1HD14TuA6lj/mRzAZAY8vLOkuNnSpMzz9a3iAEUJyBhNsM5DCF
 WrqXS7U7KCsr39tiAMYvsnbAAQG6vaEVGxyWAtoSxDicOdFQMaVJmBXQfnZ4UrDTfBsY
 cawrtnfjCozmqCdTmIWuyf+6BjZWjMQrLx5J39sAmwH3s7QO1HxFfouGZ9WtNYocKgX9
 R+ybNxXu0jRRHg2ASfJ3L1LYGEDFYr05dGPyINx2HcPfhG5Pm0aV7s7zOfUZnutsVfho
 WLTN3sKvK35QSDm5en8hHqA9DSG6dmpcZwALHD+E3wFB1ZekQqcvG/u8i0HD2iopT+Ps
 6koQ==
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

UHJvcGVybHkgc2V0IGFsbF9kaXNwbGF5c19pbl9zeW5jIHNvIHRoYXQgd2hlbiB0aGUgZGF0YSBp
cwpwcm9wYWdhdGVkIHRvIHBvd2VycGxheSwgaXQncyBzZXQgcHJvcGVybHkgYW5kIHdlIGNhbiBl
bmFibGUKbWNsayBzd2l0Y2hpbmcgd2hlbiBhbGwgbW9uaXRvcnMgYXJlIGluIHN5bmMuCgp2Mjog
Zml4IGxvZ2ljLCBjbGVhbiB1cAoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNz
L2RjZV9jYWxjcy5jICB8IDQ5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwppbmRleCA5ZjEyZTIxZjhiOWIuLjhkOTA0
NjQ3ZmIwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNz
L2RjZV9jYWxjcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9k
Y2VfY2FsY3MuYwpAQCAtMjUsNiArMjUsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgog
CisjaW5jbHVkZSAicmVzb3VyY2UuaCIKICNpbmNsdWRlICJkbV9zZXJ2aWNlcy5oIgogI2luY2x1
ZGUgImRjZV9jYWxjcy5oIgogI2luY2x1ZGUgImRjLmgiCkBAIC0yOTc3LDYgKzI5NzgsNTAgQEAg
c3RhdGljIHZvaWQgcG9wdWxhdGVfaW5pdGlhbF9kYXRhKAogCWRhdGEtPm51bWJlcl9vZl9kaXNw
bGF5cyA9IG51bV9kaXNwbGF5czsKIH0KIAorc3RhdGljIGJvb2wgYWxsX2Rpc3BsYXlzX2luX3N5
bmMoY29uc3Qgc3RydWN0IHBpcGVfY3R4IHBpcGVbXSwKKwkJCQkgaW50IHBpcGVfY291bnQsCisJ
CQkJIHVpbnQzMl90IG51bWJlcl9vZl9kaXNwbGF5cykKK3sKKwljb25zdCBzdHJ1Y3QgcGlwZV9j
dHggKnVuc3luY2VkX3BpcGVzW01BWF9QSVBFU10gPSB7IE5VTEwgfTsKKwlpbnQgZ3JvdXBfc2l6
ZSA9IDE7CisJaW50IGksIGo7CisKKwlmb3IgKGkgPSAwOyBpIDwgcGlwZV9jb3VudDsgaSsrKSB7
CisJCWlmICghcGlwZVtpXS5zdHJlYW0pCisJCQljb250aW51ZTsKKworCQl1bnN5bmNlZF9waXBl
c1tpXSA9ICZwaXBlW2ldOworCX0KKworCWZvciAoaSA9IDA7IGkgPCBwaXBlX2NvdW50OyBpKysp
IHsKKwkJY29uc3Qgc3RydWN0IHBpcGVfY3R4ICpwaXBlX3NldFtNQVhfUElQRVNdOworCisJCWlm
ICghdW5zeW5jZWRfcGlwZXNbaV0pCisJCQljb250aW51ZTsKKworCQlwaXBlX3NldFswXSA9IHVu
c3luY2VkX3BpcGVzW2ldOworCQl1bnN5bmNlZF9waXBlc1tpXSA9IE5VTEw7CisKKwkJLyogQWRk
IHRnIHRvIHRoZSBzZXQsIHNlYXJjaCByZXN0IG9mIHRoZSB0ZydzIGZvciBvbmVzIHdpdGgKKwkJ
ICogc2FtZSB0aW1pbmcsIGFkZCBhbGwgdGdzIHdpdGggc2FtZSB0aW1pbmcgdG8gdGhlIGdyb3Vw
CisJCSAqLworCQlmb3IgKGogPSBpICsgMTsgaiA8IHBpcGVfY291bnQ7IGorKykgeworCQkJaWYg
KCF1bnN5bmNlZF9waXBlc1tqXSkKKwkJCQljb250aW51ZTsKKworCQkJaWYgKHJlc291cmNlX2Fy
ZV9zdHJlYW1zX3RpbWluZ19zeW5jaHJvbml6YWJsZSgKKwkJCQkJdW5zeW5jZWRfcGlwZXNbal0t
PnN0cmVhbSwKKwkJCQkJcGlwZV9zZXRbMF0tPnN0cmVhbSkpIHsKKwkJCQlwaXBlX3NldFtncm91
cF9zaXplXSA9IHVuc3luY2VkX3BpcGVzW2pdOworCQkJCXVuc3luY2VkX3BpcGVzW2pdID0gTlVM
TDsKKwkJCQlncm91cF9zaXplKys7CisJCQl9CisJCX0KKwl9CisKKwlyZXR1cm4gKGdyb3VwX3Np
emUgPT0gbnVtYmVyX29mX2Rpc3BsYXlzKSA/IHRydWUgOiBmYWxzZTsKK30KKwogLyoqCiAgKiBS
ZXR1cm46CiAgKgl0cnVlIC0JRGlzcGxheShzKSBjb25maWd1cmF0aW9uIHN1cHBvcnRlZC4KQEAg
LTI5OTgsOCArMzA0Myw4IEBAIGJvb2wgYndfY2FsY3Moc3RydWN0IGRjX2NvbnRleHQgKmN0eCwK
IAogCXBvcHVsYXRlX2luaXRpYWxfZGF0YShwaXBlLCBwaXBlX2NvdW50LCBkYXRhKTsKIAotCS8q
VE9ETzogdGhpcyBzaG91bGQgYmUgdGFrZW4gb3V0IGNhbGNzIG91dHB1dCBhbmQgYXNzaWduZWQg
ZHVyaW5nIHRpbWluZyBzeW5jIGZvciBwcGxpYiB1c2UqLwotCWNhbGNzX291dHB1dC0+YWxsX2Rp
c3BsYXlzX2luX3N5bmMgPSBmYWxzZTsKKwljYWxjc19vdXRwdXQtPmFsbF9kaXNwbGF5c19pbl9z
eW5jID0gYWxsX2Rpc3BsYXlzX2luX3N5bmMocGlwZSwgcGlwZV9jb3VudCwKKwkJCQkJCQkJICBk
YXRhLT5udW1iZXJfb2ZfZGlzcGxheXMpOwogCiAJaWYgKGRhdGEtPm51bWJlcl9vZl9kaXNwbGF5
cyAhPSAwKSB7CiAJCXVpbnQ4X3QgeWNsa19sdmwsIHNjbGtfbHZsOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
