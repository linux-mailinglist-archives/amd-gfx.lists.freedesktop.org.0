Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D977E42A
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88136E7DD;
	Thu,  1 Aug 2019 20:30:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B612E6E7D8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:21 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m14so27408025qka.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5PCP32TDIA8ICe76zKP9dXB0UNFoV0bR+NK+MpCPEM=;
 b=dUcaQL+pQe+9yHEZCGVhHjbn3+EXqapeFv/aCVm5IQoUcTUWieZ8N0DgVc0/XaQMcs
 v0Iwccsa846hdK/BtBuX8ySDWs9/jN34MBXJrovU+7DxuXtgrXZwqo/u0xXBA5aor6t2
 djFOLPbI/2pZffwRpGNcGieH6v2qCbKvqE8beEZZb9bxgZMgLkGQuwS8tvxZokDzJ729
 CEDsypcYlW0SJGl9yk3nGllwTH5bIfWMRjw3XHv+l+18HX1US165iY9WvnU7zHzWMFhd
 5qvsYgZsFg0QfkLMh5YZg0mdriNxQL2Hv3ZqZwwN5HtHyXT4AZq3aSZHWnfrKkeIXf+L
 8uuw==
X-Gm-Message-State: APjAAAV9WUs3nnLdgNmxfpXk4maxCW9ZsXL/LvAHFOPJcVZ6Zgm9/tS6
 O7Bqmb8ZWQ5YfInYEcUzvm/NIs1T
X-Google-Smtp-Source: APXvYqwUYSCQiL3bky2B1Mzh37dJpqI2PzUk61yUbsXShinAUW02Za+XdM+VQ/X2ngnUbWxk51q0wA==
X-Received: by 2002:a37:91c2:: with SMTP id t185mr8089739qkd.193.1564691420655; 
 Thu, 01 Aug 2019 13:30:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/36] drm/amdgpu/gmc10: set gart size and vm size for navi12
Date: Thu,  1 Aug 2019 15:29:38 -0500
Message-Id: <20190801202957.29791-18-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5PCP32TDIA8ICe76zKP9dXB0UNFoV0bR+NK+MpCPEM=;
 b=ocrAAqUx6e/NGUZvej58tn+XZbPSrsT46e1oU9q58rv5Yll8I2bo+5P1GhKHCiC5HJ
 b48awb7Pnl+3K/FnPFWKFsEJTJ2OyxIYxv0C2ijQfC2zRmcPsaV+Jh461jA6PjtPhjeS
 ryiKs3yN3tE8qNo8Chu1M5Q0D3Ulif5ow6Kv2vn+bmcCP2otFL4rb/qkb43QlbalPPqQ
 looJfzFwD5rSc0pKVLDEoYtw2T9qUY9WEOEg3t0v8AKZcqDymvAsvekt2Ji26qJM0vZ7
 ilJUYIDKet+cnzrO4uMT4poDzH1+a55mZiMkOAzYE4U3asJAE+AoJJZiVTsatZp23CbU
 unbQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgb3RoZXIg
bmF2aSBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IGEwYmQxNGU5YjhmZS4uNGUzYWMxMDg0YTk0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwpAQCAtNTI1LDYgKzUyNSw3
IEBAIHN0YXRpYyBpbnQgZ21jX3YxMF8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJCWNhc2UgQ0hJUF9OQVZJMTA6CiAJ
CWNhc2UgQ0hJUF9OQVZJMTQ6CisJCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWRlZmF1bHQ6CiAJCQlh
ZGV2LT5nbWMuZ2FydF9zaXplID0gNTEyVUxMIDw8IDIwOwogCQkJYnJlYWs7CkBAIC02MDMsMTAg
KzYwNCwxMSBAQCBzdGF0aWMgaW50IGdtY192MTBfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAlz
d2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQ
X05BVkkxNDoKKwljYXNlIENISVBfTkFWSTEyOgogCQlhZGV2LT5udW1fdm1odWJzID0gMjsKIAkJ
LyoKIAkJICogVG8gZnVsZmlsbCA0LWxldmVsIHBhZ2Ugc3VwcG9ydCwKLQkJICogdm0gc2l6ZSBp
cyAyNTZUQiAoNDhiaXQpLCBtYXhpbXVtIHNpemUgb2YgTmF2aTEwL05hdmkxNCwKKwkJICogdm0g
c2l6ZSBpcyAyNTZUQiAoNDhiaXQpLCBtYXhpbXVtIHNpemUgb2YgTmF2aTEwL05hdmkxNC9OYXZp
MTIsCiAJCSAqIGJsb2NrIHNpemUgNTEyICg5Yml0KQogCQkgKi8KIAkJYW1kZ3B1X3ZtX2FkanVz
dF9zaXplKGFkZXYsIDI1NiAqIDEwMjQsIDksIDMsIDQ4KTsKQEAgLTcyMSw2ICs3MjMsNyBAQCBz
dGF0aWMgdm9pZCBnbWNfdjEwXzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05B
VkkxMDoKIAljYXNlIENISVBfTkFWSTE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWJyZWFrOwog
CWRlZmF1bHQ6CiAJCWJyZWFrOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
