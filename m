Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11048F41
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F85D89BB0;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75AE89B9F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a15so12223041qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emsRevUBt8kbP626T4mgbrxCPgoyWmat4SIBKCrI/3Q=;
 b=FbQblcw3Qv4u9spVBcaUEsUpZIDnY8sMupS7OfsQoTCNqYSVVyRr2boC1BLpDSTL3R
 mcLNOOGOJ5VqgCXIHGUPdgUhwlzfHbngUHXiJEWLS2GL3NW+uFOnlRTzcLk+IV9k6SC2
 Jpx/RzF3irnDPQVRz6HjPV2idIdmLC/h3gh5f4p2rfME0W+7G/VaslSWFsfClq8BKzRn
 agvRNC4fURnr657Kh987y9roZvBu/mFJf6QzoZwD/IecQfmtllXsVk5hdtP0W5sb4E0S
 caQdLrLPe5VldlpaXPLpprGwGJirI7+kts3WQdqi/mYOHusvJtuO/xvdccicQn9IIxdh
 CoFw==
X-Gm-Message-State: APjAAAWtzkXhjGYpShSezXrwWdrSQxkbqyEnWAvWbSxJLFZAi0YPr5i+
 xh9v97yhX24LDGMcmVBpyG73oiv5BCg=
X-Google-Smtp-Source: APXvYqwVRCzRoicPjCH7Hy7F5aE2I8Y12Mxq7l6KeDX8+WQuXAdjpDgidhmLRs/Jry/Q3EEsftiJrg==
X-Received: by 2002:ac8:2495:: with SMTP id s21mr3473144qts.248.1560799883813; 
 Mon, 17 Jun 2019 12:31:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 211/459] drm/amdgpu/mes10.1: upload mes ucode to gpu buffer
Date: Mon, 17 Jun 2019 14:29:38 -0500
Message-Id: <20190617193106.18231-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emsRevUBt8kbP626T4mgbrxCPgoyWmat4SIBKCrI/3Q=;
 b=lSE7GbKmCAgGD1TeNN9K4v3Bo0dZ0L/hkezDbpCoY/rjeMJZWdEFnk5nvh1AsJvpmC
 CEKbBHZsQx18Ay9oDKyhrDlilDTA8vdoLyvKctbc+hPSuUIGp6CxJF9vSQ2/6UGE4Jbk
 5M4LzTeul64B3CSUrRc01qAJ3YN6bCKDC52RQuKnxGrQpiXuu8Q+CEdfUE/2dt/5EhPD
 ecz2QjpY644Uh02n6Uf9y2TdWC0vNo7l4pIB2tcgjrfs67Zkdk9a1bsQP9dcsbHxd6Fq
 0bn62BIv78j2rT9+WumgMRJ1rEGD+wzLK+3pJ/S2d/Qm5Mw6v8cDqG/U8tHdHF3fIkQs
 16Eg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFsbG9jYXRlIEdQVSBidWZmZXIg
YW5kIHVwbG9hZCB1Y29kZSBmaXJtd2FyZSB0byB0aGUgYnVmZmVyLgoKU2lnbmVkLW9mZi1ieTog
SmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21l
c192MTBfMS5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbWVzX3YxMF8xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYwpp
bmRleCBlNTM4MTliOTk0NDIuLmExOWIyNjE2ZDQ0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbWVzX3YxMF8xLmMKQEAgLTIxLDcgKzIxLDkgQEAKICAqCiAgKi8KIAorI2luY2x1ZGUgPGxp
bnV4L2Zpcm13YXJlLmg+CiAjaW5jbHVkZSAiYW1kZ3B1LmgiCisjaW5jbHVkZSAic29jMTVfY29t
bW9uLmgiCiAKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9tZXMuYmluIik7CiAKQEAg
LTEwMyw2ICsxMDUsMzggQEAgc3RhdGljIHZvaWQgbWVzX3YxMF8xX2ZyZWVfbWljcm9jb2RlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFkZXYtPm1lcy5mdyA9IE5VTEw7CiB9CiAKK3N0
YXRpYyBpbnQgbWVzX3YxMF8xX2FsbG9jYXRlX3Vjb2RlX2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKK3sKKwlpbnQgcjsKKwljb25zdCBzdHJ1Y3QgbWVzX2Zpcm13YXJlX2hlYWRl
cl92MV8wICptZXNfaGRyOworCWNvbnN0IF9fbGUzMiAqZndfZGF0YTsKKwl1bnNpZ25lZCBmd19z
aXplOworCisJbWVzX2hkciA9IChjb25zdCBzdHJ1Y3QgbWVzX2Zpcm13YXJlX2hlYWRlcl92MV8w
ICopCisJCWFkZXYtPm1lcy5mdy0+ZGF0YTsKKworCWZ3X2RhdGEgPSAoY29uc3QgX19sZTMyICop
KGFkZXYtPm1lcy5mdy0+ZGF0YSArCisJCSAgIGxlMzJfdG9fY3B1KG1lc19oZHItPm1lc191Y29k
ZV9vZmZzZXRfYnl0ZXMpKTsKKwlmd19zaXplID0gbGUzMl90b19jcHUobWVzX2hkci0+bWVzX3Vj
b2RlX3NpemVfYnl0ZXMpOworCisJciA9IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoYWRldiwg
Zndfc2l6ZSwKKwkJCQkgICAgICBQQUdFX1NJWkUsIEFNREdQVV9HRU1fRE9NQUlOX0dUVCwKKwkJ
CQkgICAgICAmYWRldi0+bWVzLnVjb2RlX2Z3X29iaiwKKwkJCQkgICAgICAmYWRldi0+bWVzLnVj
b2RlX2Z3X2dwdV9hZGRyLAorCQkJCSAgICAgICh2b2lkICoqKSZhZGV2LT5tZXMudWNvZGVfZndf
cHRyKTsKKwlpZiAocikgeworCQlkZXZfZXJyKGFkZXYtPmRldiwgIiglZCkgZmFpbGVkIHRvIGNy
ZWF0ZSBtZXMgZncgYm9cbiIsIHIpOworCQlyZXR1cm4gcjsKKwl9CisKKwltZW1jcHkoYWRldi0+
bWVzLnVjb2RlX2Z3X3B0ciwgZndfZGF0YSwgZndfc2l6ZSk7CisKKwlhbWRncHVfYm9fa3VubWFw
KGFkZXYtPm1lcy51Y29kZV9md19vYmopOworCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+bWVz
LnVjb2RlX2Z3X29iaik7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBtZXNfdjEwXzFf
c3dfaW5pdCh2b2lkICpoYW5kbGUpCiB7CiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
