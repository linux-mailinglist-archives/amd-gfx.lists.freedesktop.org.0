Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400AE7CB41
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F16E2A8;
	Wed, 31 Jul 2019 17:59:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1C96E2B2
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:51 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y16so46774637vsc.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sMalXr8xqikWdoDxi/zjT6OT3lX0/IpncqOFUEQ53AI=;
 b=d5qbmVnvO2ecb2Xny/XD0MFsHIWc9ylWtrvZ5rapqZIcNRs0DrR76wYrqbmr5G9qZQ
 VA3lqma7fvVQaghaPS0kLzfwWUmKqrghQtBUZA2N2YQm3YlNC84PgmpTUxapanCJsnZS
 khoIDpTA6cVwfdHqmUOF0VesAqpEIKIp3opnuxBtpQs5KLqvIKWX7FkaY0ZzIjFjwjzJ
 mg/6L3H1dmwIwufeXwcGc9Jpey2NIVumq1l5R+zjbdqyL+zqsn+56OTYaRQaRd5Ols52
 UcaU0s+YidboIlpcqjSGhywungUKVivrY0t5+bliMp7HPNQXyrhxkCqp7ehGa4dB9pY2
 KGDQ==
X-Gm-Message-State: APjAAAXWuJVDdsTTEgEfRyl6FXRtrGICv0UsVSNElB2SrPcgnTlVrjEi
 s7v6NRpHX57DbcrJpnfA+aTLk1fa
X-Google-Smtp-Source: APXvYqzJ4N2caXkQx7meeqe5pZeNgZdT0oRAFBr5rW9+KzvR7eGIia9UwIVrUlktWdWDUT37M2H2VA==
X-Received: by 2002:a67:e3da:: with SMTP id k26mr80143241vsm.131.1564595929960; 
 Wed, 31 Jul 2019 10:58:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/26] drm/amd/include: add define of TCP_EDC_CNT_NEW
Date: Wed, 31 Jul 2019 12:58:14 -0500
Message-Id: <20190731175818.20159-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sMalXr8xqikWdoDxi/zjT6OT3lX0/IpncqOFUEQ53AI=;
 b=uqd/E7EIgovmA4B7M16d2EncacdUksbE6T3z64ABXzu2teYBCstvlSEOwCA82M9/PG
 6LUbIHmz5rq44Jy9HCzn8EjNGU5+SKqGjKebr7WCZeghl2xvFl8JVVS2Y+AQ4ginZjXO
 VHzKUxOCHFVT5YTQPcCWmg2Zr8R7ekyCYBlRUBvdeINapDvoByHO6zO60O6EmdtSdzB0
 LDC2R4pyEiYgqHnqk638CACXgk2syO0n8pa8fDZf+Z1V1yean9eDz/iRgwywd3SSd6yF
 iyD+0q1VQ8HBrDx++AwyFEdNfGUgfn2zBIwi3OeCTYZaBQxZEFOMgX8a2/ws6xhNtQ/V
 YCdQ==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNvbT4KCkNoYW5nZS1JZDogSWVkZDRiYWMy
MTg3ZTNiODAwNjYyNDg1ZDQ2MjNhY2UyNDZhZjNmMzYKU2lnbmVkLW9mZi1ieTogRGVubmlzIExp
IDxEZW5uaXMuTGlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZ2MvZ2NfOV8wX29mZnNl
dC5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9nYy9nY185XzBfb2Zmc2V0Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZ2MvZ2NfOV8wX29mZnNldC5o
CmluZGV4IGYxZDA0OGUwZWQyYy4uY2ExNmQ5MTI1ZmJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvZ2MvZ2NfOV8wX29mZnNldC5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9nYy9nY185XzBfb2Zmc2V0LmgKQEAgLTE3
MDAsNiArMTcwMCw4IEBACiAjZGVmaW5lIG1tVENQX0JVRkZFUl9BRERSX0hBU0hfQ05UTF9CQVNF
X0lEWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMAogI2RlZmluZSBtbVRDUF9FRENfQ05UICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4
MGIxNwogI2RlZmluZSBtbVRDUF9FRENfQ05UX0JBU0VfSURYICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAKKyNk
ZWZpbmUgbW1UQ1BfRURDX0NOVF9ORVcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDBiMTgKKyNkZWZp
bmUgbW1UQ1BfRURDX0NOVF9ORVdfQkFTRV9JRFggICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwCiAjZGVmaW5lIG1tVENf
Q0ZHX0wxX0xPQURfUE9MSUNZMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwYjFhCiAjZGVmaW5lIG1tVENfQ0ZH
X0wxX0xPQURfUE9MSUNZMF9CQVNFX0lEWCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMAogI2RlZmluZSBtbVRDX0NGR19MMV9MT0FE
X1BPTElDWTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MGIxYgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
