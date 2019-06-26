Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0356B4F
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 15:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6B6E444;
	Wed, 26 Jun 2019 13:53:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3688D6E348
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 09:57:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t28so1517331lje.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 02:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5zatKyoCE9WfVkyezv5ugdN4li8lJYFcFpYQw3eySI=;
 b=jFBuQZYEmAcnCstRK9xMt4T17hjzll3dE5U1a0oNmptYtz+/E68kALKZPA7RxK87Mw
 WnvinAxr/PUQO9OnKXk9HCzR9XwiuBYcLPP650Vlneg7SpKseEtfHADptC77JTPbmQbC
 F+30kV7rXPbeFkgQyTtst69fyaoFSncai2N8/O/+yLKcOKvUuaDh9n7dAF9kuohL6niL
 14XBFw6WSZmdwm0It5oSGAS2b6Vj5/2J8VR/chH3JtzAuU+NFsCCo5k4+7m5zoQ70JTj
 jBNA4pMcYrxRIvpCIjd2vEnUoM75gzD6ZJsP5S8/OA51E4gCB0auf8TkV79lHsZYsIH9
 LBlw==
X-Gm-Message-State: APjAAAXaPmmMy9FlBsyQApcIiejeVxmeail4iMFAcwGe6Zv5e/UMrivX
 e0FlTQ7sqnZ2gKjtgoVdJ2tk6pd8
X-Google-Smtp-Source: APXvYqwleCyWXd+1Xtp/MXvx+0kfUJB/NxtrT9TE9ewVhSAcIylbrPaKzshF/qyCHd+Av8L3rqS3sw==
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr2421626ljj.156.1561543029369; 
 Wed, 26 Jun 2019 02:57:09 -0700 (PDT)
Received: from linux-cgf4.suse (pool-109-191-22-145.is74.ru. [109.191.22.145])
 by smtp.gmail.com with ESMTPSA id
 e8sm2730876lfc.27.2019.06.26.02.57.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 02:57:08 -0700 (PDT)
From: Sergei Lopatin <magist3r@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: force the trim of the mclk dpm_levels if
 OD is enabled
Date: Wed, 26 Jun 2019 14:56:59 +0500
Message-Id: <20190626095659.6081-1-magist3r@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 13:53:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y5zatKyoCE9WfVkyezv5ugdN4li8lJYFcFpYQw3eySI=;
 b=sKabdGfCSSy4BC+Zu4+V/kxuR+rvvXPbh3klH0Or7OJEJEtFsKbtQ0GStAw4mUH7Rh
 zCyZZx4LHELn0KhG+uC+fb84aqNDabAXHNTDe9AQCUS6N095UvGb/s9sSPY5inZ/zHQk
 x2GKQXI1jPLVMwOBufzjvOk8f2pgvbY7x++w0nZRegPKOpQ9coVFPmAVVnhpctO1l0OH
 qpgNrK7LHwDbdUEL0UlZOYXkh7T8JQ/yXFYtG7BGTZvrwYXWbiZZYs76LR9wa5ozh9iA
 kOcVW3tVVc6zXSndFrgyQfWjk6b3PHYg1LLc3r4vKCoz/wolFHuEvtq+3UyUYA6AykJf
 oHzg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Sergei Lopatin <magist3r@gmail.com>
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
