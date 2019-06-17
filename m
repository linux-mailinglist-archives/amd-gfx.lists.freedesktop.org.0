Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5F94900C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C6489EB4;
	Mon, 17 Jun 2019 19:46:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899FD89EA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:49 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so12291883qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK8NqNAIgjyiWE1c/MuEcGRIC+hm3jTa8ilz4MCoOQI=;
 b=U00ExPncQVKYB95kU5/Uc5UEFQQQjXrjKiu1Vjn392DzniYbgHPEcXgK/3ZM6JAVbf
 1t7P69lt72KDve/Mahd+LBQneKKkvS7ufCcnICVD3noqzE1JpzQkrK7qcoS2LpTXnMOY
 tBGyr3RsLJByQKZktHguVaKz0WjefrOKFybJL3EzyQsOTj4AFeZzcPoXKQluCmg69khC
 QU8BYGDLx1jxbtxJeLRho8fs9S54bUM8bbASOb72cFu6BK3G+JagzYJXnvFBVjhxL2gi
 ZoCCpnVd38gLX2tIDTSJ18pJq+C1ERkHkOdBENwCckdthsdFQYjWYfutRSTEmYrkomQE
 D73g==
X-Gm-Message-State: APjAAAUm2EN4Te2Jq6o17wmF572ThlMtKHkKx6A/VMaU6PJ7hjaeViSk
 DCPLdMGDjHQEd1IweMBLlRdMpM/b5KMHMA==
X-Google-Smtp-Source: APXvYqz4xZyI1SAyTW2DsUMu8onn0z/BKh6BaD0UdnGlG9J2AgEuD1skEVFdFDAwtRIgrWtgIMPgIA==
X-Received: by 2002:aed:222d:: with SMTP id n42mr16438774qtc.144.1560800807974; 
 Mon, 17 Jun 2019 12:46:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 350/459] drm/amd/display: do not power on eDP power rail early
Date: Mon, 17 Jun 2019 14:44:51 -0500
Message-Id: <20190617194540.18497-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK8NqNAIgjyiWE1c/MuEcGRIC+hm3jTa8ilz4MCoOQI=;
 b=sja3Tyvk/Nu6PTmsh1UCGg5LVkUDE3YmxclVzLriC9ysqz4JTbD8ioUhX+EVDeW1sj
 xsw/vMqH/EeY3GjontvbITD+aN0QfzqJLIn/E5yR8+tPiEF5LNFY1Nkd6AnKJY1GOaml
 ys4SQr7Aq9gLAI3vvolSYaGRZ1YssvtHZfREUYmdgj8GzLPoD9znmuK3G8Q4VRJM2iH/
 S4MxZOZPpOUXit+QT+MEXamNS+qbm/mub5/dxSYGRusmUZ/m+R42SOUqA9WiluhvmrLc
 8C85xuR3HnrSZp28xU2VZVMITB5wa55ZKht34RZ507GBuFuvx/PnPx++JDDX/xf/7XrO
 KwEA==
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpbV2h5XQpNb2Rlcm4gU3Rh
bmRieSBtYXkgdG9nZ2xlIGRpc3BsYXkgYWRhcHRlciBzdGF0ZSBiZXR3ZWVuIEQwCmFuZCBEMyBz
dGF0ZSB1bnByZWRpY3RhYmx5LgpCdXQgZXZlbnRzIHRoYXQgY2F1c2UgdHJhbnNpdGlvbiB0byBE
MCBhcmUgbm90IGFsd2F5cyByZXN1bHRpbmcKaW4gYSBkaXNwbGF5IGxpZ2h0IHVwIHNjZW5hcmlv
LgoKTW9kZXJuIGVEUCBwYW5lbHMgc2hvdWxkIGJlIGFibGUgdG8gcG93ZXIgb24gcGFuZWwgbG9n
aWMKcXVpY2tseSB1cG9uIFZERCBnb2luZyBoaWdoLiBCYXNlZCBvbiBzcGVjLCB0aGUgVDMgdGlt
ZQpiZXR3ZWVuIFZERCBvbiBhbmQgSFBEIGhpZ2ggY2FuIGJlIGJldHdlZW4gMCBhbmQgODAgbXMu
CgpEb2luZyBhbnkgdHJpY2t5IHNvcnRzIG9mIG9wdGltaXphdGlvbiBieSBwb3dlcmluZyBvbiBw
YW5lbApWREQgZWFybHkgZHVyaW5nIEQwIHRyYW5zaXRpb24gb24gY2FuIG5lZ2F0aXZlbHkgaW1w
YWN0IG90aGVyCmZlYXR1cmVzIGR1ZSB0byB1bm5lY2Vzc2FyeSBwb3dlciBkcmFpbiBhbmQgdG9n
Z2xpbmcgd2hlbgpmaW5hbCBzeXN0ZW0gc3RhdGUgZG9lcyBub3QgaW50ZW5kIGZvciB0aGUgcGFu
ZWwgdG8gYmUgbGl0IHVwLgoKV2UgbmVlZCBPRU1zIHRvIHNvdXJjZSBoaWdoZXIgZW5kIHBhbmVs
cyB0aGF0IGhhdmUgVDMgdGltZQpjbG9zZSB0byAwIGlmIHRoZXkgd2FudCBxdWljayBTMy9Nb2Rl
cm4gU3RhbmRieSByZXN1bWUgdGltZXMuCgpbSG93XQpSZW1vdmUgcGFuZWwgVkREIHBvd2VyIG9u
IGluIGluaXRfaHcKClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jCmluZGV4IDJhMzQ0NDcxMTJlOS4uZjZlMjVmNzVhMGE5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpA
QCAtNTQ3LDkgKzU0Nyw2IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2luaXRfaHcoc3RydWN0IGRjICpk
YykKIAkJCSAqLwogCQkJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBkYy0+bGlua3NbaV07CiAKLQkJ
CWlmIChsaW5rLT5saW5rX2VuYy0+Y29ubmVjdG9yLmlkID09IENPTk5FQ1RPUl9JRF9FRFApCi0J
CQkJZGMtPmh3c3MuZWRwX3Bvd2VyX2NvbnRyb2wobGluaywgdHJ1ZSk7Ci0KIAkJCWxpbmstPmxp
bmtfZW5jLT5mdW5jcy0+aHdfaW5pdChsaW5rLT5saW5rX2VuYyk7CiAJCX0KIAl9Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
