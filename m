Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39587E8E
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A06EE37;
	Fri,  9 Aug 2019 15:53:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950816EE33
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so27114829qtq.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkThh11xA0WkQ8IKFyn+X6Xp9y3TIncor7w3VrmFX0g=;
 b=tDSnVi3lmLcxXF5XTMdOynPQllyXNmer1de4dcaGHm9cfro9/i0i0gW+NzL+NXLwFd
 nUZ5R6nwFuI+rspoiNoSO5BAkft1939BCDOLi0J1WN8neu3wXD3y65nqrZI2z3AFRFBs
 ZvczqZe7FO+7yHn4mWNruuFx13vP4HDI6UJxntpCews7s0f9OUuS1uwW8cmssq6JSOqg
 XnficJMPXxJO3aM6M9dF36xACxY47ReJOOkguxpHI9+UhtGO8zMfY7fJOI450hlnJJ3V
 4jcTzdeI7akjB6dF+L172hPnaFNwxGVZ7s40C4Z5lAKZ9IOXw4Itn4dFdzd/IjSNSav+
 dYJA==
X-Gm-Message-State: APjAAAVmFlA4L1lNqSunGnPF0koX139BS1B4lvoMd5tn2XL3vryHGGU7
 azFDHm9s2MSMXCoiDgC1FrGw8hqk
X-Google-Smtp-Source: APXvYqw8EsvIdK9AsQipNsaQx+wvQziXMxJLUT34LUJOX+wm2pCjfVGXLBeB7HApmZ/WIfWDUVaisQ==
X-Received: by 2002:a0c:dd86:: with SMTP id v6mr18836059qvk.176.1565365991504; 
 Fri, 09 Aug 2019 08:53:11 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/27] drm/amdgpu: add renoir asic_type enum
Date: Fri,  9 Aug 2019 10:52:37 -0500
Message-Id: <20190809155302.4733-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkThh11xA0WkQ8IKFyn+X6Xp9y3TIncor7w3VrmFX0g=;
 b=AQE7iUMNcjW4jqhWEHdO51gBaM485HqxifjfQO37l0Ql8d7u68iWOqEBkdv9n2tMry
 DTQlfGn4Ivja5qRGhHw1lfEgd0puqNDjcQusK+rSp4f2EQLTh+/859n9EQh3zljsLaj1
 ZQG+V8j1XuVYtgQPB72Ca3jw0qJeo/x+/zSJctqXzhL9rhPQly/vCkEhWhd2tYKQl7oB
 YIxgMRe5uWmQD0DNedPCmYEh07IkLw57ZXWRwazulGI5d6SD0xC1gIL6iziELvucUj61
 Oi0DvUzjCZ23s+i5BtF992Jqe8opJHztSf6S8S6hfr9fTvDrTrzHqqoeqt+ZlaqVXFhf
 ELGw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggYWRkcyByZW5v
aXIgdG8gYW1kX2FzaWNfdHlwZSBlbnVtIGFuZCBhbWRncHVfYXNpY19uYW1lW10uCgpTaWduZWQt
b2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSArCiBpbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmgg
ICAgICAgICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDdlYjllMGI5
MjM1YS4uYTM3YjViZTU2OWMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCkBAIC0xMDEsNiArMTAxLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmFtZGdwdV9h
c2ljX25hbWVbXSA9IHsKIAkiVkVHQTIwIiwKIAkiUkFWRU4iLAogCSJBUkNUVVJVUyIsCisJIlJF
Tk9JUiIsCiAJIk5BVkkxMCIsCiAJIk5BVkkxNCIsCiAJIk5BVkkxMiIsCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmggYi9pbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmgK
aW5kZXggNzM3YTFlMzc0ZjBjLi4yOTZhYWI3MjQ2NzcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2FtZF9hc2ljX3R5cGUuaAorKysgYi9pbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmgKQEAgLTUw
LDYgKzUwLDcgQEAgZW51bSBhbWRfYXNpY190eXBlIHsKIAlDSElQX1ZFR0EyMCwKIAlDSElQX1JB
VkVOLAogCUNISVBfQVJDVFVSVVMsCisJQ0hJUF9SRU5PSVIsCiAJQ0hJUF9OQVZJMTAsCiAJQ0hJ
UF9OQVZJMTQsCiAJQ0hJUF9OQVZJMTIsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
