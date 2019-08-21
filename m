Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3518998720
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3716EA1D;
	Wed, 21 Aug 2019 22:24:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DFD6E9AF
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t12so5090217qtp.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHzY2vcNZuZsrAkYXIcG1APwZJfF+iKNYTYEongzM5s=;
 b=GXEcH62Wp4SUt3JKYiOrWDx/LYivkbzZ7g0mfp75YIDTJ3oKmr50osMgwq3TiwHpsK
 8huGgAlQzR0Wtxs74WN4warPZq/3f91bI0SOQr60PabxQpzcas1Ooo8abPjylLDHYlhb
 l7SZJqLXIckQ3wjqnnZNh2fgSk28XcYR13CntUIbFwrP+JDrYZEKGz/FZ9wkKh+bAATR
 emIGTUjrOJ7Q4LrXkXf/lO9bPcFbW6sQbmySwyGWwKk0DPM40905moaAhyRWTD0UfTDL
 KPFCAxCm6Hrz836fAfWoY3P1Qdm1grUWSVCO9a4w9CyQCDh6n2gsGzUNoO3EU4UVV70R
 xpUg==
X-Gm-Message-State: APjAAAVtc+TIdaF5pkTmGw6AZ1LReiD8wH1RysssAgYbe3EPGeIUU5nh
 fL4m79eojjF5pfxqaj89osS86VjD
X-Google-Smtp-Source: APXvYqyhrzN1jP1ZzzqA4msgtRgaeUApLZnabHSDyZ5LClyFOawH1w2ETr8E2NhwEcEcOZhAkXXoIA==
X-Received: by 2002:a0c:c93c:: with SMTP id r57mr18895409qvj.226.1566426259299; 
 Wed, 21 Aug 2019 15:24:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/37] drm/amd/powerplay: powerup sdma/vcn for all apu series
Date: Wed, 21 Aug 2019 17:23:31 -0500
Message-Id: <20190821222359.13578-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHzY2vcNZuZsrAkYXIcG1APwZJfF+iKNYTYEongzM5s=;
 b=eK0QsBOHwWhVKyP9+o4c+jQSaRrcrLEkDc3LfLJ4rRmuXe8PpXr+9aLgmttNEnNsqn
 BuD+KTOmeLoMOi/Ih6qsg6WJ1bf7TrfPGtsMca3V0RvMejzW35tyI0tM4rvl8z6x+kf3
 aV2mYB/f7ayyxvzomYYMDCsEP2MMoRv5QComIorHNiACiFtMD4cX9wx1vUhwYRw/belc
 kK/THdInVHc3nqf6udlLV+7q5a4K/eXSLbwuarWX/EK2pGba3QkHiVh76HwtI74t+lW4
 kwg9uapPvvJZEvGBvk+r3uOcAHONW3l5Ki7Zty8hGzEUk39SPM2cnCW42e1KQm9FmZpC
 oYNg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkFsbCBhcHUgc2VyaWVzIG5lZWQg
cG93ZXJ1cCBzZG1hIGFuZCB2Y24gdmlhIHNtdSBtZXNzYWdlcy4KClNpZ25lZC1vZmYtYnk6IEh1
YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCAw
MjI1MDdlYWNmMWEuLjg1ZjUyNDAxZDVhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYwpAQCAtMTI2OCw3ICsxMjY4LDcgQEAgc3RhdGljIGludCBzbXVfaHdf
aW5pdCh2b2lkICpoYW5kbGUpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JaWYgKGFkZXYtPmFzaWNf
dHlwZSA9PSBDSElQX1JFTk9JUikgeworCWlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpIHsK
IAkJc211X3Bvd2VyZ2F0ZV9zZG1hKCZhZGV2LT5zbXUsIGZhbHNlKTsKIAkJc211X3Bvd2VyZ2F0
ZV92Y24oJmFkZXYtPnNtdSwgZmFsc2UpOwogCX0KQEAgLTEzMjQsNyArMTMyNCw3IEBAIHN0YXRp
YyBpbnQgc211X2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogCXN0cnVjdCBzbXVfdGFibGVfY29udGV4
dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKIAlpbnQgcmV0ID0gMDsKIAotCWlm
IChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIpIHsKKwlpZiAoYWRldi0+ZmxhZ3MgJiBB
TURfSVNfQVBVKSB7CiAJCXNtdV9wb3dlcmdhdGVfc2RtYSgmYWRldi0+c211LCB0cnVlKTsKIAkJ
c211X3Bvd2VyZ2F0ZV92Y24oJmFkZXYtPnNtdSwgdHJ1ZSk7CiAJfQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
