Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEF4B311
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EFE6E314;
	Wed, 19 Jun 2019 07:27:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02386E1D8
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 14:45:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 131so13439108ljf.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 07:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5zatKyoCE9WfVkyezv5ugdN4li8lJYFcFpYQw3eySI=;
 b=kzel/FYOBqEqdy8QBp1NLpV5K2bxXAJ83LlPJMrIZ0QeRwOLHUeQTJlgUzPTWLJq5O
 8n45EDT2t8fgUaKAFsrhF0korUGUxtUqAonjCDkR6QlBxCFh5fsX42zptC2Ef1aEfY2u
 9LvcWtEbOoAYIDtSS0cJsWXrO/dXZCGkH+X6txCq1PQuqo/ahNVHYIOfwHPhIr1skih0
 inarSFNYsWDhQ7QN1yun585oU3fFnamVdAQKUuFj3x+Wyge/h1YQScxQNYwOxbGPOIgl
 pSDl/dd+ZeePlnJ1LXS8q04SS7uamS5TDIMQ6uTXs0ewRVFWkr/C/MURaYfVCxLxyc71
 Ctyw==
X-Gm-Message-State: APjAAAXXspxF2zdhaQjFVe+9O/v1kG2e5GSntxU302bceh4xTTr6WI3X
 Hnpuopm45H9I1yRm6BPlz6e7m2wPswA=
X-Google-Smtp-Source: APXvYqzeMOMMhLulCSY8BzS7lz+rPIS0LWLWwDWxJ2zagzlJv0JliszTtrCykepBHI7zQYqiPe52mw==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr39845990ljj.162.1560869145845; 
 Tue, 18 Jun 2019 07:45:45 -0700 (PDT)
Received: from linux-cgf4.suse (pool-109-191-22-145.is74.ru. [109.191.22.145])
 by smtp.gmail.com with ESMTPSA id
 p5sm2644056ljb.91.2019.06.18.07.45.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 07:45:45 -0700 (PDT)
From: Sergei Lopatin <magist3r@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: force the trim of the mclk dpm_levels if
 OD is enabled
Date: Tue, 18 Jun 2019 19:44:46 +0500
Message-Id: <20190618144446.21032-1-magist3r@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:27:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5zatKyoCE9WfVkyezv5ugdN4li8lJYFcFpYQw3eySI=;
 b=e/BcLO/4WnZ96RdEljA/rzqz6gV75t5fLPx34Ciyw0TXaLyYMUTIGWwJ1Hwa8BbDBG
 3+s6Wp4Z87ONHXcMyaD8/O41yDfKW//ttgLGaF3dxNltKD3k45QYf0QoUl+iBS5wX+CF
 U6F/0tqkMi5ZryF83lJjExGFHphTlLWTvuVLkjs3hEQ0jsEYsDcRjmo/mWRuFqcPpmOD
 +bhP5S+nwyBKja2PfyJ3KWUqaRvLOkrPS+myiiw5smnp9hvrCXJcWL6Xlfr0UKOgsxqi
 MfdRMiD7b9xANnXArFOaMaWJXbhW1B/4U7yB/NWcwjoxewiNGxcI+Ikg1goHKWX/gIfn
 dmKA==
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
Cc: Evan Quan <evan.quan@amd.com>, Sergei Lopatin <magist3r@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2hvdWxkIHByZXZlbnQgZmxpY2tlciBpZiBQUF9PVkVSRFJJVkVfTUFTSyBpcyBzZXQuCgpidWc6
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjY0NgpidWc6
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwODk0MQoKU2ln
bmVkLW9mZi1ieTogU2VyZ2VpIExvcGF0aW4gPG1hZ2lzdDNyQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgfCA1ICsrKystCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCmluZGV4IDE2NTkx
YmU4YjBjYS4uZjVkZWRiN2FkNDhkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3Ivc211N19od21nci5jCkBAIC0zNzkwLDkgKzM3OTAsMTIgQEAgc3RhdGljIGlu
dCBzbXU3X3RyaW1fc2luZ2xlX2RwbV9zdGF0ZXMoc3RydWN0IHBwX2h3bWdyICpod21nciwKIHsK
IAl1aW50MzJfdCBpOwogCisJLyogZm9yY2UgdGhlIHRyaW0gaWYgbWNsa19zd2l0Y2hpbmcgaXMg
ZGlzYWJsZWQgdG8gcHJldmVudCBmbGlja2VyICovCisJYm9vbCBmb3JjZV90cmltID0gKGxvd19s
aW1pdCA9PSBoaWdoX2xpbWl0KTsKIAlmb3IgKGkgPSAwOyBpIDwgZHBtX3RhYmxlLT5jb3VudDsg
aSsrKSB7CiAJLypza2lwIHRoZSB0cmltIGlmIG9kIGlzIGVuYWJsZWQqLwotCQlpZiAoIWh3bWdy
LT5vZF9lbmFibGVkICYmIChkcG1fdGFibGUtPmRwbV9sZXZlbHNbaV0udmFsdWUgPCBsb3dfbGlt
aXQKKwkJaWYgKCghaHdtZ3ItPm9kX2VuYWJsZWQgfHwgZm9yY2VfdHJpbSkKKwkJCSYmIChkcG1f
dGFibGUtPmRwbV9sZXZlbHNbaV0udmFsdWUgPCBsb3dfbGltaXQKIAkJCXx8IGRwbV90YWJsZS0+
ZHBtX2xldmVsc1tpXS52YWx1ZSA+IGhpZ2hfbGltaXQpKQogCQkJZHBtX3RhYmxlLT5kcG1fbGV2
ZWxzW2ldLmVuYWJsZWQgPSBmYWxzZTsKIAkJZWxzZQotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
