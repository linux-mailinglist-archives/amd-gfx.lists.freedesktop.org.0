Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AA5101C
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974B89C49;
	Mon, 24 Jun 2019 15:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BEE8996F
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y17so10361717lfe.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHF359fmJvAKzbODlMDmKUby1StWXLBCCQB+7mvI3E8=;
 b=kOMNdlaHVownW3ISI0tQZxUvwX5I5r37uNXyBeO+781QJbXYruEoHHAZZti1seeiyp
 p8hJ7owje/GxO18wsXP5Fee47YdoJh88862+H9dXWSFPlUf1qUblNe/4/bPbb3DXGhkm
 JHvttHqf7AnQtEvv79IbIEVJFe8IfXRpjEtU80pikC17GvlqbiOKjCrThXlrNpvIE8TF
 d0Cvg3Z3dfL8Zv7+IzZXGl7777sCGZTmjkTZdaif1E5Yxnoeh7cm0B+ELq6N41kbjQxX
 4ED1EYtBvvfgCP4z9K13Sfi2NjHRkSDx1HwXQqYnAwBF5UkLEjRkkfAOENXgfCfTIdP5
 GgXQ==
X-Gm-Message-State: APjAAAWkpblcjStxhyiJmkmg6xcvXV+6FZr9nyheHlfXGr8I4MX2rEs9
 V0651RT5AQyuS/GnOhCuYmrJKnjh4Jw=
X-Google-Smtp-Source: APXvYqx83rD+T1BSezaumeMRghegH3PpEH5icVvyLRFZrkXpWMPReUDs36z7NPSgbyIiLxym41UfWQ==
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr28729645lfm.87.1561389354794; 
 Mon, 24 Jun 2019 08:15:54 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.53
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:54 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amd/amdgpu: amdgpu_hwmon_show_temp: initialize temp
Date: Mon, 24 Jun 2019 17:15:41 +0200
Message-Id: <20190624151544.13934-3-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624151544.13934-1-ernstp@gmail.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aHF359fmJvAKzbODlMDmKUby1StWXLBCCQB+7mvI3E8=;
 b=D/NXswRKoVEQToGdUvSidP/V4zmiJo6KwNnLCmnfm1VeW4KbJ7RcmN4qFrxIM6/PjG
 f0bJCFXyqbuC/JD/2IgSpMZotxLcb8PEqk6sZwBuYyubkGn6wXJC+ruVDBl9YhiJIOIA
 xdgh0bprNXOpQjRRRwWXX3i7tE+Mn2jBh5MZxq4GO5JiYIbv6AMzMXNgup/DFZ0xnoCr
 u54NKUx5tZv0nqa218ScneFChVMnWLAIeFSNkujtBx3eST6Cck3gSy/sihDsQtMAm6L5
 B5wwfjDs6AxE9b0ktzksT1/jsg+7ATuIxZwdN6pPev8xyA9fNgmuYez0Ds1wItUbGyv7
 lJvQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVwb3J0ZWQgYnkgc21hdGNoOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0u
YzoxNDk2IGFtZGdwdV9od21vbl9zaG93X3RlbXAoKSBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1i
b2wgJ3RlbXAnLgoKU2lnbmVkLW9mZi1ieTogRXJuc3QgU2rDtnN0cmFuZCA8ZXJuc3RwQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKaW5kZXggYjQ0YTM5MDA4NmY0Li42M2U2ZWVlNzYz
YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCkBAIC0xNDU5LDcgKzE0
NTksNyBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfaHdtb25fc2hvd190ZW1wKHN0cnVjdCBkZXZp
Y2UgKmRldiwKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYWRldi0+ZGRldjsKIAlpbnQgY2hhbm5l
bCA9IHRvX3NlbnNvcl9kZXZfYXR0cihhdHRyKS0+aW5kZXg7Ci0JaW50IHIsIHRlbXAsIHNpemUg
PSBzaXplb2YodGVtcCk7CisJaW50IHIsIHRlbXAgPSAwLCBzaXplID0gc2l6ZW9mKHRlbXApOwog
CiAJLyogQ2FuJ3QgZ2V0IHRlbXBlcmF0dXJlIHdoZW4gdGhlIGNhcmQgaXMgb2ZmICovCiAJaWYg
ICgoYWRldi0+ZmxhZ3MgJiBBTURfSVNfUFgpICYmCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
