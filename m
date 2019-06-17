Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDF4902F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A34A89FF9;
	Mon, 17 Jun 2019 19:47:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3BE89F82
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:12 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12293593qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9h4FtdTgXpfyrT+tmxsAgLKBiR/3wXNrPXIp//X1CM=;
 b=OHSzk3peHLjw4O/M6xXJWWG6rn8xHbkMEglCO2qTNKqFapvoJV0mCacdSV5xOCqluR
 fkifzcA4/PAOqQxNEpBjyOs0AejYzflHq1T/JlwY/mZAG5TtWtnqHqMwi5ONvCbLsmUu
 zCR7RSqnREsJW5HWYFrG/7Z92Kik4gXY5dj319JwevtErB5Z/QbBVmgMHGsKGdXnZ+rQ
 PhYfay08F0DV6BIHeaOZ+3Pjvrl3D5cGk/k6ID/Hx4HgaffXxgDFn9uYRp9jWc8CGntG
 3M6gvuF1ZiKTnkB+fb+M9JF5OWUb3vPNv5lKUxZRNxxRttGTjAlLoLsvhmIgHKA7/Tsp
 GU4g==
X-Gm-Message-State: APjAAAV3THRH5sJtJqdKHuZmhymzlVKVjxZqR2x7pBDVKnnSo3avqMWo
 vQ4gTPjAuvXvLNsbTbw9qiLTneh0IzlFjQ==
X-Google-Smtp-Source: APXvYqyJgSY++v1K3lrnce95g5HCO5EuiqQGVK3sia/px0c0UbAdKZGfLxjhYID3yyfEJQyMhfsqwA==
X-Received: by 2002:a0c:ed4b:: with SMTP id v11mr22429302qvq.126.1560800831715; 
 Mon, 17 Jun 2019 12:47:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 375/459] drm/amd/display: Remove additional FEC link bandwidth
 reduction
Date: Mon, 17 Jun 2019 14:45:16 -0500
Message-Id: <20190617194540.18497-76-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9h4FtdTgXpfyrT+tmxsAgLKBiR/3wXNrPXIp//X1CM=;
 b=bmpZ5GOOw5XIXSX07tYFs4E08k+J/Qa8OUTCTs+TpVH7Cj5btzsQ350Vm2EDEELaCk
 p9Ig9djuHuEPrdDEddP7TzuCSqN0TVd/gEXJ2TNabB6aZ7nngRjuCKD7NC3pLDpGDmDu
 yk3rr9RPOuZt3DUHT+M8i1CR7YLLuUXWAuGv21w2mkO2rJFqdZLuw8W2SRbLeM7Hp7q3
 nc26ZiEpoj/mdgslkpZyyMKI1mgLKcIQtPPIw9tf3KZL7awTsskoGeuG+Ls11nUjC8Fm
 Y2AiiEv28NCgos9gGh56Z8po7eOuKFW9Qaw8j66TKSvcFGKJPCLURTnYK+SvsGxEAIba
 4gbg==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KVGhpcyBp
cyBub3cgZG9uZSBpbiB0aGUgb3JpZ2luYWwgbGluayBiYW5kd2lkdGggY2FsY3VsYXRpb24gYW5k
IERTQwptdXN0IG5vdCBkbyB0aGlzIGFueW1vcmUuCgpbaG93XQpSZW1vdmUgdGhlIGxpbmUgb2Yg
Y29kZSB0aGF0IHNob3VsZCBoYXZlIGJlZW4gcmVtb3ZlZCB3aGVuIHRyYW5zaXRpb24KdG8gY29y
cmVjdGx5IGFwcGx5aW5nIEZFQyBvdmVyaGVhZCB3YXMgbWFkZS4KClNpZ25lZC1vZmYtYnk6IE5p
a29sYSBDb3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFdlbmppbmcg
TGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJo
YXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZHNjL2RjX2RzYy5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZHNjL2RjX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9k
Y19kc2MuYwppbmRleCBlNzExOTdkMzVkNzkuLjQ3MWViOTg3Mzg4NSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kY19kc2MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCkBAIC0zMTEsMTkgKzMxMSwxOCBAQCBz
dGF0aWMgdm9pZCBnZXRfZHNjX2JhbmR3aWR0aF9yYW5nZSgKICAqCiAgKiBSZXR1cm5zOgogICog
ICAgIC0gJ3RydWUnIGlmIERTQyB3YXMgcmVxdWlyZWQgYnkgcG9saWN5IGFuZCB3YXMgc3VjY2Vz
c2Z1bGx5IGFwcGxpZWQKLSAqICAgICAtICdmYWxzZScgaWYgRFNDIHdhcyBub3QgbmVjZXNzYXJ5
IChlLmcuIGlmIHVuY29tcHJlc3NlZCBzdHJlYW0gZml0cyAndGFyZ2V0X2JhbmR3aWR0aCcpLAor
ICogICAgIC0gJ2ZhbHNlJyBpZiBEU0Mgd2FzIG5vdCBuZWNlc3NhcnkgKGUuZy4gaWYgdW5jb21w
cmVzc2VkIHN0cmVhbSBmaXRzICd0YXJnZXRfYmFuZHdpZHRoX2ticHMnKSwKICAqICAgICAgICBv
ciBpZiBpdCBjb3VsZG4ndCBiZSBhcHBsaWVkIGJhc2VkIG9uIERTQyBwb2xpY3kuCiAgKi8KIHN0
YXRpYyBib29sIGRlY2lkZV9kc2NfdGFyZ2V0X2JwcF94MTYoCiAJCWNvbnN0IHN0cnVjdCBkY19k
c2NfcG9saWN5ICpwb2xpY3ksCiAJCWNvbnN0IHN0cnVjdCBkc2NfZW5jX2NhcHMgKmRzY19jb21t
b25fY2FwcywKLQkJY29uc3QgaW50IHRhcmdldF9iYW5kd2lkdGgsCisJCWNvbnN0IGludCB0YXJn
ZXRfYmFuZHdpZHRoX2ticHMsCiAJCWNvbnN0IHN0cnVjdCBkY19jcnRjX3RpbWluZyAqdGltaW5n
LAogCQlpbnQgKnRhcmdldF9icHBfeDE2KQogewogCWJvb2wgc2hvdWxkX3VzZV9kc2MgPSBmYWxz
ZTsKIAlzdHJ1Y3QgZGNfZHNjX2J3X3JhbmdlIHJhbmdlOwotCWZsb2F0IHRhcmdldF9iYW5kd2lk
dGhfa2JwcyA9IHRhcmdldF9iYW5kd2lkdGggKiAwLjk3ZjsgLy8gMyUgb3ZlcmhlYWQgZm9yIEZF
QwogCiAJbWVtc2V0KCZyYW5nZSwgMCwgc2l6ZW9mKHJhbmdlKSk7CiAKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
