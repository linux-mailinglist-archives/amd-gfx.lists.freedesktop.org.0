Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C25D77D
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77D6E07B;
	Tue,  2 Jul 2019 20:29:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E9F6E073
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p15so35562qtl.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjKPB44JhSdTZRtB6zs//2Qlry65l9KCwtE6Laj1n+E=;
 b=q3tLmQTJAj4As0xvNNphhl+x//Nthh6baa6ceoe0hru7Dyz2/PfhXrBLFfmn0uD/yx
 aNE+bPdxkpvyXhxaE6A8hwcB+f3sCnOlyTXF+fzKsJRoAceiHcbSeDRxQD0WIt+ja/r+
 6T6elwFikwEFF6dYcn61i1F4hAT9iKEWGfRP20B8WbRZXRKcH/sJy/3nLd6s0MWixWYE
 ATIsmB6crWP0crsxlqIGqPLPkjKFGUHsNHzL6vMbBwTeTpwY01Q2TmLRF7UR353pI7WP
 IyvbOrvSsoWQV1/DxyXVj2qQpUQA3QdzHirdKhRatsSf/mPqJDUIKL5ZE5KfsW1krmGF
 8ITw==
X-Gm-Message-State: APjAAAWOEzWwmGImMm2B9n/j1eiDU23a/bPYo/A1Gpf7GMsb+kFLN9K8
 b+L+Ga3ZYbNzKfMQ5yd4qaQeQGoQolY=
X-Google-Smtp-Source: APXvYqz1gH51JxfFslKlqF7eSqmyAM1udsccYD8jtPH7RTxKPV3oqxKRo3ndsFL++5O16k1qyVOKNA==
X-Received: by 2002:ac8:3006:: with SMTP id f6mr27056150qte.122.1562099373784; 
 Tue, 02 Jul 2019 13:29:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 43/53] drm/amdgpu/mmhub2: set clock gating for navi14
Date: Tue,  2 Jul 2019 15:28:34 -0500
Message-Id: <20190702202844.17001-44-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjKPB44JhSdTZRtB6zs//2Qlry65l9KCwtE6Laj1n+E=;
 b=kdXAcGFhv/te1ZVbYrnoSL5aGHzdRTvxEiNAylezr5CZR2uxo227zWIHQ13k7YHLxr
 AVKXXZl94J5/Te/FjPk9rRMQsV1sN3pgqsB3C1h/jIBpBMCIxrNgN5xqyKfCohXI2n75
 fBuUJpiYuGveA7ll1vHWKnctizzlffJnScTHsgUcUD352EyWy7D1CVwqAkY/TwrVXwyi
 Yimf5fXISBR3LiO1NRIbqTcgJ1mVcFj9ootf7F9oMT0CtL/pFDWbnGgUol3jP8DDmfnX
 jfwf42p9H1KqUKFwRziR9lVyxsVqOWQWDGtesQ3/K0BdpkXNDxDPCXq+9dfvZlgBukrn
 Aztw==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbW1odWJfdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5j
CmluZGV4IDM3YTFhMzE4YWU2My4uMWEyMGMzYTBmNWEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbW1odWJfdjJfMC5jCkBAIC00MDUsNiArNDA1LDcgQEAgaW50IG1taHViX3YyXzBfc2V0
X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJ
CW1taHViX3YyXzBfdXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcoYWRldiwKIAkJCQlz
dGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7CiAJCW1taHViX3YyXzBf
dXBkYXRlX21lZGl1bV9ncmFpbl9saWdodF9zbGVlcChhZGV2LAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
